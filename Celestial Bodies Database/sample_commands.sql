                                              Table "public.galaxy"
+------------------------+-------------------+-----------+----------+-------------------------------------------+
|         Column         |       Type        | Collation | Nullable |                  Default                  |
+------------------------+-------------------+-----------+----------+-------------------------------------------+
| galaxy_id              | integer           |           | not null | nextval('galaxy_galaxy_id_seq'::regclass) |
| name                   | character varying |           | not null |                                           |
| age_in_million_years   | integer           |           |          |                                           |
| diameter_in_kiloparsec | integer           |           |          |                                           |
| distance_from_earth    | numeric           |           |          |                                           |
| description            | text              |           |          |                                           |
| is_dwarf               | boolean           |           |          |                                           |
| is_elliptical          | boolean           |           |          |                                           |
+------------------------+-------------------+-----------+----------+-------------------------------------------+
Indexes:
    "galaxy_pkey" PRIMARY KEY, btree (galaxy_id)
    "galaxy_name_key" UNIQUE CONSTRAINT, btree (name)
Referenced by:
    TABLE "star" CONSTRAINT "star_galaxy_id_fkey" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)

universe=> INSERT INTO galaxy(name, age_in_million_years, diameter_in_kiloparsec, distance_from_earth, description, is_dwarf, is_elliptical)
universe-> VALUES
universe-> 
universe=> ALTER TABLE galaxy RENAME COLUMN distance_from_earth TO distance_from_earth_in_light_years;
ALTER TABLE
universe=> ALTER TABLE star  RENAME COLUMN distance_from_earth TO distance_from_earth_in_light_years;
ALTER TABLE
universe=> ALTER TABLE planet  RENAME COLUMN distance_from_earth TO distance_from_earth_in_light_years;
ALTER TABLE
universe=> ALTER TABLE moon  RENAME COLUMN distance_from_earth TO distance_from_earth_in_light_years;
ALTER TABLE
universe=> \d galaxy;
                                                    Table "public.galaxy"
+------------------------------------+-------------------+-----------+----------+-------------------------------------------+
|               Column               |       Type        | Collation | Nullable |                  Default                  |
+------------------------------------+-------------------+-----------+----------+-------------------------------------------+
| galaxy_id                          | integer           |           | not null | nextval('galaxy_galaxy_id_seq'::regclass) |
| name                               | character varying |           | not null |                                           |
| age_in_million_years               | integer           |           |          |                                           |
| diameter_in_kiloparsec             | integer           |           |          |                                           |
| distance_from_earth_in_light_years | numeric           |           |          |                                           |
| description                        | text              |           |          |                                           |
| is_dwarf                           | boolean           |           |          |                                           |
| is_elliptical                      | boolean           |           |          |                                           |
+------------------------------------+-------------------+-----------+----------+-------------------------------------------+
Indexes:
    "galaxy_pkey" PRIMARY KEY, btree (galaxy_id)
    "galaxy_name_key" UNIQUE CONSTRAINT, btree (name)
Referenced by:
    TABLE "star" CONSTRAINT "star_galaxy_id_fkey" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)

