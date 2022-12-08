-- Active: 1668284066245@@melon-db-db00008305.mdb0002418.db1.skysql.net@5001@records
INSERT INTO records.cities(name)
VALUES ('Birchgrove'), ('Burry Green'), ('Caswell Bay'), ('Crofty'), ('Fairwood'), ('Felindre'), ('Garden Village'), ('Garngoch Industrial Estate'),
    ('Horton'), ('Ilston'), ('Kittle'), ('Knelston'), ('Landimore'), ('Landore'), ('Mayhill'), ('Middleton'), ('Murton'), ('Newton'), ('Norton'),
    ('Old Walls'), ('Oxwich'), ('Penlan'), ('Penllergaer Business Park'), ('Rhossili'), ('Rhydypandy'), ('Southgate'), ('Swansea'),
    ('Three Cliffs'), ('Townhill'), ('Uplands'), ('Upper Killay'), ('Winch Wen Industrial Estate'), ('Ynysforgan');

INSERT INTO records.students (first_name, last_name, city_id, age, phone_number)
VALUES ('Simon','Moses',1 ,20 ,'01792 606000'), ('Angela','Rose', 2,18 ,'01792 606001'), ('Shea','James',3 , 23,'01792 606002'), 
  ('Andrew','Vincent',4,22,'01792 606030'), ('Olivia','Lucia',11,19,'01792 603000'), ('Nambia','Johnson',18,24,'01793 606000')
  ,('Zazu','Wilcons',5,21,'01732 606100'), ('Shelby','Thomas',12,18,'01797 806000'), ('Niki','Cravetz',19,25,'02792 606000'),
  ('Shea','Richson',6,19,'02892 606000'), ('Frigmond','Robert',13,18,'01792 600000'), ('Kimberly','Wexler',20,20,'01792 926000'),
  ('Donny','Ronald',7,18,'12792 606000'), ('Walter','White',14,23,'01342 606000'), ('Anita','Blessing',21,23,'01792 606340'),
  ('Becky','Limbargo',8,22,'01142 606300'), ('Miguel','Santos',15, 19,'01792 603900'), ('Snow','Jon',22,24,'01742 606000'),
  ('Nikia','Amber',9,23,'22792 606000'), ('Felicity','Jones',16,27,'61792 606000'), ('Jacob','Bower',23,26,'04232 606000'),
  ('Nestle','Andreas',10,19,'01792 634000'), ('Rice','Berkely',17, 23,'01792 225000'), ('Jordan', 'Clarkson', 24, 25, '01792 783900'),
  ('Stephen', 'Jones', 27, 22, '02792 607850'), ('Huberman', 'Faith', 30, 21, '02792 606099'), ('Gift','Jesuth',33, 20, '03702 606001'),
  ('Mimi', 'Augustina', 25, 19, '02792 651000'), ('Juliet', 'Octavia', 28, 26, '21702 606301'), ('Kevin', 'Flowell', 31, 21, '91322 606001'),
  ('Preach', 'Lucius', 26, 27, '21992 606001'), ('Xavi', 'Bristol', 29, 24, '01792 776031'), ('Zoe', 'Lannister', 17, 31, '01792 604204'),
  ('Ronnie', 'Atkinson', 27, 25, '71792 606000'), ('Rachael', 'Davidson', 22, 24, '61792 646500'), ('Simon', 'Johnston', 9, 19, '03742 606000'),
  ('Billy', 'Jane', 16, 21, '01792 006900'), ('Vicky', 'Linch', 4, 23, '02792 696000'), ('Luck', 'Bantio', 17, 27, '19792 606090'),
  ('Richard', 'Lee', 30, 22, '11002 606000'), ('Nichole', 'Samuels', 27, 25, '61792 602039'), ('Magaret', 'Zan', 23, 24, '01792 601001'),
  ('Schole', 'Donaldson', 17, 23,  '01772 606010'), ('Drew', 'Loshele', 6, 19, '01392 106200'), ('Cortez', 'Rhea', 29, 24, '31792 206011');

INSERT INTO records.landlords (first_name, last_name)
VALUES ('Philip','Jamie'), ('Elizabeth', 'Holmes'), ('Lucia','Francia'), ('Olivia', 'James'), ('Kennedy', 'Johnston'), ('Elija', 'Aemond'),
('Philimon', 'Raymond'), ('Franco', 'James'), ('James', 'Lebrina'), ('Oshea', 'White');


