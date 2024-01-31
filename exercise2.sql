-- plant table

CREATE TABLE plant(
   plant_id INTEGER PRIMARY KEY AUTO_INCREMENT,
   plant_name VARCHAR(40),
   zone INTEGER,
   season VARCHAR(15),
   credits INTEGER
);

-- seeds table with foreign key

CREATE TABLE seeds(
   seed_id INTEGER PRIMARY KEY AUTO_INCREMENT,
   expiration_date DATE,
   quantity INTEGER,
   reorder BOOLEAN,
   credits INTEGER,
   plant_id INTEGER,
   FOREIGN KEY (plant_id) REFERENCES plant(plant_id)
);

-- garden_bed table with foregin key

CREATE TABLE garden_bed(
   space_number INTEGER PRIMARY KEY AUTO_INCREMENT,
   date_planted DATE,
   doing_well BOOLEAN,
   plant_id INTEGER,
   FOREIGN KEY (plant_id) REFERENCES plant(plant_id)
);

-- inner join

SELECT *
FROM seeds
INNER JOIN garden_bed ON seeds.plant_id = garden_bed.plant_id;

-- left join

SELECT *
FROM garden_bed
LEFT JOIN seeds ON garden_bed.plant_id = seeds.plant_id ;

-- right join

SELECT *
FROM seeds
RIGHT JOIN garden_bed ON seeds.plant_id=garden_bed.plant_id;

-- Full Join

SELECT *
FROM seeds 
FULL OUTER JOIN garden_bed ON seeds.plant_id = garden_bed.plant_id
WHERE seeds.plant_id = 2;

-- subquery

SELECT plant_name
FROM plant
INNER JOIN(
SELECT seeds.plant_id FROM seeds INNER JOIN garden_bed ON seeds.plant_id=garden_bed.plant_id)
 AS planted_plants ON plant.plant_id=planted_plants.plant_id;
 
 
 -- Bonus
 
SELECT plant_id FROM seeds
WHERE plant_id = 2
UNION
SELECT plant_id FROM garden_bed;




