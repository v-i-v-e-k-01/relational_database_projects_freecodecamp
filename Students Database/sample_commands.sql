camper: /project$ psql --username=freecodecamp --dbname=students;
Border style is 2.
Title is " ".
Pager usage is off.
psql (12.17 (Ubuntu 12.17-1.pgdg22.04+1))
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
Type "help" for help.

students=> \l
                                 List of databases
+-----------+--------------+----------+---------+---------+-----------------------+
|   Name    |    Owner     | Encoding | Collate |  Ctype  |   Access privileges   |
+-----------+--------------+----------+---------+---------+-----------------------+
| postgres  | postgres     | UTF8     | C.UTF-8 | C.UTF-8 |                       |
| students  | freecodecamp | UTF8     | C.UTF-8 | C.UTF-8 |                       |
| template0 | postgres     | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
|           |              |          |         |         | postgres=CTc/postgres |
| template1 | postgres     | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
|           |              |          |         |         | postgres=CTc/postgres |
+-----------+--------------+----------+---------+---------+-----------------------+
(4 rows)

students=> \d
students=>                       List of relations
+--------+-------------------------+----------+--------------+
| Schema |          Name           |   Type   |    Owner     |
+--------+-------------------------+----------+--------------+
| public | courses                 | table    | freecodecamp |
| public | courses_course_id_seq   | sequence | freecodecamp |
| public | majors                  | table    | freecodecamp |
| public | majors_courses          | table    | freecodecamp |
| public | majors_major_id_seq     | sequence | freecodecamp |
| public | students                | table    | freecodecamp |
| public | students_student_id_seq | sequence | freecodecamp |
+--------+-------------------------+----------+--------------+
(7 rows)

;
students=> SELECT first_name, last_name, gpa FROM students WHERE last_name<'M' AND (gpa=3.9 OR gpa<2.3);
students=>                 
+------------+-----------+-----+
| first_name | last_name | gpa |
+------------+-----------+-----+
| Sterling   | Boss      | 3.9 |
| Faye       | Conn      | 2.1 |
+------------+-----------+-----+
(2 rows)

students=> SELECT * FROM students WHERE last_name<'M' AND (gpa=3.9 OR gpa<2.3);
students=>                             
+------------+------------+-----------+----------+-----+
| student_id | first_name | last_name | major_id | gpa |
+------------+------------+-----------+----------+-----+
|         13 | Sterling   | Boss      |       41 | 3.9 |
|         16 | Faye       | Conn      |       41 | 2.1 |
+------------+------------+-----------+----------+-----+
(2 rows)

;
students=> SELECT * FROM courses;
                       
+-----------+--------------------------------+
| course_id |             course             |
+-----------+--------------------------------+
|        23 | Data Structures and Algorithms |
|        24 | Web Programming                |
|        25 | Database Systems               |
|        26 | Computer Networks              |
|        27 | SQL                            |
|        28 | Machine Learning               |
|        29 | Computer Systems               |
|        30 | Web Applications               |
|        31 | Artificial Intelligence        |
|        32 | Python                         |
|        33 | Object-Oriented Programming    |
|        34 | Calculus                       |
|        35 | Game Architecture              |
|        36 | Algorithms                     |
|        37 | UNIX                           |
|        38 | Server Administration          |
|        39 | Network Security               |
+-----------+--------------------------------+
(17 rows)

students=> SELECT * FROM courses WHERE column LIKE '_lgorithms';
students=> SELECT * FROM courses;
students=> SELECT * FROM courses WHERE column LIKE '_lgorithms';
ERROR:  syntax error at or near "column"
LINE 1: SELECT * FROM courses WHERE column LIKE '_lgorithms';
                                    ^
