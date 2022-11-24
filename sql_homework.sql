
.mode markdown
.header on
-- fact_table
CREATE TABLE invoice(
  invoice_id INT UNIQUE PRIMARY KEY,
  order_id INT, 
  order_date DATE,
  day_id INT,
  customer_id INT,
  FOREIGN KEY(order_id)
    REFERENCES 'order'(order_id),
  FOREIGN KEY(day_id)
    REFERENCES 'day'(day_id)
  FOREIGN KEY(customer_id)
    REFERENCES customer(customer_id)
  );
INSERT INTO invoice VALUES
    (1,1,'2022-08-29',1,1),
    (2,2,'2022-08-30',2,2),
    (3,3,'2022-08-31',3,3),
    (4,4,'2022-09-01',4,4),
    (5,5,'2022-09-02',5,5),
    (6,6,'2022-09-03',6,3),
    (7,7,'2022-09-04',7,2),
    (8,8,'2022-09-05',1,1);
-- dimension_table1
CREATE TABLE customer(
  customer_id INT PRIMARY KEY,
  name TEXT,
  lastname TEXT,
  gender TEXT
);
INSERT INTO customer values
  (1,'Eric','Johnson','M'),
  (2,'Eddie','Vanhelen','M'),
  (3,'Taka','Moriuchi','M'),
  (4,'Taylor','Swift','F'),
  (5,'John','Lennon','M');
-- dimension_table2
CREATE TABLE 'order'(
  order_id INT PRIMARY KEY,
  menu_id INT,
  quantity INT,
  order_value REAL,
  payment_id INT,
  FOREIGN KEY(menu_id)
    REFERENCES menu(menu_id),
  FOREIGN KEY(payment_id)
    REFERENCES payment(payment_id)
);
INSERT INTO 'order' VALUES
  (1,2,2,30,1),
  (2,1,3,15.3,2),
  (3,3,1,20,2),
  (4,3,1,20,1),
  (5,4,2,10,2),
  (6,3,1,20,1),
  (7,2,1,15,2),
  (8,4,1,5,2);
-- dimension_table3
CREATE TABLE menu (
  menu_id INT PRIMARY KEY,
  menu_name TEXT,
  menu_price REAL,
  menu_type TEXT
);
INSERT INTO menu VALUES
  (1,'Garlic Bread',5.1,'APPETIZER'),
  (2,'Carbonara',15,'PASTA'),
  (3,'Lasagna',20,'PASTA'),
  (4,'Icecream',5,'DESSERT'),
  (5,'Mango Sorbet',5,'DESSERT');
-- dimension_table4
CREATE TABLE payment(
  payment_id INT PRIMARY KEY,
  payment_type TEXT
  );
INSERT INTO payment VALUES
  (1,'cash'),
  (2,'credit card');
--dimension_table5
CREATE TABLE 'day'(
  day_id INT PRIMARY KEY,
  day_name TEXT 
);
INSERT INTO 'day' VALUES
  (1,'Monday'),
  (2,'Tuesday'),
  (3,'Wednesday'),
  (4,'Thursday'),
  (5,'Friday'),
  (6,'Saturday');
-- Data analyze
-- 1.Top 3 best sale value day
SELECT 
  order_date AS date, 
  order_value AS sales_value
FROM 'order'  
JOIN invoice  
  ON 'order'.order_id = invoice.order_id
ORDER BY sales_value DESC
LIMIT 3 ;

-- 2.What menu most sale value?
WITH sub AS(
SELECT *
  FROM 'order'  
  JOIN invoice  
    ON 'order'.order_id = invoice.order_id
  JOIN menu 
    ON menu.menu_id = 'order'.menu_id
)
SELECT 
  menu_name,
  SUM(order_value) AS sales_value
FROM sub
GROUP BY menu_name
ORDER BY sales_value DESC ;
-- 3.What payment method most used ?
SELECT 
  type,
  quatity
