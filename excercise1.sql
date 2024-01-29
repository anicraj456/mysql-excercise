-- create table

CREATE TABLE seeds (
   seed_id INTEGER PRIMARY KEY AUTO_INCREMENT,
   crop VARCHAR(40),
   encourages VARCHAR(80),
   use_by INTEGER
);

-- create column

INSERT INTO seeds (crop, encourages, use_by)
VALUES ("Agastache", "bees & hummingbirds", 2020);

-- column

INSERT INTO seeds (crop, use_by)
VALUES ("Sun Gold Tomato", 2022);
INSERT INTO seeds (crop, use_by)
VALUES ("Sunflower", 2024);
INSERT INTO seeds (crop, encourages)
VALUES ("Jasmine", "bees & snakes");
INSERT INTO seeds (crop, encourages, use_by)
VALUES ("Rose", "bees & bugs", 2026);
INSERT INTO seeds (crop, encourages, use_by)
VALUES ("Marigold", "bees & hummingbirds", 2023);
INSERT INTO seeds (crop, encourages, use_by)
VALUES ("Eggplant", "deers", 2025);
INSERT INTO seeds (crop, encourages, use_by)
VALUES ("Carrot", "bubby", 2024);
INSERT INTO seeds (crop, encourages, use_by)
VALUES ("Tomato", "bugs", 2025);


-- read 
SELECT * FROM seeds;

SELECT crop FROM seeds;

SELECT crop, use_by
FROM seeds
ORDER BY use_by DESC;

SELECT crop, use_by
FROM seeds
ORDER BY use_by DESC, crop ASC;

SELECT crop
FROM seeds
WHERE seed_id = 4;

-- update

UPDATE seeds
SET use_by = 2024
WHERE seed_id = 1;

UPDATE seeds
SET use_by = 2025, encourages = "smell"
WHERE seed_id = 3;

ALTER TABLE seeds
ADD expired boolean;

UPDATE seeds
SET expired = true
WHERE use_by <= 2023;

-- delete

DELETE FROM seeds WHERE seed_id = 2;

DELETE FROM seeds WHERE expired = true;

-- bonus

SELECT * FROM seeds
WHERE encourages = "bees & hummingbirds" AND use_by= 2024;

SELECT * FROM seeds
WHERE encourages = "bugs" OR use_by= 2024;
SELECT * FROM seeds
WHERE encourages NOT LIKE "bugs";

SELECT *
FROM seeds
WHERE encourages = "not null";

ALTER TABLE seeds
MODIFY COLUMN crop INT;