students=> SELECT * FROM courses WHERE course LIKE '_lgorithms';
students=> SELECT * FROM courses WHERE course LIKE 'lgorithms';
students=> SELECT * FROM courses WHERE course LIKE '%lgorithms';
students=> SELECT * FROM courses WHERE course LIKE 'Web%';
students=> SELECT * FROM courses WHERE course LIKE '_e%';
students=> SELECT * FROM courses WHERE course LIKE '% %';
students=> SELECT * FROM courses WHERE course NOT LIKE '% %';
students=> SELECT * FROM courses WHERE course LIKE '%A%';
students=> SELECT * FROM courses WHERE course ILIKE 'A';
students=> SELECT * FROM courses WHERE course ILIKE 'a';
students=> SELECT * FROM courses WHERE course ILIKE '%a%';
students=> SELECT * FROM courses WHERE course NOT  ILIKE '%a%';
students=> SELECT * FROM courses WHERE course NOT  ILIKE '%a%' AND "% %";
ERROR:  column "% %" does not exist
LINE 1: ...LECT * FROM courses WHERE course NOT  ILIKE '%a%' AND "% %";
                                                                 ^
students=> SELECT * FROM courses WHERE course NOT  ILIKE '%a%' AND LIKE  "% %";
ERROR:  syntax error at or near ""% %""
LINE 1: ... FROM courses WHERE course NOT  ILIKE '%a%' AND LIKE  "% %";
                                                                 ^
students=> SELECT * FROM courses WHERE course NOT  ILIKE '%a%' AND LIKE "% %";
ERROR:  syntax error at or near ""% %""
LINE 1: ...* FROM courses WHERE course NOT  ILIKE '%a%' AND LIKE "% %";
                                                                 ^
students=> SELECT * FROM courses WHERE course NOT  ILIKE '%a%' AND LIKE '% %';
ERROR:  type "like" does not exist
LINE 1: ... * FROM courses WHERE course NOT  ILIKE '%a%' AND LIKE '% %'...
                                                             ^
students=> SELECT * FROM courses WHERE course NOT ILIKE '%a%' AND LIKE '% %';
ERROR:  type "like" does not exist
LINE 1: ...T * FROM courses WHERE course NOT ILIKE '%a%' AND LIKE '% %'...
                                                             ^
students=> SELECT * FROM courses WHERE course NOT ILIKE '%a%' AND course  LIKE '% %
';
students=> SELECT * FROM students;
students=> SELECT * FROM students WHERE gpa IS NULL;
students=> SELECT * FROM students WHERE gpa IS NOT NULL:
students-> 
students=> SELECT * FROM students WHERE gpa IS NOT NULL;
students=> SELECT * FROM students WHERE major IS NULL;
ERROR:  column "major" does not exist
LINE 1: SELECT * FROM students WHERE major IS NULL;
                                     ^
students=> SELECT * FROM students WHERE major_id IS NULL;
students=> SELECT * FROM students WHERE major_id IS NULL AND gpa IS NOT NULL;
students=> SELECT * FROM students WHERE major_id IS NULL AND gpa IS NULL;
students=> SELECT * FROM students ORDER BY gpa;
students=> SELECT * FROM students ORDER BY gpa DESC;
students=> SELECT * FROM students ORDER BY gpa DESC, first_name;
students=> SELECT * FROM students ORDER BY gpa DESC, first_name LIMIT 10;
students=> SELECT * FROM students WHERE gpa IS NOT NULL  ORDER BY gpa DESC, first_name LIMIT 10;
students=> SELECT MIN(gpa) FROM students;
students=> SELECT MAX(gpa) FROM students;
students=> SELECT SUM(major_id) FROM students;
students=> SELECT AVG(major_id) FROM students;
students=> SELECT CEIL(AVG(major_id)) FROM students;
students=> SELECT ROUND(AVG(major_id)) FROM students;
students=> SELECT ROUND(AVG(major_ID), 5) FROM students;
students=> SELECT COUNT(*) FROM majors;
students=> SELECT COUNT(*) FROM students;
students=> SELECT COUNT(major_id) FROM students;
students=> SELECT DISTINCT(major_id) FROM students;
students=> SELECT major_id FROM students GROUP BY major_id
students-> ;
students=> SELECT COUNT(*) FROM students GROUP BY major_id;
students=> SELECT major_id, COUNT(*) FROM students GROUP BY major_id;
students=> SELECT MIN(gpa) FROM students GROUP BY major_id);
ERROR:  syntax error at or near ")"
LINE 1: SELECT MIN(gpa) FROM students GROUP BY major_id);
                                                       ^
