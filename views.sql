-- VIEW 1: Rental demand system
CREATE OR REPLACE VIEW records.rental_demand AS (
  SELECT s.id, first_name, last_name, age, start_date, TIMESTAMPDIFF(DAY, start_date, NOW()) as days 
  FROM records.student_search_time t
  LEFT JOIN records.students s on s.id = t.student_id
  LEFT JOIN records.rental_appointment a on a.student_id = s.id
  WHERE s.id NOT IN (
    SELECT student_id
    FROM records.rental_appointment
    WHERE status IN ('accepted', 'appointment') -- student has to reject a pending appointment before getting rescheduled for another
    GROUP BY student_id
  ) OR status IS NULL
  GROUP BY s.id ORDER BY days DESC
);

SELECT * FROM records.rental_demand;

-- VIEW 2: match-and-rent
CREATE OR REPLACE VIEW records.match_and_rent AS
  -- get free bookings from each rental
  with available_properties AS (
    SELECT p.id, p.description, p.bedroom, ag.units_booked FROM records.rental_property p
    LEFT JOIN records.rental_appointment a on p.id = a.rental_property_id
    LEFT JOIN (
      SELECT ra.rental_property_id, COUNT(*) as units_booked
      FROM records.rental_appointment ra
      WHERE ra.status = 'accepted'
      GROUP BY ra.rental_property_id
    ) ag on ag.rental_property_id = p.id
    WHERE p.bedroom != COALESCE(ag.units_booked, 0)
    ORDER BY rand()
  ),
  top_five AS (
    SELECT 
      d.id 
    FROM records.rental_demand d
    LIMIT 5
  ),
  match_student_to_property AS (
    SELECT 
      d.id as student_id, 
      ap.id as rental_property_id
    FROM top_five d
    CROSS JOIN available_properties ap ORDER BY rand()
  )
  SELECT
    student_id, 
    rental_property_id as rental_property_id, 
    NOW() + interval floor((48*60*60)*rand()) second as viewing_time 
  FROM match_student_to_property
  GROUP BY student_id;

SELECT * FROM records.match_and_rent;

-- add new appointments based on match_and_rent recommendation
-- The table I insert below is where data is persisted for every appointment
-- I use the table to track the rental appointment history for every student
INSERT INTO records.rental_appointment (student_id, rental_property_id, viewing_time)
SELECT * FROM records.match_and_rent;

-- VIEW 3: rental Tracker
CREATE OR REPLACE VIEW records.rental_tracker AS
  WITH accepted_rentals AS (
    SELECT 
      rental_property_id,
      COUNT(*) as bookings 
    FROM records.rental_appointment a
    WHERE a.status = 'accepted'
    GROUP BY a.rental_property_id
  ),
  units_left AS (
    SELECT 
      rental_property_id,
      bookings,
      (bedroom - bookings) as units_left
    FROM accepted_rentals r
    LEFT JOIN records.rental_property p on r.rental_property_id = p.id
  ),
  other_scheduled_students AS (
    SELECT
      s.id,
      CONCAT(SUBSTRING(s.first_name, 1, 1), '. ', s.last_name) as name,
      s.phone_number,
      a.rental_property_id,
      units_left
    FROM records.students s
    LEFT JOIN records.rental_appointment a on a.student_id = s.id
    LEFT JOIN units_left u on u.rental_property_id = a.rental_property_id
    WHERE a.rental_property_id IN (
      SELECT rental_property_id FROM accepted_rentals
    ) AND a.status != 'accepted'
    GROUP BY s.id, rental_property_id
  )
-- get list of students to contact if a rental has been accepted by a person
SELECT * FROM other_scheduled_students ORDER BY id;

SELECT * FROM records.rental_tracker;

-- VIEW 4: System efficacy
CREATE OR REPLACE VIEW records.system_efficacy AS (
  SELECT 
    CONCAT(SUBSTRING(first_name, 1, 1), '. ', last_name) as name,
    COUNT(*) AS rentals_rejected
  FROM records.rental_appointment a
  LEFT JOIN records.students s on s.id = a.student_id
  WHERE status = 'rejected' GROUP BY student_id
);

SELECT * FROM records.system_efficacy;

-- VIEW 5: Renter Report
CREATE OR REPLACE VIEW records.renter_report AS (
  SELECT 
    p.postcode,
    l.last_name AS surname,
    COUNT(*) as rejection_count
  FROM records.rental_appointment a 
  LEFT JOIN records.rental_property p on a.rental_property_id = p.id 
  LEFT JOIN records.landlords l on p.landlord_id = l.id
  WHERE a.status = 'rejected'
  GROUP BY a.rental_property_id
);

SELECT * FROM records.renter_report;