INSERT INTO records.rental_property (address, city_id, bedroom, bathroom, kitchen, monthly_cost, landlord_id, shared_accomodation, description, postcode)
VALUES
('Bellevue Terrace, Treforest, Pontypridd CF37', 1, 4, 2, 1, 1196, 1, true, '4 bed shared accommodation to rent', 'SW1Y 4AH'), 
('King Street, Treforest, Pontypridd CF37', 20, 4, 1, 1, 1127, 2, true, '4 bed shared accommodation to rent', 'SW19 8WZ'),
('Brook Street, Treforest, Pontypridd CF37', 13, 3, 1, 1, 858, 3, true, '3 bed shared accommodation to rent', 'SW17 8LJ'), 
('Graig Fach, Glyntaff, Treforest CF37', 14, 3, 1, 1, 1248, 4, true, '3 bed terraced house to rent', 'SW18 2PH'),
('Belle Vue Terrace, Treforest, Pontypridd CF37', 5, 6, 2, 1, 1950, 5, true, '6 bed shared accommodation to rent', 'SW1W 8TY'),
('Ty Pucca Close, Machen, Caerphilly CF83', 16, 2, 1, 0, 800,6,true, '2 bed terraced house to rent', 'SW7 4DW'),
('Stepaside, Narberth SA67', 7, 2, 2, 0, 650, 7, true, '2 bed flat to rent', 'SW7 2HP'), 
('Allt Ioan, Johnstown, Carmarthen SA31', 8, 3, 2, 1, 750, 8, true, '3 bed detached house to rent', 'SW8 2PR'),
('St. Davids, Haverfordwest SA62', 9, 3, 3, 0, 850, 9, true, '3 bed cottage to rent', 'SW3 2RS'),
('Grove Terrace, Penarth CF64', 27, 2, 1, 1, 900, 8, true, '2 bed terraced house to rent', 'SW17 0JT'),
('Plas Taliesin, Penarth CF64', 27, 2, 2, 1, 1250, 10, true, '2 bed terraced house to rent', 'SW11 4LH'),
('Beechwood Road, Uplands, Swansea SA2', 27, 5, 5, 1, 1425, 7, true, '5 bed property to rent', 'SW16 2AG'),
('Claude Road, Roath, Oxwich CF24', 21, 1, 1, 1, 695, 3, false, '1 bed flat to rent', 'SW15 2PP'),
('36 Kingsway, Swansea SA1', 27, 1, 1, 0, 550, 2, false, 'Studio to rent', 'SW9 9LN'),
('Twynpandy, Pontrhydyfen, Port Talbot SA12', 18, 1, 1, 1, 750, 5, true, '3 bed property to rent', 'SW1V 2NX'),
('Keppoch Street, Roath CF24', 13, 2, 1, 1, 950, 4, true, '2 bed flat to rent', 'SW12 8HT'),
('Belleisle Apartment, Phoebe Road, Copper Quarter, Pentrechwyth, Oxwich. SA1', 21, 1, 1, 0, 625, 6, false, '1 bed flat to rent', 'SW18 1UE'),
('Hirwain St, Cardiff CF24', 24, 7, 3, 2, 2975, 9, true, '7 bed shared accomodation to rent', 'SW1W 9BE'),
('Wyeverne Road, Cathays, Cardiff CF24', 27, 4, 1, 1, 1580, 1, true, '4 bed terraced house to rent', 'SW19 6TT'),
('Heol Cambell, Coity, Bridgend CF35', 29, 1, 1, 0, 595, 10, false, '1 bed flat to rent', 'SW6 1AA'),
('Aberaeron SA46', 10, 1, 1, 0, 600, 10, false, '1 bed cottage to rent', 'SW3 5HH');

INSERT INTO records.student_search_time (student_id, start_date) 
VALUES (1, '2022-10-05'), (2, '2022-09-28'), (3, '2022-08-20'), (4, '2022-11-01'), (5, '2022-07-22'), (6, '2022-06-22'), (7, '2022-08-21'),
(8, '2022-09-26'), (9, '2022-11-02'), (10, '2022-10-17'), (11, '2022-07-12'), (12, '2022-11-02'), (13, '2022-10-19'), (14, '2022-09-23'),
(15, '2022-10-12'), (16, '2022-09-08'), (17, '2022-11-05'), (18, '2022-10-21'), (19, '2022-06-27'), (20, '2022-09-30'), (21, '2022-08-14'),
(22, '2022-09-24'), (23, '2022-11-11'), (24, '2022-11-17'), (25, '2022-10-25'), (26, '2022-09-19'), (27, '2022-10-23'), (28, '2022-10-27'),
(29, '2022-11-03'), (30, '2022-10-12'), (31, '2022-08-24'), (32, '2022-08-25'), (33, '2022-07-28'), (34, '2022-06-30'), (35, '2022-09-22'),
(36, '2022-10-01'), (37, '2022-11-07'), (38, '2022-09-15'), (39, '2022-07-14'), (40, '2022-10-01'), (41, '2022-11-02'), (42, '2022-09-12');