students=> SELECT MIN(gpa) FROM students GROUP BY major_id;
students=> SELECT major_id, MIN(gpa) FROM students GROUP BY major_id;
students=> SELECT major_id, MAX(gpa) FROM students GROUP BY major_id;
students=> 
[1]+  Stopped                 psql --username=freecodecamp --dbname=students
camper: /project$ psql --username=freecodecamp --dbname=students;
Border style is 2.
Title is " ".
Pager usage is off.
psql (12.17 (Ubuntu 12.17-1.pgdg22.04+1))
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
Type "help" for help.

students=> SELECT major_id, MIN(gpa), MAX(gpa) FROM students GROUP BY major_id;
            
+----------+-----+-----+
| major_id | min | max |
+----------+-----+-----+
|          | 2.3 | 3.8 |
|       42 | 2.6 | 2.6 |
|       41 | 2.1 | 4.0 |
|       38 | 2.2 | 3.4 |
|       36 | 1.9 | 3.7 |
|       37 | 1.8 | 4.0 |
+----------+-----+-----+
(6 rows)

students=> SELECT major_id, MIN(gpa), MAX(gpa) FROM students GROUP BY major_id HAVING gpa>4.0;
ERROR:  column "students.gpa" must appear in the GROUP BY clause or be used in an aggregate function
LINE 1: ...a), MAX(gpa) FROM students GROUP BY major_id HAVING gpa>4.0;
                                                               ^
students=> SELECT major_id, MIN(gpa), MAX(gpa) FROM students GROUP BY major_id HAVING gpa<=4.0;
ERROR:  column "students.gpa" must appear in the GROUP BY clause or be used in an aggregate function
LINE 1: ...), MAX(gpa) FROM students GROUP BY major_id HAVING gpa<=4.0;
                                                              ^
students=> SELECT major_id, MIN(gpa), MAX(gpa) FROM students GROUP BY major_id HAVING MAX(gpa) = 4.0;
            
+----------+-----+-----+
| major_id | min | max |
+----------+-----+-----+
|       41 | 2.1 | 4.0 |
|       37 | 1.8 | 4.0 |
+----------+-----+-----+
(2 rows)

students=> SELECT major_id, MIN(gpa) AS min_gpa , MAX(gpa) FROM students GROUP BY major_id HAVING MAX(gpa) = 4.0;
              
+----------+---------+-----+
| major_id | min_gpa | max |
+----------+---------+-----+
|       41 |     2.1 | 4.0 |
|       37 |     1.8 | 4.0 |
+----------+---------+-----+
(2 rows)

students=> SELECT major_id, MIN(gpa) AS min_gpa , MAX(gpa) AS max_gpa FROM students GROUP BY major_id HAVING MAX(gpa) = 4
.0;
students=>                 
+----------+---------+---------+
| major_id | min_gpa | max_gpa |
+----------+---------+---------+
|       41 |     2.1 |     4.0 |
|       37 |     1.8 |     4.0 |
+----------+---------+---------+
(2 rows)

;
students=> SELECT major_id, COUNT(major_id) AS number_of_students FROM students GROUP BY major_id;
students=>                  
+----------+--------------------+
| major_id | number_of_students |
+----------+--------------------+
|          |                  0 |
|       42 |                  1 |
|       41 |                  6 |
|       38 |                  4 |
|       36 |                  6 |
|       37 |                  6 |
+----------+--------------------+
(6 rows)

;
students=> SELECT major_id, COUNT(*) AS number_of_students FROM students GROUP BY major_id;
                 
+----------+--------------------+
| major_id | number_of_students |
+----------+--------------------+
|          |                  8 |
|       42 |                  1 |
|       41 |                  6 |
|       38 |                  4 |
|       36 |                  6 |
|       37 |                  6 |
+----------+--------------------+
(6 rows)

students=> SELECT major_id, COUNT(*) AS number_of_students FROM students GROUP BY major_id HAVING COUNT(*)<8;
students=>                  
+----------+--------------------+
| major_id | number_of_students |
+----------+--------------------+
|       42 |                  1 |
|       41 |                  6 |
|       38 |                  4 |
|       36 |                  6 |
|       37 |                  6 |
+----------+--------------------+
(5 rows)