universe=> INSERT INTO galaxy(name, age_in_million_years, diameter_in_kiloparsec, distance_from_earth_in_light_years, description, is_dwarf, is_elliptical)
universe-> VALUES
universe-> ('Milky Way, 13160, 27, 26670, 'The Milky Way is the galaxy that includes the Solar System, with the name describing the galaxy's appearance from Earth', TRUE, FALSE);
ERROR:  syntax error at or near "The"
LINE 3: ('Milky Way, 13160, 27, 26670, 'The Milky Way is the galaxy ...
                                        ^
universe=> INSERT INTO galaxy(name, age_in_million_years, diameter_in_kiloparsec, distance_from_earth_in_light_years, description, is_dwarf, is_elliptical)
VALUES
('Milky Way, 13160, 27, 26670,''The Milky Way is the galaxy that includes the Solar System, with the name describing the galaxy's appearance from Ea
rth'', TRUE, FALSE);
universe-> ;
ERROR:  syntax error at or near ";"
LINE 2: ;
        ^
universe=> INSERT INTO galaxy(name, age_in_million_years, diameter_in_kiloparsec, distance_from_earth_in_light_years, description, is_dwarf, is_elliptical)
universe-> VALUES
universe-> ('Milky Way, 13160, 27, 26670,''The Milky Way is the galaxy that includes the Solar System, with the name describing the galaxy's appearance from Ea
universe(> 
universe=> INSERT INTO galaxy(name, age_in_million_years, diameter_in_kiloparsec, distance_from_earth_in_light_years, description, is_dwarf, is_elliptical)
universe-> VALUES
universe-> INSERT INTO galaxy(name, age_in_million_years, diameter_in_kiloparsec, distance_from_earth_in_light_years, description, is_dwarf, is_elliptical)
;
universe-> ;
ERROR:  syntax error at or near "INSERT"
LINE 3: INSERT INTO galaxy(name, age_in_million_years, diameter_in_k...
        ^
universe=> INSERT INTO galaxy(name, age_in_million_years, diameter_in_kiloparsec, distance_from_earth_in_light_years, description, is_dwarf, is_elliptical)
VALUES
INSERT INTO galaxy(name, age_in_million_years, diameter_in_kiloparsec, distance_from_earth_in_light_years, description, is_dwarf, is_elliptical)
;
[2]+  Stopped                 psql --username=freecodecamp --dbname=postgres
camper: /project$ psql --username=freecodecamp --dbname=postgres
Border style is 2.
Pager usage is off.
psql (12.17 (Ubuntu 12.17-1.pgdg22.04+1))
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
Type "help" for help.

postgres=> \;
postgres-> \l
                                 List of databases
+-----------+--------------+----------+---------+---------+-----------------------+
|   Name    |    Owner     | Encoding | Collate |  Ctype  |   Access privileges   |
+-----------+--------------+----------+---------+---------+-----------------------+
| postgres  | postgres     | UTF8     | C.UTF-8 | C.UTF-8 |                       |
| template0 | postgres     | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
|           |              |          |         |         | postgres=CTc/postgres |
| template1 | postgres     | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
|           |              |          |         |         | postgres=CTc/postgres |
| universe  | freecodecamp | UTF8     | C.UTF-8 | C.UTF-8 |                       |
+-----------+--------------+----------+---------+---------+-----------------------+
(4 rows)

postgres-> \c universe;
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
You are now connected to database "universe" as user "freecodecamp".
universe-> \d
                        List of relations
+--------+----------------------------+----------+--------------+
| Schema |            Name            |   Type   |    Owner     |
+--------+----------------------------+----------+--------------+
| public | galaxy                     | table    | freecodecamp |
| public | galaxy_galaxy_id_seq       | sequence | freecodecamp |
| public | moon                       | table    | freecodecamp |
| public | moon_moon_id_seq           | sequence | freecodecamp |
| public | planet                     | table    | freecodecamp |
| public | planet_planet_id_seq       | sequence | freecodecamp |
| public | satellite                  | table    | freecodecamp |
| public | satellite_satellite_id_seq | sequence | freecodecamp |
| public | star                       | table    | freecodecamp |
| public | star_star_id_seq           | sequence | freecodecamp |
+--------+----------------------------+----------+--------------+
(10 rows)

universe-> ;
universe=> INSERT INTO galaxy(name, age_in_million_years, diameter_in_kiloparsec, distance_from_earth_in_light_years, description, is_dwarf, is_elliptical) VALUES('Milky Way', 13160, 27, 26670,''The Milky Way is the galaxy that includes the Solar System, with the name describing the galaxy's appearance from Earth'', TRUE, FALSE);
universe'> ;
universe'> 
universe=> SELECT * FROM galaxy
universe-> ;
+-----------+------+----------------------+------------------------+------------------------------------+-------------+----------+---------------+
| galaxy_id | name | age_in_million_years | diameter_in_kiloparsec | distance_from_earth_in_light_years | description | is_dwarf | is_elliptical |
+-----------+------+----------------------+------------------------+------------------------------------+-------------+----------+---------------+
+-----------+------+----------------------+------------------------+------------------------------------+-------------+----------+---------------+
(0 rows)

universe=> INSERT INTO galaxy(name, age_in_million_years, diameter_in_kiloparsec, distance_from_earth_in_light_years, description, is_dwarf, is_elliptical) VALUES('Milky Way', 13160, 27, 26670,'The Milky Way is the galaxy that includes the Solar System, with the name describing the galaxy''s appearance from Earth', TRUE, FALSE);
INSERT 0 1
universe=> SELECT * FROM galaxy
;
universe-> ;
+-----------+-----------+----------------------+------------------------+------------------------------------+-------------------------------------------------------------------------------------------------------------------------+----------+---------------+
| galaxy_id |   name    | age_in_million_years | diameter_in_kiloparsec | distance_from_earth_in_light_years |                                                       description                                                       | is_dwarf | is_elliptical |
+-----------+-----------+----------------------+------------------------+------------------------------------+-------------------------------------------------------------------------------------------------------------------------+----------+---------------+
|         1 | Milky Way |                13160 |                     27 |                              26670 | The Milky Way is the galaxy that includes the Solar System, with the name describing the galaxy's appearance from Earth | t        | f             |
+-----------+-----------+----------------------+------------------------+------------------------------------+-------------------------------------------------------------------------------------------------------------------------+----------+---------------+
(1 row)

universe=> INSERT INTO galaxy(name, age_in_million_years, diameter_in_kiloparsec, distance_from_earth_in_light_years, description, is_dwarf, is_elliptical) VALUES('Andromeda', 10000, 61, 2480000 ,'Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now', TRUE, FALSE);
INSERT 0 1
universe=> SELECT * FROM galaxy;
+-----------+-----------+----------------------+------------------------+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------+----------+---------------+
| galaxy_id |   name    | age_in_million_years | diameter_in_kiloparsec | distance_from_earth_in_light_years |                                                             description                                                              | is_dwarf | is_elliptical |
+-----------+-----------+----------------------+------------------------+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------+----------+---------------+
|         1 | Milky Way |                13160 |                     27 |                              26670 | The Milky Way is the galaxy that includes the Solar System, with the name describing the galaxy's appearance from Earth              | t        | f             |
|         2 | Andromeda |                10000 |                     61 |                            2480000 | Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now | t        | f             |
+-----------+-----------+----------------------+------------------------+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------+----------+---------------+
(2 rows)

universe=> INSERT INTO galaxy (name, age_in_million_years, diameter_in_kiloparsec, distance_from_earth_in_light_years, description, is_dwarf,is_elliptical) VALUES ('Condor', 5003 , 220, 212000000 ,'The largest known spiral galaxy. It is tidally disturbed by the smaller lenticular galaxy IC 4970', TRUE, FALSE), ('Cosmos Redshift 7', 800, 3 , 12900,'Galaxy Cosmos Redshift 7 is reported to be the brightest of distant galaxies and to contain some of the earliest first stars', FALSE, FALSE), ('Large Magellanic Cloud', 1500 , 14 , 163000  ,'The Large Magellanic Cloud is a satellite galaxy of the Milky Way. It is one of the nearest galaxies to the Milky Way and is visible in the southern hemisphere. ', TRUE, FALSE),('Bode''s Galaxy', 12500 , 28 , 11800000 ,' Bode''s Galaxy is a grand design spiral galaxy located in the constellation Ursa Major. It is one of the brightest galaxies in the Messier catalog. ', FALSE, FALSE);
INSERT 0 4
universe=> SELECT * FROM galaxy;
+-----------+------------------------+----------------------+------------------------+------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------+---------------+
| galaxy_id |          name          | age_in_million_years | diameter_in_kiloparsec | distance_from_earth_in_light_years |                                                                            description                                                                            | is_dwarf | is_elliptical |
+-----------+------------------------+----------------------+------------------------+------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------+---------------+
|         1 | Milky Way              |                13160 |                     27 |                              26670 | The Milky Way is the galaxy that includes the Solar System, with the name describing the galaxy's appearance from Earth                                           | t        | f             |
|         2 | Andromeda              |                10000 |                     61 |                            2480000 | Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now                              | t        | f             |
|         3 | Condor                 |                 5003 |                    220 |                          212000000 | The largest known spiral galaxy. It is tidally disturbed by the smaller lenticular galaxy IC 4970                                                                 | t        | f             |
|         4 | Cosmos Redshift 7      |                  800 |                      3 |                              12900 | Galaxy Cosmos Redshift 7 is reported to be the brightest of distant galaxies and to contain some of the earliest first stars                                      | f        | f             |
|         5 | Large Magellanic Cloud |                 1500 |                     14 |                             163000 | The Large Magellanic Cloud is a satellite galaxy of the Milky Way. It is one of the nearest galaxies to the Milky Way and is visible in the southern hemisphere.  | t        | f             |
|         6 | Bode's Galaxy          |                12500 |                     28 |                           11800000 |  Bode's Galaxy is a grand design spiral galaxy located in the constellation Ursa Major. It is one of the brightest galaxies in the Messier catalog.               | f        | f             |
+-----------+------------------------+----------------------+------------------------+------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------+---------------+
(6 rows)

universe=> \d star;
                                                     Table "public.star"
+------------------------------------+-----------------------+-----------+----------+---------------------------------------+
|               Column               |         Type          | Collation | Nullable |                Default                |
+------------------------------------+-----------------------+-----------+----------+---------------------------------------+
| star_id                            | integer               |           | not null | nextval('star_star_id_seq'::regclass) |
| name                               | character varying(40) |           | not null |                                       |
| age_in_million_years               | integer               |           |          |                                       |
| diameter                           | integer               |           |          |                                       |
| distance_from_earth_in_light_years | numeric               |           |          |                                       |
| description                        | text                  |           |          |                                       |
| is_variable_star                   | boolean               |           |          |                                       |
| type                               | character(1)          |           |          |                                       |
| is_dwarf                           | boolean               |           |          |                                       |
| galaxy_id                          | integer               |           | not null |                                       |
+------------------------------------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "star_pkey" PRIMARY KEY, btree (star_id)
    "star_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "star_galaxy_id_fkey" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
Referenced by:
    TABLE "planet" CONSTRAINT "planet_star_id_fkey" FOREIGN KEY (star_id) REFERENCES star(star_id)

universe=> INSERT INTO star (name, age_in_million_years, diameter, distance_from_earth_in_light_years, description, is_variable_star, type, is_dwarf, galaxy_id) VALUES ('Sirius', 230, 1711000, 0, 'Sirius is the brightest star in the night sky and is part of the constellation Canis Major. It is a binary star system consisting of a main-sequence star, Sirius A, and a white dwarf companion, Sirius B.', FALSE, A, FALSE, 1), ('Alpha Centauri A', 6000 , 1200000 , 4, 'Alpha Centauri A is the primary star in the Alpha Centauri star system, which is the closest star system to the Solar System.', FALSE, G, FALSE, 1), ('Betelgeuse', 8, 950000000, 643, 'Betelgeuse is a red supergiant star located in the constellation Orion. It is one of the largest and most luminous stars known, with a highly variable brightness.', TRUE, M, FALSE, 1), ('M31 V1', 10000 , 3220, 2, 'M31 V1 is a variable star located in the Andromeda Galaxy (M31). It is classified as a Cepheid variable star and is used as a standard candle to measure cosmic distances.', TRUE, F, TRUE, 2), ('Andromeda II-A1',9800 , 2300 , 2 , 'Andromeda II-A1 is a red giant star located in the Andromeda II dwarf spheroidal galaxy, a satellite galaxy of the Andromeda Galaxy (M31).', FALSE, K, TRUE, 2), ('Andromeda III-B1',9700 ,2180 ,2 , 'Andromeda III-B1 is a blue giant star located in the Andromeda III dwarf spheroidal galaxy, another satellite galaxy of the Andromeda Galaxy', FALSE, O, TRUE, 2);
ERROR:  column "a" does not exist
LINE 1: ..., and a white dwarf companion, Sirius B.', FALSE, A, FALSE, ...
                                                             ^
universe=> INSERT INTO star (name, age_in_million_years, diameter, distance_from_earth_in_light_years, description, is_variable_star, type, is_dwarf, galaxy_id) VALUES ('Sirius', 230, 1711000, 0, 'Sirius is the brightest star in the night sky and is part of the constellation Canis Major. It is a binary star system consisting of a main-sequence star, Sirius A, and a white dwarf companion, Sirius B.', FALSE, 'A', FALSE, 1), ('Alpha Centauri A', 6000 , 1200000 , 4, 'Alpha Centauri A is the primary star in the Alpha Centauri star system, which is the closest star system to the Solar System.', FALSE, 'G', FALSE, 1), ('Betelgeuse', 8, 950000000, 643, 'Betelgeuse is a red supergiant star located in the constellation Orion. It is one of the largest and most luminous stars known, with a highly variable brightness.', TRUE, 'M', FALSE, 1), ('M31 V1', 10000 , 3220, 2, 'M31 V1 is a variable star located in the Andromeda Galaxy (M31). It is classified as a Cepheid variable star and is used as a standard candle to measure cosmic distances.', TRUE, 'F', TRUE, 2), ('Andromeda II-A1',9800 , 2300 , 2 , 'Andromeda II-A1 is a red giant star located in the Andromeda II dwarf spheroidal galaxy, a satellite galaxy of the Andromeda Galaxy (M31).', FALSE, 'K', TRUE, 2), ('Andromeda III-B1',9700 ,2180 ,2 , 'Andromeda III-B1 is a blue giant star located in the Andromeda III dwarf spheroidal galaxy, another satellite galaxy of the Andromeda Galaxy', FALSE, 'O', TRUE, 2);
INSERT 0 6
universe=> SELECT * FROM star;
+---------+------------------+----------------------+-----------+------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------+------+----------+-----------+
| star_id |       name       | age_in_million_years | diameter  | distance_from_earth_in_light_years |                                                                                                 description                                                                                                 | is_variable_star | type | is_dwarf | galaxy_id |
+---------+------------------+----------------------+-----------+------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------+------+----------+-----------+
|       1 | Sirius           |                  230 |   1711000 |                                  0 | Sirius is the brightest star in the night sky and is part of the constellation Canis Major. It is a binary star system consisting of a main-sequence star, Sirius A, and a white dwarf companion, Sirius B. | f                | A    | f        |         1 |
|       2 | Alpha Centauri A |                 6000 |   1200000 |                                  4 | Alpha Centauri A is the primary star in the Alpha Centauri star system, which is the closest star system to the Solar System.                                                                               | f                | G    | f        |         1 |
|       3 | Betelgeuse       |                    8 | 950000000 |                                643 | Betelgeuse is a red supergiant star located in the constellation Orion. It is one of the largest and most luminous stars known, with a highly variable brightness.                                          | t                | M    | f        |         1 |
|       4 | M31 V1           |                10000 |      3220 |                                  2 | M31 V1 is a variable star located in the Andromeda Galaxy (M31). It is classified as a Cepheid variable star and is used as a standard candle to measure cosmic distances.                                  | t                | F    | t        |         2 |
|       5 | Andromeda II-A1  |                 9800 |      2300 |                                  2 | Andromeda II-A1 is a red giant star located in the Andromeda II dwarf spheroidal galaxy, a satellite galaxy of the Andromeda Galaxy (M31).                                                                  | f                | K    | t        |         2 |
|       6 | Andromeda III-B1 |                 9700 |      2180 |                                  2 | Andromeda III-B1 is a blue giant star located in the Andromeda III dwarf spheroidal galaxy, another satellite galaxy of the Andromeda Galaxy                                                                | f                | O    | t        |         2 |
+---------+------------------+----------------------+-----------+------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------+------+----------+-----------+
(6 rows)

universe=> TRUNCATE star;
ERROR:  cannot truncate a table referenced in a foreign key constraint
DETAIL:  Table "planet" references "star".
HINT:  Truncate table "planet" at the same time, or use TRUNCATE ... CASCADE.
universe=> TRUNCATE star, planet
universe-> ;
ERROR:  cannot truncate a table referenced in a foreign key constraint
DETAIL:  Table "moon" references "planet".
HINT:  Truncate table "moon" at the same time, or use TRUNCATE ... CASCADE.
universe=> TRUNCATE TABLE star CASCADE;
NOTICE:  truncate cascades to table "planet"
NOTICE:  truncate cascades to table "moon"
TRUNCATE TABLE
universe=> \d star
                                                     Table "public.star"
+------------------------------------+-----------------------+-----------+----------+---------------------------------------+
|               Column               |         Type          | Collation | Nullable |                Default                |
+------------------------------------+-----------------------+-----------+----------+---------------------------------------+
| star_id                            | integer               |           | not null | nextval('star_star_id_seq'::regclass) |
| name                               | character varying(40) |           | not null |                                       |
| age_in_million_years               | integer               |           |          |                                       |
| diameter                           | integer               |           |          |                                       |
| distance_from_earth_in_light_years | numeric               |           |          |                                       |
| description                        | text                  |           |          |                                       |
| is_variable_star                   | boolean               |           |          |                                       |
| type                               | character(1)          |           |          |                                       |
| is_dwarf                           | boolean               |           |          |                                       |
| galaxy_id                          | integer               |           | not null |                                       |
+------------------------------------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "star_pkey" PRIMARY KEY, btree (star_id)
    "star_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "star_galaxy_id_fkey" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
Referenced by:
    TABLE "planet" CONSTRAINT "planet_star_id_fkey" FOREIGN KEY (star_id) REFERENCES star(star_id)

universe=> SELECT * FROM star;
+---------+------+----------------------+----------+------------------------------------+-------------+------------------+------+----------+-----------+
| star_id | name | age_in_million_years | diameter | distance_from_earth_in_light_years | description | is_variable_star | type | is_dwarf | galaxy_id |
+---------+------+----------------------+----------+------------------------------------+-------------+------------------+------+----------+-----------+
+---------+------+----------------------+----------+------------------------------------+-------------+------------------+------+----------+-----------+
(0 rows)

universe=> ALTER TABLE star DROP COLUMN diameter;
ALTER TABLE
universe=> ALTER TABLE star ADD COLUMN secchi_class INT;
ALTER TABLE
universe=> \d star;
                                                     Table "public.star"
+------------------------------------+-----------------------+-----------+----------+---------------------------------------+
|               Column               |         Type          | Collation | Nullable |                Default                |
+------------------------------------+-----------------------+-----------+----------+---------------------------------------+
| star_id                            | integer               |           | not null | nextval('star_star_id_seq'::regclass) |
| name                               | character varying(40) |           | not null |                                       |
| age_in_million_years               | integer               |           |          |                                       |
| distance_from_earth_in_light_years | numeric               |           |          |                                       |
| description                        | text                  |           |          |                                       |
| is_variable_star                   | boolean               |           |          |                                       |
| type                               | character(1)          |           |          |                                       |
| is_dwarf                           | boolean               |           |          |                                       |
| galaxy_id                          | integer               |           | not null |                                       |
| secchi_class                       | integer               |           |          |                                       |
+------------------------------------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "star_pkey" PRIMARY KEY, btree (star_id)
    "star_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "star_galaxy_id_fkey" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
Referenced by:
    TABLE "planet" CONSTRAINT "planet_star_id_fkey" FOREIGN KEY (star_id) REFERENCES star(star_id)

universe=> INSERT INTO star (name, age_in_million_years, distance_from_earth_in_light_years, description, is_variable_star, type, is_dwarf, galaxy_id, secchi_class) VALUES ('Sirius', 230, 0, 'Sirius is the brightest star in the night sky and is part of the constellation Canis Major. It is a binary star system consisting of a main-sequence star, Sirius A, and a white dwarf companion, Sirius B.', FALSE, 'A', FALSE, 1, 1), ('Alpha Centauri A', 6000 , 4, 'Alpha Centauri A is the primary star in the Alpha Centauri star system, which is the closest star system to the Solar System.', FALSE, 'G', FALSE, 1, 5), ('Betelgeuse', 8, 643, 'Betelgeuse is a red supergiant star located in the constellation Orion. It is one of the largest and most luminous stars known, with a highly variable brightness.', TRUE, 'M', FALSE, 1, 3), ('M31 V1', 10000 , 2, 'M31 V1 is a variable star located in the Andromeda Galaxy (M31). It is classified as a Cepheid variable star and is used as a standard candle to measure cosmic distances.', TRUE, 'F', TRUE, 2, 4), ('Andromeda II-A1',9800 ,2 , 'Andromeda II-A1 is a red giant star located in the Andromeda II dwarf spheroidal galaxy, a satellite galaxy of the Andromeda Galaxy (M31).', FALSE, 'K', TRUE, 2, 8), ('Andromeda III-B1',9700 ,2 , 'Andromeda III-B1 is a blue giant star located in the Andromeda III dwarf spheroidal galaxy, another satellite galaxy of the Andromeda Galaxy', FALSE, 'O', TRUE, 2, 2);
INSERT 0 6
universe=> SELECT * FROM star;
+---------+------------------+----------------------+------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------+------+----------+-----------+--------------+
| star_id |       name       | age_in_million_years | distance_from_earth_in_light_years |                                                                                                 description                                                                                                 | is_variable_star | type | is_dwarf | galaxy_id | secchi_class |
+---------+------------------+----------------------+------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------+------+----------+-----------+--------------+
|       7 | Sirius           |                  230 |                                  0 | Sirius is the brightest star in the night sky and is part of the constellation Canis Major. It is a binary star system consisting of a main-sequence star, Sirius A, and a white dwarf companion, Sirius B. | f                | A    | f        |         1 |            1 |
|       8 | Alpha Centauri A |                 6000 |                                  4 | Alpha Centauri A is the primary star in the Alpha Centauri star system, which is the closest star system to the Solar System.                                                                               | f                | G    | f        |         1 |            5 |
|       9 | Betelgeuse       |                    8 |                                643 | Betelgeuse is a red supergiant star located in the constellation Orion. It is one of the largest and most luminous stars known, with a highly variable brightness.                                          | t                | M    | f        |         1 |            3 |
|      10 | M31 V1           |                10000 |                                  2 | M31 V1 is a variable star located in the Andromeda Galaxy (M31). It is classified as a Cepheid variable star and is used as a standard candle to measure cosmic distances.                                  | t                | F    | t        |         2 |            4 |
|      11 | Andromeda II-A1  |                 9800 |                                  2 | Andromeda II-A1 is a red giant star located in the Andromeda II dwarf spheroidal galaxy, a satellite galaxy of the Andromeda Galaxy (M31).                                                                  | f                | K    | t        |         2 |            8 |
|      12 | Andromeda III-B1 |                 9700 |                                  2 | Andromeda III-B1 is a blue giant star located in the Andromeda III dwarf spheroidal galaxy, another satellite galaxy of the Andromeda Galaxy                                                                | f                | O    | t        |         2 |            2 |
+---------+------------------+----------------------+------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------+------+----------+-----------+--------------+
(6 rows)

universe=> \d planet
                                                      Table "public.planet"
+------------------------------------+-----------------------+-----------+----------+-------------------------------------------+
|               Column               |         Type          | Collation | Nullable |                  Default                  |
+------------------------------------+-----------------------+-----------+----------+-------------------------------------------+
| planet_id                          | integer               |           | not null | nextval('planet_planet_id_seq'::regclass) |
| name                               | character varying(40) |           | not null |                                           |
| age_in_million_years               | integer               |           |          |                                           |
| diameter                           | integer               |           |          |                                           |
| distance_from_earth_in_light_years | numeric               |           |          |                                           |
| description                        | text                  |           |          |                                           |
| is_exoplanet                       | boolean               |           |          |                                           |
| has_life                           | boolean               |           |          |                                           |
| star_id                            | integer               |           | not null |                                           |
+------------------------------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "planet_pkey" PRIMARY KEY, btree (planet_id)
    "planet_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "planet_star_id_fkey" FOREIGN KEY (star_id) REFERENCES star(star_id)
Referenced by:
    TABLE "moon" CONSTRAINT "moon_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

universe=> INSERT INTO star (name, age_in_million_years, distance_from_earth_in_light_years, description, is_variable_star, type, is_dwarf, galaxy_id, secchi_class) VALUES 
universe-> ('Sun', 4600, 0, ' The Sun is a G-type main-sequence star, commonly referred to as a yellow dwarf. The Sun''s energy is generated through nuclear fusion reactions in its core, primarily converting hydrogen into helium.', FALSE, 'G', TRUE, 1, 5);
universe=> INSERT INTO star (name, age_in_million_years, distance_from_earth_in_light_years, description, is_variable_star, type, is_dwarf, galaxy_id, secchi_class) VALUES ('Sun', 4600, 0, ' The Sun is a G-type main-sequence star, commonly referred to as a yellow dwarf. The Sun''s energy is generated through nuclear fusion reactions in its core, primarily converting hydrogen into helium.', FALSE, 'G', TRUE, 1, 5);
INSERT 0 1
universe=> SELECT * FROM star;
+---------+------------------+----------------------+------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------+------+----------+-----------+--------------+
| star_id |       name       | age_in_million_years | distance_from_earth_in_light_years |                                                                                                 description                                                                                                 | is_variable_star | type | is_dwarf | galaxy_id | secchi_class |
+---------+------------------+----------------------+------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------+------+----------+-----------+--------------+
|       7 | Sirius           |                  230 |                                  0 | Sirius is the brightest star in the night sky and is part of the constellation Canis Major. It is a binary star system consisting of a main-sequence star, Sirius A, and a white dwarf companion, Sirius B. | f                | A    | f        |         1 |            1 |
|       8 | Alpha Centauri A |                 6000 |                                  4 | Alpha Centauri A is the primary star in the Alpha Centauri star system, which is the closest star system to the Solar System.                                                                               | f                | G    | f        |         1 |            5 |
|       9 | Betelgeuse       |                    8 |                                643 | Betelgeuse is a red supergiant star located in the constellation Orion. It is one of the largest and most luminous stars known, with a highly variable brightness.                                          | t                | M    | f        |         1 |            3 |
|      10 | M31 V1           |                10000 |                                  2 | M31 V1 is a variable star located in the Andromeda Galaxy (M31). It is classified as a Cepheid variable star and is used as a standard candle to measure cosmic distances.                                  | t                | F    | t        |         2 |            4 |
|      11 | Andromeda II-A1  |                 9800 |                                  2 | Andromeda II-A1 is a red giant star located in the Andromeda II dwarf spheroidal galaxy, a satellite galaxy of the Andromeda Galaxy (M31).                                                                  | f                | K    | t        |         2 |            8 |
|      12 | Andromeda III-B1 |                 9700 |                                  2 | Andromeda III-B1 is a blue giant star located in the Andromeda III dwarf spheroidal galaxy, another satellite galaxy of the Andromeda Galaxy                                                                | f                | O    | t        |         2 |            2 |
|      13 | Sun              |                 4600 |                                  0 |  The Sun is a G-type main-sequence star, commonly referred to as a yellow dwarf. The Sun's energy is generated through nuclear fusion reactions in its core, primarily converting hydrogen into helium.     | f                | G    | t        |         1 |            5 |
+---------+------------------+----------------------+------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------+------+----------+-----------+--------------+
(7 rows)

universe=> \d planet
                                                      Table "public.planet"
+------------------------------------+-----------------------+-----------+----------+-------------------------------------------+
|               Column               |         Type          | Collation | Nullable |                  Default                  |
+------------------------------------+-----------------------+-----------+----------+-------------------------------------------+
| planet_id                          | integer               |           | not null | nextval('planet_planet_id_seq'::regclass) |
| name                               | character varying(40) |           | not null |                                           |
| age_in_million_years               | integer               |           |          |                                           |
| diameter                           | integer               |           |          |                                           |
| distance_from_earth_in_light_years | numeric               |           |          |                                           |
| description                        | text                  |           |          |                                           |
| is_exoplanet                       | boolean               |           |          |                                           |
| has_life                           | boolean               |           |          |                                           |
| star_id                            | integer               |           | not null |                                           |
+------------------------------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "planet_pkey" PRIMARY KEY, btree (planet_id)
    "planet_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "planet_star_id_fkey" FOREIGN KEY (star_id) REFERENCES star(star_id)
Referenced by:
    TABLE "moon" CONSTRAINT "moon_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

universe=> ALTER TABLE planet RENAME COLUMN diameter TO diameter_in_km;
ALTER TABLE
universe=> ALTER TABLE planet RENAME COLUMN distance_from_earth_in_light_years TO distance_from_earth_in_million_km;
ALTER TABLE
universe=> \d planet
                                                     Table "public.planet"
+-----------------------------------+-----------------------+-----------+----------+-------------------------------------------+
|              Column               |         Type          | Collation | Nullable |                  Default                  |
+-----------------------------------+-----------------------+-----------+----------+-------------------------------------------+
| planet_id                         | integer               |           | not null | nextval('planet_planet_id_seq'::regclass) |
| name                              | character varying(40) |           | not null |                                           |
| age_in_million_years              | integer               |           |          |                                           |
| diameter_in_km                    | integer               |           |          |                                           |
| distance_from_earth_in_million_km | numeric               |           |          |                                           |
| description                       | text                  |           |          |                                           |
| is_exoplanet                      | boolean               |           |          |                                           |
| has_life                          | boolean               |           |          |                                           |
| star_id                           | integer               |           | not null |                                           |
+-----------------------------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "planet_pkey" PRIMARY KEY, btree (planet_id)
    "planet_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "planet_star_id_fkey" FOREIGN KEY (star_id) REFERENCES star(star_id)
Referenced by:
    TABLE "moon" CONSTRAINT "moon_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

universe=> INSERT INTO planet(name, age_in_million_years, diameter_in_km, distance_from_earth_in_million_km, description, is_exoplanet, has_life, star_id) VALUES ('Mercury', 4500, 4880, 77, 'Mercury is the smallest and innermost planet in the Solar System. It has a heavily cratered surface and no atmosphere to retain heat, leading to extreme temperature variations.', FALSE, FALSE, 13), ('Venus', 4500, 12104, 38, 'Venus is often called Earth's "sister planet" due to its similar size and composition, but it has a thick, toxic atmosphere composed mainly of carbon dioxide. Surface temperatures are hot enough to melt lead.', FALSE, FALSE, 13), ('Earth', 4500, 12742, 147, 'Earth is the only known planet to support life. It has a diverse environment with oceans, continents, and a breathable atmosphere.', FALSE, TRUE, 13), ('Mars', 4500, 6779, 54, 'Mars is known as the "Red Planet" due to its reddish appearance caused by iron oxide on its surface. It has a thin atmosphere and features such as valleys, deserts, and polar ice caps.', FALSE, FALSE, 13), ('Jupiter', 4500, 139820, 588, 'Jupiter is the largest planet in the Solar System and is composed mainly of hydrogen and helium. It has a turbulent atmosphere with distinct cloud bands and a large, swirling storm known as the Great Red Spot.', FALSE, FALSE, 13), ('Saturn', 4500, 116460, 1200, 'Saturn is known for its prominent ring system, composed mainly of ice particles and rocky debris. It is the second-largest planet and has a complex atmosphere with high-speed winds.', FALSE, FALSE, 13), ('Uranus', 4500, 50724, 2600, 'Uranus is an ice giant planet with a unique feature - it rotates on its side. It has a bluish appearance due to the presence of methane in its atmosphere.', FALSE, FALSE, 13), ('Neptune', 4500, 49244, 4300, 'Neptune is the outermost planet in the Solar System and is composed mainly of hydrogen, helium, and methane. It has a dynamic atmosphere with fast-moving clouds and the strongest winds in the Solar System.', FALSE, FALSE, 13), ('Pluto', 4500, 2377, 4280, 'Pluto is a dwarf planet located in the Kuiper Belt. It was considered the ninth planet until reclassification in 2006. Pluto has a thin atmosphere and a complex surface with icy plains, mountains, and valleys.', FALSE, FALSE, 13), ('Eris', 4500, 2326, 9000, 'Eris is a dwarf planet located in the scattered disc region of the Solar System. It is similar in size to Pluto and has a highly elliptical orbit.', FALSE, FALSE, 13), ('Haumea', 4500, 1960, 5200, 'Haumea is a dwarf planet located in the Kuiper Belt. It is elongated in shape due to its rapid rotation and is surrounded by two small moons.', FALSE, FALSE, 13), ('Makemake', 4500, 1430, 6800, 'Makemake is a dwarf planet located in the Kuiper Belt. It is similar in size to Haumea and Pluto and has a reddish surface possibly due to the presence of organic materials.', FALSE, FALSE, 13);
universe'> 
universe=> INSERT INTO planet(name, age_in_million_years, diameter_in_km, distance_from_earth_in_million_km, description, is_exoplanet, has_life, star_id) VALUES ('Mercury', 4500, 4880, 77, 'Mercury is the smallest and innermost planet in the Solar System. It has a heavily cratered surface and no atmosphere to retain heat, leading to extreme temperature variations.', FALSE, FALSE, 13), ('Venus', 4500, 12104, 38, 'Venus is often called Earth''s sister planet due to its similar size and composition, but it has a thick, toxic atmosphere composed mainly of carbon dioxide. Surface temperatures are hot enough to melt lead.', FALSE, FALSE, 13), ('Earth', 4500, 12742, 147, 'Earth is the only known planet to support life. It has a diverse environment with oceans, continents, and a breathable atmosphere.', FALSE, TRUE, 13), ('Mars', 4500, 6779, 54, 'Mars is known as the Red Planet due to its reddish appearance caused by iron oxide on its surface. It has a thin atmosphere and features such as valleys, deserts, and polar ice caps.', FALSE, FALSE, 13), ('Jupiter', 4500, 139820, 588, 'Jupiter is the largest planet in the Solar System and is composed mainly of hydrogen and helium. It has a turbulent atmosphere with distinct cloud bands and a large, swirling storm known as the Great Red Spot.', FALSE, FALSE, 13), ('Saturn', 4500, 116460, 1200, 'Saturn is known for its prominent ring system, composed mainly of ice particles and rocky debris. It is the second-largest planet and has a complex atmosphere with high-speed winds.', FALSE, FALSE, 13), ('Uranus', 4500, 50724, 2600, 'Uranus is an ice giant planet with a unique feature - it rotates on its side. It has a bluish appearance due to the presence of methane in its atmosphere.', FALSE, FALSE, 13), ('Neptune', 4500, 49244, 4300, 'Neptune is the outermost planet in the Solar System and is composed mainly of hydrogen, helium, and methane. It has a dynamic atmosphere with fast-moving clouds and the strongest winds in the Solar System.', FALSE, FALSE, 13), ('Pluto', 4500, 2377, 4280, 'Pluto is a dwarf planet located in the Kuiper Belt. It was considered the ninth planet until reclassification in 2006. Pluto has a thin atmosphere and a complex surface with icy plains, mountains, and valleys.', FALSE, FALSE, 13), ('Eris', 4500, 2326, 9000, 'Eris is a dwarf planet located in the scattered disc region of the Solar System. It is similar in size to Pluto and has a highly elliptical orbit.', FALSE, FALSE, 13), ('Haumea', 4500, 1960, 5200, 'Haumea is a dwarf planet located in the Kuiper Belt. It is elongated in shape due to its rapid rotation and is surrounded by two small moons.', FALSE, FALSE, 13), ('Makemake', 4500, 1430, 6800, 'Makemake is a dwarf planet located in the Kuiper Belt. It is similar in size to Haumea and Pluto and has a reddish surface possibly due to the presence of organic materials.', FALSE, FALSE, 13);
INSERT 0 12
universe=> SELECT * FROM planet
universe-> ;
+-----------+----------+----------------------+----------------+-----------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------+----------+---------+
| planet_id |   name   | age_in_million_years | diameter_in_km | distance_from_earth_in_million_km |                                                                                                    description                                                                                                    | is_exoplanet | has_life | star_id |
+-----------+----------+----------------------+----------------+-----------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------+----------+---------+
|         1 | Mercury  |                 4500 |           4880 |                                77 | Mercury is the smallest and innermost planet in the Solar System. It has a heavily cratered surface and no atmosphere to retain heat, leading to extreme temperature variations.                                  | f            | f        |      13 |
|         2 | Venus    |                 4500 |          12104 |                                38 | Venus is often called Earth's sister planet due to its similar size and composition, but it has a thick, toxic atmosphere composed mainly of carbon dioxide. Surface temperatures are hot enough to melt lead.    | f            | f        |      13 |
|         3 | Earth    |                 4500 |          12742 |                               147 | Earth is the only known planet to support life. It has a diverse environment with oceans, continents, and a breathable atmosphere.                                                                                | f            | t        |      13 |
|         4 | Mars     |                 4500 |           6779 |                                54 | Mars is known as the Red Planet due to its reddish appearance caused by iron oxide on its surface. It has a thin atmosphere and features such as valleys, deserts, and polar ice caps.                            | f            | f        |      13 |
|         5 | Jupiter  |                 4500 |         139820 |                               588 | Jupiter is the largest planet in the Solar System and is composed mainly of hydrogen and helium. It has a turbulent atmosphere with distinct cloud bands and a large, swirling storm known as the Great Red Spot. | f            | f        |      13 |
|         6 | Saturn   |                 4500 |         116460 |                              1200 | Saturn is known for its prominent ring system, composed mainly of ice particles and rocky debris. It is the second-largest planet and has a complex atmosphere with high-speed winds.                             | f            | f        |      13 |
|         7 | Uranus   |                 4500 |          50724 |                              2600 | Uranus is an ice giant planet with a unique feature - it rotates on its side. It has a bluish appearance due to the presence of methane in its atmosphere.                                                        | f            | f        |      13 |
|         8 | Neptune  |                 4500 |          49244 |                              4300 | Neptune is the outermost planet in the Solar System and is composed mainly of hydrogen, helium, and methane. It has a dynamic atmosphere with fast-moving clouds and the strongest winds in the Solar System.     | f            | f        |      13 |
|         9 | Pluto    |                 4500 |           2377 |                              4280 | Pluto is a dwarf planet located in the Kuiper Belt. It was considered the ninth planet until reclassification in 2006. Pluto has a thin atmosphere and a complex surface with icy plains, mountains, and valleys. | f            | f        |      13 |
|        10 | Eris     |                 4500 |           2326 |                              9000 | Eris is a dwarf planet located in the scattered disc region of the Solar System. It is similar in size to Pluto and has a highly elliptical orbit.                                                                | f            | f        |      13 |
|        11 | Haumea   |                 4500 |           1960 |                              5200 | Haumea is a dwarf planet located in the Kuiper Belt. It is elongated in shape due to its rapid rotation and is surrounded by two small moons.                                                                     | f            | f        |      13 |
|        12 | Makemake |                 4500 |           1430 |                              6800 | Makemake is a dwarf planet located in the Kuiper Belt. It is similar in size to Haumea and Pluto and has a reddish surface possibly due to the presence of organic materials.                                     | f            | f        |      13 |
+-----------+----------+----------------------+----------------+-----------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------+----------+---------+
(12 rows)

universe=> \d moon
                                                     Table "public.moon"
+------------------------------------+-----------------------+-----------+----------+---------------------------------------+
|               Column               |         Type          | Collation | Nullable |                Default                |
+------------------------------------+-----------------------+-----------+----------+---------------------------------------+
| moon_id                            | integer               |           | not null | nextval('moon_moon_id_seq'::regclass) |
| name                               | character varying(40) |           | not null |                                       |
| age_in_million_years               | integer               |           |          |                                       |
| diameter                           | integer               |           |          |                                       |
| distance_from_earth_in_light_years | numeric               |           |          |                                       |
| description                        | text                  |           |          |                                       |
| inside_solar_system                | boolean               |           |          |                                       |
| has_water                          | boolean               |           |          |                                       |
| planet_id                          | integer               |           | not null |                                       |
+------------------------------------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "moon_pkey" PRIMARY KEY, btree (moon_id)
    "moon_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "moon_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

universe=> ALTER TABLE RENAME COLUMN diameter TO diameter_in_km;
ERROR:  syntax error at or near "COLUMN"
LINE 1: ALTER TABLE RENAME COLUMN diameter TO diameter_in_km;
                           ^
universe=> ALTER TABLE moon RENAME COLUMN diameter TO diameter_in_km;
ALTER TABLE
universe=> ALTER TABLE moon RENAME COLUMN distance_from_earth_in_light_years TO distance_from_earth_in_million_km;
ALTER TABLE
universe=> \d moon;
                                                    Table "public.moon"
+-----------------------------------+-----------------------+-----------+----------+---------------------------------------+
|              Column               |         Type          | Collation | Nullable |                Default                |
+-----------------------------------+-----------------------+-----------+----------+---------------------------------------+
| moon_id                           | integer               |           | not null | nextval('moon_moon_id_seq'::regclass) |
| name                              | character varying(40) |           | not null |                                       |
| age_in_million_years              | integer               |           |          |                                       |
| diameter_in_km                    | integer               |           |          |                                       |
| distance_from_earth_in_million_km | numeric               |           |          |                                       |
| description                       | text                  |           |          |                                       |
| inside_solar_system               | boolean               |           |          |                                       |
| has_water                         | boolean               |           |          |                                       |
| planet_id                         | integer               |           | not null |                                       |
+-----------------------------------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "moon_pkey" PRIMARY KEY, btree (moon_id)
    "moon_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "moon_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

universe=> INSERT INTO moon(name, age_in_million_years, diameter_in_km, distance_from_earth_in_million_km, description, inside_solar_system, has_water, planet_id) VALUES ('Moon', 4500, 3474, 0, 'Earth's natural satellite, the Moon, is the fifth largest moon in the Solar System. It lacks a significant atmosphere and is heavily cratered.', TRUE, TRUE, 3), ('Titan', 4500, 5150, 1200, 'Titan is Saturn's largest moon and the second largest moon in the Solar System. It has a thick atmosphere primarily composed of nitrogen and is known for its hydrocarbon lakes and rivers.', TRUE, TRUE, 3), ('Ganymede', 4500, 5268, 628, 'Ganymede is Jupiter's largest moon and the largest moon in the Solar System. It has a subsurface ocean beneath its icy crust and is geologically diverse.', TRUE, TRUE, 3),    
universe'> ('Callisto', 4500, 4821, 628, 'Callisto is one of Jupiter's Galilean moons. It has a heavily cratered surface and is believed to have a subsurface ocean.', TRUE, TRUE, 3),    
universe-> ('Io', 4500, 3643, 628, 'Io is one of Jupiter's Galilean moons and is the most volcanically active body in the Solar System due to tidal heating from Jupiter.', TRUE, FALSE, 3),    
universe'> ('Europa', 4500, 3121, 628, 'Europa is one of Jupiter's Galilean moons and is believed to have a subsurface ocean beneath its icy crust, making it a potential target for astrobiology.', TRUE, TRUE, 3), ('Enceladus', 4500, 504, 1500, 'Enceladus is a moon of Saturn known for its geysers of water vapor and icy particles erupting from its south polar region.', TRUE, TRUE, 3), ('Triton', 4500, 2706, 4300, 'Triton is Neptune's largest moon and is believed to be a captured Kuiper Belt object. It has a thin atmosphere and unique surface features.', TRUE, TRUE, 3), ('Tethys', 4500, 1060, 1300, 'Tethys is a moon of Saturn and is heavily cratered. It has a large impact crater named Odysseus.', TRUE, TRUE, 3),    ('Dione', 4500, 1123, 1300, 'Dione is a moon of Saturn with a heavily cratered surface and bright, wispy streaks known as "linea."', TRUE, TRUE, 3), ('Rhea', 4500, 1528, 1300, 'Rhea is Saturn's second-largest moon and has a heavily cratered surface with bright, icy terrain.', TRUE, TRUE, 3), ('Iapetus', 4500, 1470, 1400, 'Iapetus is a moon of Saturn known for its stark contrast in brightness between its leading and trailing hemispheres.', TRUE, TRUE, 3), ('Charon', 4500, 1212, 5900, 'Charon is the largest moon of Pluto and is tidally locked with Pluto, always presenting the same face towards it.', TRUE, TRUE, 3), ('Ariel', 4500, 1157, 2800, 'Ariel is one of Uranus's major moons and has a relatively young surface with few impact craters.', TRUE, TRUE, 3), ('Umbriel', 4500, 1169, 2800, 'Umbriel is another major moon of Uranus and has a heavily cratered surface with a dark appearance.', TRUE, TRUE, 3), ('Miranda', 4500, 471, 2800, 'Miranda is one of Uranus's five major moons and has a complex surface with varied terrain, including large cliffs and valleys.', TRUE, TRUE, 3), ('Triton', 4500, 2706, 4300, 'Triton is Neptune's largest moon and is believed to be a captured Kuiper Belt object. It has a thin atmosphere and unique surface features.', TRUE, TRUE, 3), ('Proteus', 4500, 420, 4700, 'Proteus is one of Neptune's larger moons and is irregularly shaped. It is heavily cratered and has a dark, heavily cratered surface.', TRUE, TRUE, 3), ('Nereid', 4500, 340, 4700, 'Nereid is one of Neptune's smaller moons and has an irregular, elongated shape. It is believed to be a captured object from the Kuiper Belt.', TRUE, TRUE, 3), ('Phobos', 4500, 22, 58, 'Phobos is the larger and closer of Mars's two moons. It has a heavily cratered surface and is believed to be a captured asteroid.', TRUE, FALSE, 3);
ERROR:  syntax error at or near "s"
LINE 1: ... planet_id) VALUES ('Moon', 4500, 3474, 0, 'Earth's natural ...
                                                             ^
universe=> INSERT INTO moon(name, age_in_million_years, diameter_in_km, distance_from_earth_in_million_km, description, inside_solar_system, has_water, planet_id) VALUES ('Moon', 4500, 3474, 0, 'Earth''s natural satellite, the Moon, is the fifth largest moon in the Solar System. It lacks a significant atmosphere and is heavily cratered.', TRUE, TRUE, 3), ('Titan', 4500, 5150, 1200, 'Titan is Saturn''s largest moon and the second largest moon in the Solar System. It has a thick atmosphere primarily composed of nitrogen and is known for its hydrocarbon lakes and rivers.', TRUE, TRUE, 3), ('Ganymede', 4500, 5268, 628, 'Ganymede is Jupiter''s largest moon and the largest moon in the Solar System. It has a subsurface ocean beneath its icy crust and is geologically diverse.', TRUE, TRUE, 3),  
universe-> ('Callisto', 4500, 4821, 628, 'Callisto is one of Jupiter''s Galilean moons. It has a heavily cratered surface and is believed to have a subsurface ocean.', TRUE, TRUE, 3),    
universe-> ('Io', 4500, 3643, 628, 'Io is one of Jupiter''s Galilean moons and is the most volcanically active body in the Solar System due to tidal heating from Jupiter.', TRUE, FALSE, 3),    
universe-> ('Europa', 4500, 3121, 628, 'Europa is one of Jupiter''s Galilean moons and is believed to have a subsurface ocean beneath its icy crust, making it a potential target for astrobiology.', TRUE, TRUE, 3), ('Enceladus', 4500, 504, 1500, 'Enceladus is a moon of Saturn known for its geysers of water vapor and icy particles erupting from its south polar region.', TRUE, TRUE, 3), ('Triton', 4500, 2706, 4300, 'Triton is Neptune''s largest moon and is believed to be a captured Kuiper Belt object. It has a thin atmosphere and unique surface features.', TRUE, TRUE, 3), ('Tethys', 4500, 1060, 1300, 'Tethys is a moon of Saturn and is heavily cratered. It has a large impact crater named Odysseus.', TRUE, TRUE, 3),    ('Dione', 4500, 1123, 1300, 'Dione is a moon of Saturn with a heavily cratered surface and bright, wispy streaks known as linea.', TRUE, TRUE, 3), ('Rhea', 4500, 1528, 1300, 'Rhea is Saturn''s second-largest moon and has a heavily cratered surface with bright, icy terrain.', TRUE, TRUE, 3), ('Iapetus', 4500, 1470, 1400, 'Iapetus is a moon of Saturn known for its stark contrast in brightness between its leading and trailing hemispheres.', TRUE, TRUE, 3), ('Charon', 4500, 1212, 5900, 'Charon is the largest moon of Pluto and is tidally locked with Pluto, always presenting the same face towards it.', TRUE, TRUE, 3), ('Ariel', 4500, 1157, 2800, 'Ariel is one of Uranus''s major moons and has a relatively young surface with few impact craters.', TRUE, TRUE, 3), ('Umbriel', 4500, 1169, 2800, 'Umbriel is another major moon of Uranus and has a heavily cratered surface with a dark appearance.', TRUE, TRUE, 3), ('Miranda', 4500, 471, 2800, 'Miranda is one of Uranus''s five major moons and has a complex surface with varied terrain, including large cliffs and valleys.', TRUE, TRUE, 3), ('Triton', 4500, 2706, 4300, 'Triton is Neptune''s largest moon and is believed to be a captured Kuiper Belt object. It has a thin atmosphere and unique surface features.', TRUE, TRUE, 3), ('Proteus', 4500, 420, 4700, 'Proteus is one of Neptune''s larger moons and is irregularly shaped. It is heavily cratered and has a dark, heavily cratered surface.', TRUE, TRUE, 3), ('Nereid', 4500, 340, 4700, 'Nereid is one of Neptune''s smaller moons and has an irregular, elongated shape. It is believed to be a captured object from the Kuiper Belt.', TRUE, TRUE, 3), ('Phobos', 4500, 22, 58, 'Phobos is the larger and closer of Mars''s two moons. It has a heavily cratered surface and is believed to be a captured asteroid.', TRUE, FALSE, 3);
ERROR:  duplicate key value violates unique constraint "moon_name_key"
DETAIL:  Key (name)=(Triton) already exists.
universe=> SELECT * FROM moon;
+---------+------+----------------------+----------------+-----------------------------------+-------------+---------------------+-----------+-----------+
| moon_id | name | age_in_million_years | diameter_in_km | distance_from_earth_in_million_km | description | inside_solar_system | has_water | planet_id |
+---------+------+----------------------+----------------+-----------------------------------+-------------+---------------------+-----------+-----------+
+---------+------+----------------------+----------------+-----------------------------------+-------------+---------------------+-----------+-----------+
(0 rows)

universe=> INSERT INTO moon(name, age_in_million_years, diameter_in_km, distance_from_earth_in_million_km, description, inside_solar_system, has_water, planet_id) VALUES ('Moon', 4500, 3474, 0, 'Earth''s natural satellite, the Moon, is the fifth largest moon in the Solar System. It lacks a significant atmosphere and is heavily cratered.', TRUE, TRUE, 3), ('Titan', 4500, 5150, 1200, 'Titan is Saturn''s largest moon and the second largest moon in the Solar System. It has a thick atmosphere primarily composed of nitrogen and is known for its hydrocarbon lakes and rivers.', TRUE, TRUE, 3), ('Ganymede', 4500, 5268, 628, 'Ganymede is Jupiter''s largest moon and the largest moon in the Solar System. It has a subsurface ocean beneath its icy crust and is geologically diverse.', TRUE, TRUE, 3),  
universe-> ('Callisto', 4500, 4821, 628, 'Callisto is one of Jupiter''s Galilean moons. It has a heavily cratered surface and is believed to have a subsurface ocean.', TRUE, TRUE, 3),    
universe-> ('Io', 4500, 3643, 628, 'Io is one of Jupiter''s Galilean moons and is the most volcanically active body in the Solar System due to tidal heating from Jupiter.', TRUE, FALSE, 3),    
universe-> ('Europa', 4500, 3121, 628, 'Europa is one of Jupiter''s Galilean moons and is believed to have a subsurface ocean beneath its icy crust, making it a potential target for astrobiology.', TRUE, TRUE, 3), ('Enceladus', 4500, 504, 1500, 'Enceladus is a moon of Saturn known for its geysers of water vapor and icy particles erupting from its south polar region.', TRUE, TRUE, 3), ('Tethys', 4500, 1060, 1300, 'Tethys is a moon of Saturn and is heavily cratered. It has a large impact crater named Odysseus.', TRUE, TRUE, 3),    ('Dione', 4500, 1123, 1300, 'Dione is a moon of Saturn with a heavily cratered surface and bright, wispy streaks known as linea.', TRUE, TRUE, 3), ('Rhea', 4500, 1528, 1300, 'Rhea is Saturn''s second-largest moon and has a heavily cratered surface with bright, icy terrain.', TRUE, TRUE, 3), ('Iapetus', 4500, 1470, 1400, 'Iapetus is a moon of Saturn known for its stark contrast in brightness between its leading and trailing hemispheres.', TRUE, TRUE, 3), ('Charon', 4500, 1212, 5900, 'Charon is the largest moon of Pluto and is tidally locked with Pluto, always presenting the same face towards it.', TRUE, TRUE, 3), ('Ariel', 4500, 1157, 2800, 'Ariel is one of Uranus''s major moons and has a relatively young surface with few impact craters.', TRUE, TRUE, 3), ('Umbriel', 4500, 1169, 2800, 'Umbriel is another major moon of Uranus and has a heavily cratered surface with a dark appearance.', TRUE, TRUE, 3), ('Miranda', 4500, 471, 2800, 'Miranda is one of Uranus''s five major moons and has a complex surface with varied terrain, including large cliffs and valleys.', TRUE, TRUE, 3), ('Triton', 4500, 2706, 4300, 'Triton is Neptune''s largest moon and is believed to be a captured Kuiper Belt object. It has a thin atmosphere and unique surface features.', TRUE, TRUE, 3), ('Proteus', 4500, 420, 4700, 'Proteus is one of Neptune''s larger moons and is irregularly shaped. It is heavily cratered and has a dark, heavily cratered surface.', TRUE, TRUE, 3), ('Nereid', 4500, 340, 4700, 'Nereid is one of Neptune''s smaller moons and has an irregular, elongated shape. It is believed to be a captured object from the Kuiper Belt.', TRUE, TRUE, 3), ('Phobos', 4500, 22, 58, 'Phobos is the larger and closer of Mars''s two moons. It has a heavily cratered surface and is believed to be a captured asteroid.', TRUE, FALSE, 3), ('Hyperion', 4500, 270, 1400, 'Hyperion is one of Saturn's irregularly shaped moons known for its spongy appearance and chaotic rotation. It has a highly porous surface with numerous impact craters.', TRUE, FALSE, 3);
universe'> 
universe=> INSERT INTO moon(name, age_in_million_years, diameter_in_km, distance_from_earth_in_million_km, description, inside_solar_system, has_water, planet_id) VALUES ('Moon', 4500, 3474, 0, 'Earth''s natural satellite, the Moon, is the fifth largest moon in the Solar System. It lacks a significant atmosphere and is heavily cratered.', TRUE, TRUE, 3), ('Titan', 4500, 5150, 1200, 'Titan is Saturn''s largest moon and the second largest moon in the Solar System. It has a thick atmosphere primarily composed of nitrogen and is known for its hydrocarbon lakes and rivers.', TRUE, TRUE, 3), ('Ganymede', 4500, 5268, 628, 'Ganymede is Jupiter''s largest moon and the largest moon in the Solar System. It has a subsurface ocean beneath its icy crust and is geologically diverse.', TRUE, TRUE, 3),  
universe-> ('Callisto', 4500, 4821, 628, 'Callisto is one of Jupiter''s Galilean moons. It has a heavily cratered surface and is believed to have a subsurface ocean.', TRUE, TRUE, 3),    
universe-> ('Io', 4500, 3643, 628, 'Io is one of Jupiter''s Galilean moons and is the most volcanically active body in the Solar System due to tidal heating from Jupiter.', TRUE, FALSE, 3),    
universe-> ('Europa', 4500, 3121, 628, 'Europa is one of Jupiter''s Galilean moons and is believed to have a subsurface ocean beneath its icy crust, making it a potential target for astrobiology.', TRUE, TRUE, 3), ('Enceladus', 4500, 504, 1500, 'Enceladus is a moon of Saturn known for its geysers of water vapor and icy particles erupting from its south polar region.', TRUE, TRUE, 3), ('Tethys', 4500, 1060, 1300, 'Tethys is a moon of Saturn and is heavily cratered. It has a large impact crater named Odysseus.', TRUE, TRUE, 3),    ('Dione', 4500, 1123, 1300, 'Dione is a moon of Saturn with a heavily cratered surface and bright, wispy streaks known as linea.', TRUE, TRUE, 3), ('Rhea', 4500, 1528, 1300, 'Rhea is Saturn''s second-largest moon and has a heavily cratered surface with bright, icy terrain.', TRUE, TRUE, 3), ('Iapetus', 4500, 1470, 1400, 'Iapetus is a moon of Saturn known for its stark contrast in brightness between its leading and trailing hemispheres.', TRUE, TRUE, 3), ('Charon', 4500, 1212, 5900, 'Charon is the largest moon of Pluto and is tidally locked with Pluto, always presenting the same face towards it.', TRUE, TRUE, 3), ('Ariel', 4500, 1157, 2800, 'Ariel is one of Uranus''s major moons and has a relatively young surface with few impact craters.', TRUE, TRUE, 3), ('Umbriel', 4500, 1169, 2800, 'Umbriel is another major moon of Uranus and has a heavily cratered surface with a dark appearance.', TRUE, TRUE, 3), ('Miranda', 4500, 471, 2800, 'Miranda is one of Uranus''s five major moons and has a complex surface with varied terrain, including large cliffs and valleys.', TRUE, TRUE, 3), ('Triton', 4500, 2706, 4300, 'Triton is Neptune''s largest moon and is believed to be a captured Kuiper Belt object. It has a thin atmosphere and unique surface features.', TRUE, TRUE, 3), ('Proteus', 4500, 420, 4700, 'Proteus is one of Neptune''s larger moons and is irregularly shaped. It is heavily cratered and has a dark, heavily cratered surface.', TRUE, TRUE, 3), ('Nereid', 4500, 340, 4700, 'Nereid is one of Neptune''s smaller moons and has an irregular, elongated shape. It is believed to be a captured object from the Kuiper Belt.', TRUE, TRUE, 3), ('Phobos', 4500, 22, 58, 'Phobos is the larger and closer of Mars''s two moons. It has a heavily cratered surface and is believed to be a captured asteroid.', TRUE, FALSE, 3), ('Hyperion', 4500, 270, 1400, 'Hyperion is one of Saturn''s irregularly shaped moons known for its spongy appearance and chaotic rotation. It has a highly porous surface with numerous impact craters.', TRUE, FALSE, 3);
INSERT 0 20
universe=> SELECT * FROM moon;
+---------+-----------+----------------------+----------------+-----------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------+-----------+-----------+
| moon_id |   name    | age_in_million_years | diameter_in_km | distance_from_earth_in_million_km |                                                                                         description                                                                                         | inside_solar_system | has_water | planet_id |
+---------+-----------+----------------------+----------------+-----------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------+-----------+-----------+
|      18 | Moon      |                 4500 |           3474 |                                 0 | Earth's natural satellite, the Moon, is the fifth largest moon in the Solar System. It lacks a significant atmosphere and is heavily cratered.                                              | t                   | t         |         3 |
|      19 | Titan     |                 4500 |           5150 |                              1200 | Titan is Saturn's largest moon and the second largest moon in the Solar System. It has a thick atmosphere primarily composed of nitrogen and is known for its hydrocarbon lakes and rivers. | t                   | t         |         3 |
|      20 | Ganymede  |                 4500 |           5268 |                               628 | Ganymede is Jupiter's largest moon and the largest moon in the Solar System. It has a subsurface ocean beneath its icy crust and is geologically diverse.                                   | t                   | t         |         3 |
|      21 | Callisto  |                 4500 |           4821 |                               628 | Callisto is one of Jupiter's Galilean moons. It has a heavily cratered surface and is believed to have a subsurface ocean.                                                                  | t                   | t         |         3 |
|      22 | Io        |                 4500 |           3643 |                               628 | Io is one of Jupiter's Galilean moons and is the most volcanically active body in the Solar System due to tidal heating from Jupiter.                                                       | t                   | f         |         3 |
|      23 | Europa    |                 4500 |           3121 |                               628 | Europa is one of Jupiter's Galilean moons and is believed to have a subsurface ocean beneath its icy crust, making it a potential target for astrobiology.                                  | t                   | t         |         3 |
|      24 | Enceladus |                 4500 |            504 |                              1500 | Enceladus is a moon of Saturn known for its geysers of water vapor and icy particles erupting from its south polar region.                                                                  | t                   | t         |         3 |
|      25 | Tethys    |                 4500 |           1060 |                              1300 | Tethys is a moon of Saturn and is heavily cratered. It has a large impact crater named Odysseus.                                                                                            | t                   | t         |         3 |
|      26 | Dione     |                 4500 |           1123 |                              1300 | Dione is a moon of Saturn with a heavily cratered surface and bright, wispy streaks known as linea.                                                                                         | t                   | t         |         3 |
|      27 | Rhea      |                 4500 |           1528 |                              1300 | Rhea is Saturn's second-largest moon and has a heavily cratered surface with bright, icy terrain.                                                                                           | t                   | t         |         3 |
|      28 | Iapetus   |                 4500 |           1470 |                              1400 | Iapetus is a moon of Saturn known for its stark contrast in brightness between its leading and trailing hemispheres.                                                                        | t                   | t         |         3 |
|      29 | Charon    |                 4500 |           1212 |                              5900 | Charon is the largest moon of Pluto and is tidally locked with Pluto, always presenting the same face towards it.                                                                           | t                   | t         |         3 |
|      30 | Ariel     |                 4500 |           1157 |                              2800 | Ariel is one of Uranus's major moons and has a relatively young surface with few impact craters.                                                                                            | t                   | t         |         3 |
|      31 | Umbriel   |                 4500 |           1169 |                              2800 | Umbriel is another major moon of Uranus and has a heavily cratered surface with a dark appearance.                                                                                          | t                   | t         |         3 |
|      32 | Miranda   |                 4500 |            471 |                              2800 | Miranda is one of Uranus's five major moons and has a complex surface with varied terrain, including large cliffs and valleys.                                                              | t                   | t         |         3 |
|      33 | Triton    |                 4500 |           2706 |                              4300 | Triton is Neptune's largest moon and is believed to be a captured Kuiper Belt object. It has a thin atmosphere and unique surface features.                                                 | t                   | t         |         3 |
|      34 | Proteus   |                 4500 |            420 |                              4700 | Proteus is one of Neptune's larger moons and is irregularly shaped. It is heavily cratered and has a dark, heavily cratered surface.                                                        | t                   | t         |         3 |
|      35 | Nereid    |                 4500 |            340 |                              4700 | Nereid is one of Neptune's smaller moons and has an irregular, elongated shape. It is believed to be a captured object from the Kuiper Belt.                                                | t                   | t         |         3 |
|      36 | Phobos    |                 4500 |             22 |                                58 | Phobos is the larger and closer of Mars's two moons. It has a heavily cratered surface and is believed to be a captured asteroid.                                                           | t                   | f         |         3 |
|      37 | Hyperion  |                 4500 |            270 |                              1400 | Hyperion is one of Saturn's irregularly shaped moons known for its spongy appearance and chaotic rotation. It has a highly porous surface with numerous impact craters.                     | t                   | f         |         3 |
+---------+-----------+----------------------+----------------+-----------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------+-----------+-----------+
(20 rows)

universe=> \d satellite;
                                                   Table "public.satellite"
+----------------------------+-----------------------+-----------+----------+-------------------------------------------------+
|           Column           |         Type          | Collation | Nullable |                     Default                     |
+----------------------------+-----------------------+-----------+----------+-------------------------------------------------+
| satellite_id               | integer               |           | not null | nextval('satellite_satellite_id_seq'::regclass) |
| name                       | character varying(40) |           | not null |                                                 |
| launch_mass_in_kg          | integer               |           |          |                                                 |
| development_time_in_years  | integer               |           |          |                                                 |
| cost                       | numeric               |           |          |                                                 |
| description                | text                  |           |          |                                                 |
| is_passive                 | boolean               |           |          |                                                 |
| is_communication_satellite | boolean               |           |          |                                                 |
| type_of_orbit              | character varying(30) |           |          |                                                 |
+----------------------------+-----------------------+-----------+----------+-------------------------------------------------+
Indexes:
    "satellite_pkey" PRIMARY KEY, btree (satellite_id)
    "satellite_name_key" UNIQUE CONSTRAINT, btree (name)

universe=> ALTER TABLE satellite RENAME COLUMN cost TO cost_in_billion_usd;
ALTER TABLE
universe=> \d satellite
                                                   Table "public.satellite"
+----------------------------+-----------------------+-----------+----------+-------------------------------------------------+
|           Column           |         Type          | Collation | Nullable |                     Default                     |
+----------------------------+-----------------------+-----------+----------+-------------------------------------------------+
| satellite_id               | integer               |           | not null | nextval('satellite_satellite_id_seq'::regclass) |
| name                       | character varying(40) |           | not null |                                                 |
| launch_mass_in_kg          | integer               |           |          |                                                 |
| development_time_in_years  | integer               |           |          |                                                 |
| cost_in_billion_usd        | numeric               |           |          |                                                 |
| description                | text                  |           |          |                                                 |
| is_passive                 | boolean               |           |          |                                                 |
| is_communication_satellite | boolean               |           |          |                                                 |
| type_of_orbit              | character varying(30) |           |          |                                                 |
+----------------------------+-----------------------+-----------+----------+-------------------------------------------------+
Indexes:
    "satellite_pkey" PRIMARY KEY, btree (satellite_id)
    "satellite_name_key" UNIQUE CONSTRAINT, btree (name)

universe=> ALTER TABLE satellite RENAME COLUMN cost_in_billion_usd TO cost_in_million_usd;
ALTER TABLE
universe=> INSERT INTO satellite( name, launch_mass_in_kg, development_time_in_years, cost_in_billion_usd, description, is_passive, is_communication_satellite, type_of_orbit) VALUES ('Hubble Space Telescope', 11100, 10, 4700, 'The Hubble Space Telescope is a space telescope that was launched into low Earth orbit in 1990. It has provided astronomers with incredible views of the universe, helping to answer numerous scientific questions.', FALSE, FALSE, 'LEO'), ('GPS Satellite', Variable, Variable, Variable, 'GPS satellites are part of a constellation of satellites operated by the United States government to provide global positioning system (GPS) services for navigation and timing. They transmit signals that allow GPS receivers to determine their precise location and time.', FALSE, FALSE, 'MEO'),   ('ISS (International Space Station)', 420000, Over a decade, 150000, 'The ISS is a large space station in low Earth orbit that serves as a microgravity laboratory for scientific research in space. It is a collaborative project involving multiple space agencies, including NASA, Roscosmos, ESA, JAXA, and CSA.', FALSE, FALSE, 'LEO'), ('IRIDIUM Satellite', 689, Several years, 3000, 'IRIDIUM satellites are part of a satellite constellation operated by Iridium Communications Inc. They provide satellite phone and data services worldwide, facilitating global communication.', FALSE, TRUE, 'Polar Orbit');
ERROR:  syntax error at or near "a"
LINE 1: ...'ISS (International Space Station)', 420000, Over a decade, ...
                                                             ^
universe=> INSERT INTO satellite( name, launch_mass_in_kg, development_time_in_years, cost_in_billion_usd, description, is_passive, is_communication_satellite, type_of_orbit) VALUES ('Hubble Space Telescope', 11100, 10, 4700, 'The Hubble Space Telescope is a space telescope that was launched into low Earth orbit in 1990. It has provided astronomers with incredible views of the universe, helping to answer numerous scientific questions.', FALSE, FALSE, 'LEO'), ('GPS Satellite', Variable, Variable, Variable, 'GPS satellites are part of a constellation of satellites operated by the United States government to provide global positioning system (GPS) services for navigation and timing. They transmit signals that allow GPS receivers to determine their precise location and time.', FALSE, FALSE, 'MEO'),   ('ISS (International Space Station)', 420000, 10, 150000, 'The ISS is a large space station in low Earth orbit that serves as a microgravity laboratory for scientific research in space. It is a collaborative project involving multiple space agencies, including NASA, Roscosmos, ESA, JAXA, and CSA.', FALSE, FALSE, 'LEO'), ('IRIDIUM Satellite', 689, 10, 3000, 'IRIDIUM satellites are part of a satellite constellation operated by Iridium Communications Inc. They provide satellite phone and data services worldwide, facilitating global communication.', FALSE, TRUE, 'Polar Orbit');
ERROR:  column "cost_in_billion_usd" of relation "satellite" does not exist
LINE 1: ...me, launch_mass_in_kg, development_time_in_years, cost_in_bi...
                                                             ^
universe=> INSERT INTO satellite( name, launch_mass_in_kg, development_time_in_years, cost_in_million_usd, description, is_passive, is_communication_satellite, type_of_orbit) VALUES ('Hubble Space Telescope', 11100, 10, 4700, 'The Hubble Space Telescope is a space telescope that was launched into low Earth orbit in 1990. It has provided astronomers with incredible views of the universe, helping to answer numerous scientific questions.', FALSE, FALSE, 'LEO'), ('GPS Satellite', Variable, Variable, Variable, 'GPS satellites are part of a constellation of satellites operated by the United States government to provide global positioning system (GPS) services for navigation and timing. They transmit signals that allow GPS receivers to determine their precise location and time.', FALSE, FALSE, 'MEO'),   ('ISS (International Space Station)', 420000, 10, 150000, 'The ISS is a large space station in low Earth orbit that serves as a microgravity laboratory for scientific research in space. It is a collaborative project involving multiple space agencies, including NASA, Roscosmos, ESA, JAXA, and CSA.', FALSE, FALSE, 'LEO'), ('IRIDIUM Satellite', 689, 10, 3000, 'IRIDIUM satellites are part of a satellite constellation operated by Iridium Communications Inc. They provide satellite phone and data services worldwide, facilitating global communication.', FALSE, TRUE, 'Polar Orbit');
ERROR:  column "variable" does not exist
LINE 1: ...stions.', FALSE, FALSE, 'LEO'), ('GPS Satellite', Variable, ...
                                                             ^
universe=> INSERT INTO satellite( name, launch_mass_in_kg, development_time_in_years, cost_in_million_usd, description, is_passive, is_communication_satellite, type_of_orbit) VALUES ('Hubble Space Telescope', 11100, 10, 4700, 'The Hubble Space Telescope is a space telescope that was launched into low Earth orbit in 1990. It has provided astronomers with incredible views of the universe, helping to answer numerous scientific questions.', FALSE, FALSE, 'LEO'), ('GPS Satellite', 1000, 10, 1000, 'GPS satellites are part of a constellation of satellites operated by the United States government to provide global positioning system (GPS) services for navigation and timing. They transmit signals that allow GPS receivers to determine their precise location and time.', FALSE, FALSE, 'MEO'),   ('ISS (International Space Station)', 420000, 10, 150000, 'The ISS is a large space station in low Earth orbit that serves as a microgravity laboratory for scientific research in space. It is a collaborative project involving multiple space agencies, including NASA, Roscosmos, ESA, JAXA, and CSA.', FALSE, FALSE, 'LEO'), ('IRIDIUM Satellite', 689, 10, 3000, 'IRIDIUM satellites are part of a satellite constellation operated by Iridium Communications Inc. They provide satellite phone and data services worldwide, facilitating global communication.', FALSE, TRUE, 'Polar Orbit');
INSERT 0 4
universe=> SELECT * FROM satellite;
+--------------+-----------------------------------+-------------------+---------------------------+---------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------+----------------------------+---------------+
| satellite_id |               name                | launch_mass_in_kg | development_time_in_years | cost_in_million_usd |                                                                                                                                  description                                                                                                                                  | is_passive | is_communication_satellite | type_of_orbit |
+--------------+-----------------------------------+-------------------+---------------------------+---------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------+----------------------------+---------------+
|            1 | Hubble Space Telescope            |             11100 |                        10 |                4700 | The Hubble Space Telescope is a space telescope that was launched into low Earth orbit in 1990. It has provided astronomers with incredible views of the universe, helping to answer numerous scientific questions.                                                           | f          | f                          | LEO           |
|            2 | GPS Satellite                     |              1000 |                        10 |                1000 | GPS satellites are part of a constellation of satellites operated by the United States government to provide global positioning system (GPS) services for navigation and timing. They transmit signals that allow GPS receivers to determine their precise location and time. | f          | f                          | MEO           |
|            3 | ISS (International Space Station) |            420000 |                        10 |              150000 | The ISS is a large space station in low Earth orbit that serves as a microgravity laboratory for scientific research in space. It is a collaborative project involving multiple space agencies, including NASA, Roscosmos, ESA, JAXA, and CSA.                                | f          | f                          | LEO           |
|            4 | IRIDIUM Satellite                 |               689 |                        10 |                3000 | IRIDIUM satellites are part of a satellite constellation operated by Iridium Communications Inc. They provide satellite phone and data services worldwide, facilitating global communication.                                                                                 | f          | t                          | Polar Orbit   |
+--------------+-----------------------------------+-------------------+---------------------------+---------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------+----------------------------+---------------+
(4 rows)

universe=> 