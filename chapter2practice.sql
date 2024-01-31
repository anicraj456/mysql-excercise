CREATE TABLE writing_supply (
   supply_id INTEGER PRIMARY KEY AUTO_INCREMENT,
   utensil_type ENUM ("Pencil", "Pen"),
   num_drawers INTEGER
);

CREATE TABLE pencil_drawer (
   drawer_id INTEGER PRIMARY KEY AUTO_INCREMENT,
   pencil_type ENUM ("Wood", "Mechanical"),
   quantity INTEGER,
   refill_drawer BOOLEAN,
   supply_id INTEGER,
   FOREIGN KEY (supply_id) REFERENCES writing_supply(supply_id)
);


CREATE TABLE pen_drawer (
   drawer_id INTEGER PRIMARY KEY AUTO_INCREMENT,
   pen_color ENUM ("Black", "Blue", "Red", "Green", "Purple"),
   quantity INTEGER,
   refill_drawer BOOLEAN,
   supply_id INTEGER,
   FOREIGN KEY (supply_id) REFERENCES writing_supply(supply_id)
);

SELECT * FROM writing_supply ;

-- Inner Join

SELECT *
FROM writing_supply
INNER JOIN pencil_drawer ON writing_supply.supply_id = pencil_drawer.supply_id;

-- Inner Join with condition

SELECT writing_supply.supply_id, pencil_type, drawer_id, quantity
FROM writing_supply
INNER JOIN pencil_drawer ON writing_supply.supply_id = pencil_drawer.supply_id
WHERE refill_drawer = true AND pencil_type = "Mechanical";

-- left join

SELECT writing_supply.supply_id, utensil_type, drawer_id, pen_color
FROM writing_supply
LEFT JOIN pen_drawer ON writing_supply.supply_id = pen_drawer.supply_id;

-- left join with condition
SELECT writing_supply.supply_id, utensil_type, drawer_id, pen_color, quantity
FROM writing_supply
LEFT JOIN pen_drawer ON writing_supply.supply_id = pen_drawer.supply_id
WHERE refill_drawer = true;

-- multiple join with union

SELECT writing_supply.supply_id, utensil_type, drawer_id, quantity FROM writing_supply
LEFT JOIN pencil_drawer ON writing_supply.supply_id = pencil_drawer.supply_id
WHERE refill_drawer = true
UNION
SELECT writing_supply.supply_id, utensil_type, drawer_id, quantity FROM writing_supply
RIGHT JOIN pen_drawer ON writing_supply.supply_id = pen_drawer.supply_id
WHERE refill_drawer = true
ORDER BY supply_id;

-- subqueries

SELECT supply_id FROM writing_supply
WHERE utensil_type = "Pen";
/* First result set contains the supply_id values 1, 2, and 5. */

SELECT drawer_id, pen_color FROM pen_drawer
WHERE quantity >= 60 AND supply_id = 5;

-- embedding one simple SQL command inside the WHERE clause of a second and condition

SELECT drawer_id, pen_color FROM pen_drawer
WHERE supply_id IN (SELECT supply_id FROM writing_supply WHERE utensil_type = "Pen")
AND quantity >= 60;
-- embedding one simple SQL command inside the WHERE clause of a second and condition and maxkeyword

SELECT drawer_id, pen_color FROM pen_drawer
WHERE supply_id = (SELECT MAX(supply_id) FROM writing_supply WHERE utensil_type = "Pen")
AND quantity >= 60;