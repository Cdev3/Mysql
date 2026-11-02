CREATE DATABASE IF NOT EXISTS Products;

USE Products;

SHOW TABLES;

CREATE TABLE Products (
 id INT,
 name VARCHAR(100),
 price DECIMAL(10,2),
 qty INT
 );

INSERT INTO Products VALUES
 (1, 'Pen', 10.00, 100),
 (2, 'Notebook', 25.00, 50),
 (3, 'Pencil', 5.00, 200),
 (4, 'Eraser', 3.00, 300),
 (5, 'Marker', 15.00, 80),
 (6, 'Scale', 20.00, 150),
 (7, 'Sharpener', 8.00, 120),
 (8, 'Geometry Box', 120.00, 40),
 (9, 'Sketch Pen', 60.00, 75),
 (10, 'Crayons', 90.00, 55);
 
 SELECT * FROM Products;
 
 -- Calculate discounted price by subtracting price with 5rs.
 SELECT NAME , PRICE,PRICE-5 AS DISCOUNTED_PRICE FROM Products;
 
 -- total inventory of each product 
  SELECT NAMR,PRICE,QTY,PRICE*QTY AS  TOTAL_INVENTORY FROM PRODUCTS;
 
 -- 
 SELECT NAME,PRICE,QTY, PRICE*10 AS PRICE_PER10UNITs FROM PRODUCTS;
 
 -- products where quantity is not a multiple of 50  
 
 
 -- 1 Add 2 units to all products 
 SET SQL_SAFE_UPDATES=0;
 UPDATE PRODUCTS SET QTY = QTY+2;
 
 -- 2 Subtract 5 from price of each product 
  SET SQL_SAFE_UPDATES=0;
 UPDATE PRODUCTS SET PRICE = PRICE-5;
 
-- 3  DOUBLE THE QUANTITY OF ERASERS
 UPDATE PRODUCTS SET QTY = QTY+2 
WHERE NAME='Eraser';
-- 4 half the quantity of the marker 
UPDATE PRODUCTS SET QTY = QTY/2
WHERE NAME='Marker';

-- 5)delete products where quantity is less than 100 
DELETE FROM PRODUCTS WHERE QTY < 100 ;

--  6)PRICE LESS THE 10 NEED TO BE DELETED FROM RECORDS
DELETE FROM PRODUCTS WHERE PRICE < 10;



 
 
 