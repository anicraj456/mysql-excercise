-- Movie Table
CREATE TABLE movies (
   movie_id INTEGER PRIMARY KEY AUTO_INCREMENT,
   title VARCHAR(120),
   year_released INTEGER,
   director VARCHAR(80)
);

-- Director Table
CREATE TABLE directors (
   director_id INTEGER PRIMARY KEY AUTO_INCREMENT,
   first_name VARCHAR(40),
   last_name VARCHAR(40),
   country VARCHAR(80)
);

-- deleting Movie table
DROP TABLE movies;

-- Modified Movie Table
CREATE TABLE movies (
   movie_id INTEGER PRIMARY KEY AUTO_INCREMENT,
   title VARCHAR(120),
   year_released INTEGER,
   director_id INTEGER,
   FOREIGN KEY (director_id) REFERENCES directors(director_id)
);

-- Task List
-- 1
SELECT title
FROM movies;

-- 2
SELECT title, year_released
FROM movies
ORDER BY year_released DESC;

-- 3
SELECT *
FROM directors
ORDER BY country ASC;

-- 4
SELECT *
FROM directors
ORDER BY country ASC,last_name ASC;

-- 5
INSERT INTO directors(first_name, last_name, country)
VALUES ("Rob", "Reiner", "USA");

-- 6
SELECT last_name, director_id
FROM directors
WHERE last_name = "Reiner";

-- 7
INSERT INTO movies(title, year_released, director_id)
VALUES ("The Princess Bride", 1987, 11);

-- 8
SELECT movies.title,directors.first_name, directors.last_name FROM movies
INNER JOIN directors ON movies.director_id = directors.director_id;

-- 9
SELECT movies.title,directors.first_name, directors.last_name FROM movies
INNER JOIN directors ON movies.director_id = directors.director_id
ORDER BY last_name ASC;

-- 10
SELECT director_id 
FROM movies 
WHERE title= "The Incredibles";

SELECT first_name, last_name
FROM directors
WHERE director_id = (SELECT director_id FROM movies WHERE title= "The Incredibles");

-- 11
SELECT last_name, country
FROM directors
INNER JOIN movies ON movies.director_id = directors.director_id 
WHERE title = "Roma";

-- 12
DELETE FROM movies
WHERE movie_id = 16;

-- 13
DELETE FROM directors
WHERE director_id = 3;

-- BONUS
-- 1
SELECT m.title,d.first_name, d.last_name 
FROM movies AS m
INNER JOIN directors AS d ON m.director_id = d.director_id;

SELECT last_name, country
FROM directors AS d
INNER JOIN movies AS m ON m.director_id = d.director_id 
WHERE title = "Roma";

SELECT m.title,d.first_name, d.last_name 
FROM movies AS m
INNER JOIN directors AS d ON m.director_id = d.director_id
ORDER BY last_name ASC;

-- 2
SELECT title
FROM movies
WHERE director_id = 7;

-- 3
ALTER TABLE movies
ADD profit INT;

UPDATE movies
SET profit = 100000
WHERE movie_id=1;

UPDATE movies
SET profit = 100500
WHERE movie_id=2;

UPDATE movies
SET profit = 103500
WHERE movie_id=3;

UPDATE movies
SET profit = 102500
WHERE movie_id=4;

UPDATE movies
SET profit = 100550
WHERE movie_id=5;

UPDATE movies
SET profit = 110500
WHERE movie_id=6;

UPDATE movies
SET profit = 1100500
WHERE movie_id=7;

UPDATE movies
SET profit = 1005000
WHERE movie_id=8;

UPDATE movies
SET profit = 1000500
WHERE movie_id=9;

UPDATE movies
SET profit = 120500
WHERE movie_id=10;

UPDATE movies
SET profit = 100500
WHERE movie_id=11;

UPDATE movies
SET profit = 1010500
WHERE movie_id=12;

UPDATE movies
SET profit = 1005100
WHERE movie_id=13;

UPDATE movies
SET profit = 1500500
WHERE movie_id=14;

UPDATE movies
SET profit = 1600500
WHERE movie_id=15;

UPDATE movies
SET profit = 1005060
WHERE movie_id=16;

UPDATE movies
SET profit = 1030500
WHERE movie_id=17;

-- 4
SELECT title
FROM movies
ORDER BY profit ASC;

-- 5
SELECT title
FROM movies
ORDER BY profit ASC;

-- 6
SELECT title
FROM movies
WHERE profit >= 1000500;