FROM(
SELECT 
  pm.payment_type AS type,
  COUNT(iv.order_id) AS quatity
FROM invoice AS iv 
JOIN 'order' AS od 
  ON iv.order_id = od.order_id
JOIN payment AS pm
  ON pm.payment_id = od.payment_id
GROUP BY pm.payment_type
)
ORDER BY quatity DESC;
.mode markdown
.header on
-- fact_table
CREATE TABLE invoice(
  invoice_id INT UNIQUE PRIMARY KEY,
  order_id INT, 
  order_date DATE,
  day_id INT,
  customer_id INT,
  FOREIGN KEY(order_id)
    REFERENCES 'order'(order_id),
  FOREIGN KEY(day_id)
    REFERENCES 'day'(day_id)
  FOREIGN KEY(customer_id)
    REFERENCES customer(customer_id)
  );
INSERT INTO invoice VALUES
    (1,1,'2022-08-29',1,1),
    (2,2,'2022-08-30',2,2),
    (3,3,'2022-08-31',3,3),
    (4,4,'2022-09-01',4,4),
    (5,5,'2022-09-02',5,5),
    (6,6,'2022-09-03',6,3),
    (7,7,'2022-09-04',7,2),
    (8,8,'2022-09-05',1,1);
-- dimension_table1
CREATE TABLE customer(
  customer_id INT PRIMARY KEY,
  name TEXT,
  lastname TEXT,
  gender TEXT
);
INSERT INTO customer values
  (1,'Eric','Johnson','M'),
  (2,'Eddie','Vanhelen','M'),
  (3,'Taka','Moriuchi','M'),
  (4,'Taylor','Swift','F'),
  (5,'John','Lennon','M');
-- dimension_table2
CREATE TABLE 'order'(
  order_id INT PRIMARY KEY,
  menu_id INT,
  quantity INT,
  order_value REAL,
  payment_id INT,
  FOREIGN KEY(menu_id)
    REFERENCES menu(menu_id),
  FOREIGN KEY(payment_id)
    REFERENCES payment(payment_id)
);
INSERT INTO 'order' VALUES
  (1,2,2,30,1),
  (2,1,3,15.3,2),
  (3,3,1,20,2),
  (4,3,1,20,1),
  (5,4,2,10,2),
  (6,3,1,20,1),
  (7,2,1,15,2),
  (8,4,1,5,2);
-- dimension_table3
CREATE TABLE menu (
  menu_id INT PRIMARY KEY,
  menu_name TEXT,
  menu_price REAL,
  menu_type TEXT
);
INSERT INTO menu VALUES
  (1,'Garlic Bread',5.1,'APPETIZER'),
  (2,'Carbonara',15,'PASTA'),
  (3,'Lasagna',20,'PASTA'),
  (4,'Icecream',5,'DESSERT'),
  (5,'Mango Sorbet',5,'DESSERT');
-- dimension_table4
CREATE TABLE payment(
  payment_id INT PRIMARY KEY,
  payment_type TEXT
  );
INSERT INTO payment VALUES
  (1,'cash'),
  (2,'credit card');
--dimension_table5
CREATE TABLE 'day'(
  day_id INT PRIMARY KEY,
  day_name TEXT 
);
INSERT INTO 'day' VALUES
  (1,'Monday'),
  (2,'Tuesday'),
  (3,'Wednesday'),
  (4,'Thursday'),
  (5,'Friday'),
  (6,'Saturday');
-- Data analyze
-- 1.Top 3 best sale value day
SELECT 
  order_date AS date, 
  order_value AS sales_value
FROM 'order'  
JOIN invoice  
  ON 'order'.order_id = invoice.order_id
ORDER BY sales_value DESC
LIMIT 3 ;

-- 2.What menu most sale value?
WITH sub AS(
SELECT *
  FROM 'order'  
  JOIN invoice  
    ON 'order'.order_id = invoice.order_id
  JOIN menu 
    ON menu.menu_id = 'order'.menu_id
)
SELECT 
  menu_name,
  SUM(order_value) AS sales_value
FROM sub
GROUP BY menu_name
ORDER BY sales_value DESC ;
-- 3.What payment method most used ?
SELECT 
  type,
  quatity
FROM(
SELECT 
  pm.payment_type AS type,
  COUNT(iv.order_id) AS quatity
FROM invoice AS iv 
JOIN 'order' AS od 
  ON iv.order_id = od.order_id
JOIN payment AS pm
  ON pm.payment_id = od.payment_id
GROUP BY pm.payment_type
)
ORDER BY quatity DESC;
