-- The definition of the tables in the database
CREATE SCHEMA records;

CREATE TABLE records.cities (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE records.students (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  city_id INTEGER,
  CONSTRAINT `fk_city_id` FOREIGN KEY(city_id) REFERENCES records.cities (id) ON DELETE SET NULL,
  age INTEGER,
  phone_number VARCHAR(18)
);

CREATE TABLE records.landlords (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL
);

CREATE TABLE records.rental_property (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  address TEXT NOT NULL,
  city_id INTEGER,
  coordinate POINT,
  bedroom INTEGER NOT NULL,
  bathroom INTEGER NOT NULL,
  kitchen INTEGER NOT NULL,
  monthly_cost DECIMAL NOT NULL,
  shared_accomodation BOOLEAN NOT NULL,
  description VARCHAR(120) NOT NULL,
  landlord_id INTEGER,
  postcode VARCHAR(30),
  CONSTRAINT `fk_landlord_id` FOREIGN KEY(landlord_id) REFERENCES records.landlords (id) ON DELETE SET NULL,
  CONSTRAINT `fk_rental_city_id` FOREIGN KEY(city_id) REFERENCES records.cities (id) ON DELETE SET NULL
);

CREATE TABLE records.rental_appointment (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  student_id INTEGER,
  rental_property_id INTEGER,
  viewing_time TIMESTAMP NOT NULL,
  status VARCHAR(15) DEFAULT 'appointment', -- rejected or accepted statuses
  created_at TIMESTAMP DEFAULT now(),
  CONSTRAINT `fk_appointment_student_id` FOREIGN KEY(student_id) REFERENCES records.students (id) ON DELETE SET NULL,
  CONSTRAINT `fk_appointment_rental_id` FOREIGN KEY(rental_property_id) REFERENCES records.rental_property (id) ON DELETE SET NULL
);

CREATE TABLE records.student_search_time (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  student_id INTEGER,
  academic_year VARCHAR(4) NOT NULL DEFAULT '2022',
  term VARCHAR(1) NOT NULL DEFAULT '1', 
  start_date TIMESTAMP DEFAULT NOW(),
  CONSTRAINT `unique_student_per_calendar` UNIQUE (student_id, academic_year, term)
);
