USE DEV;
SHOW TABLES;

CREATE TABLE Customers (
  customer_id	INT PRIMARY KEY,
  customer_name  VARCHAR(50),
  city       	VARCHAR(50),
  customer_type  VARCHAR(20)
);
 
CREATE TABLE Product (
  product_id 	INT PRIMARY KEY,
  product_name   VARCHAR(50),
  category   	VARCHAR(30),
  price      	DECIMAL(10,2)
);
 
CREATE TABLE Orders (
  order_id   	INT PRIMARY KEY,
  customer_id	INT REFERENCES Customers(customer_id),
  product_id 	INT REFERENCES Products(product_id),
  quantity   	INT,
  order_date 	DATE,
  amount     	DECIMAL(10,2)
);


INSERT INTO Customers (customer_id, customer_name, city, customer_type) VALUES (1, 'Rahul', 'Delhi', 'Premium');
INSERT INTO Customers (customer_id, customer_name, city, customer_type) VALUES (2, 'Meena', 'Mumbai', 'Regular');
INSERT INTO Customers (customer_id, customer_name, city, customer_type) VALUES (3, 'Arjun', 'Bangalore', 'Premium');
INSERT INTO Customers (customer_id, customer_name, city, customer_type) VALUES (4, 'Kavya', 'Delhi', 'Regular');
INSERT INTO Customers (customer_id, customer_name, city, customer_type) VALUES (5, 'Suresh', 'Chennai', 'Premium');
INSERT INTO Customers (customer_id, customer_name, city, customer_type) VALUES (6, 'Anjali', 'Mumbai', 'Regular');
INSERT INTO Customers (customer_id, customer_name, city, customer_type) VALUES (7, 'Vikram', 'Delhi', 'Regular');
INSERT INTO Customers (customer_id, customer_name, city, customer_type) VALUES (8, 'Pooja', 'Bangalore', 'Premium');
INSERT INTO Customers (customer_id, customer_name, city, customer_type) VALUES (9, 'Devi', 'Chennai', 'Regular');



INSERT INTO Product (product_id, product_name, category, price) VALUES (1, 'Laptop', 'Electronics', 55000);
INSERT INTO Product (product_id, product_name, category, price) VALUES (2, 'Mobile', 'Electronics', 25000);
INSERT INTO Product (product_id, product_name, category, price) VALUES (3, 'Chair', 'Furniture', 7000);
INSERT INTO Product (product_id, product_name, category, price) VALUES (4, 'Table', 'Furniture', 9000);
INSERT INTO Product (product_id, product_name, category, price) VALUES (5, 'Headphones', 'Electronics', 3000);
INSERT INTO Product (product_id, product_name, category, price) VALUES (6, 'Bookshelf', 'Furniture', 6000);


INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_date, amount) VALUES (1, 1, 1, 1, '2023-01-05', 55000);
INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_date, amount) VALUES (2, 2, 2, 1, '2023-01-10', 25000);
INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_date, amount) VALUES (3, 3, 3, 2, '2023-02-01', 14000);
INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_date, amount) VALUES (4, 1, 5, 2, '2023-02-15', 6000);
INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_date, amount) VALUES (5, 4, 4, 1, '2023-03-03', 9000);
INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_date, amount) VALUES (6, 5, 2, 2, '2023-03-20', 50000);
INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_date, amount) VALUES (7, 6, 4, 3, '2023-04-02', 18000);
INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_date, amount) VALUES (8, 3, 5, 1, '2023-04-15', 3000);
INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_date, amount) VALUES (9, 7, 3, 1, '2023-05-01', 7000);
INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_date, amount) VALUES (10, 8, 1, 1, '2023-05-20', 54000);
INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_date, amount) VALUES (11, 2, 3, 2, '2023-06-02', 12000);
INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_date, amount) VALUES (12, 5, 4, 1, '2023-06-15', 8500);

select*from customers;
select*from product;
select*from orders;


-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- SINGLE SUB QUERY
-- 1)
SELECT product_name,price from product where price=(select MAX(price) from product);

-- 2)  PRINT THE ORDER AMOUNT WHICH HAS SMALLEST ORDER AMOUNT AND (ORDER ID ,CUSTOMER ID,AMOUNT)
SELECT order_id,customer_id,amount from orders where amount = ( select MIN(amount) from orders);

-- 3)  find the name of the customer who placed order number 5 
SELECT customer_name from customers where customer_id = ( select customer_name from orders where order_id=5);

-- 4)   find the category of the product that was purchased in order number 1
SELECT category from product where product_id = (select product_id from orders where order_id=1);

-- 5) find the name of customers who live in delhi and mumbai 
select customer_name,city from customers where city in ('mumbai','delhi');

-- 6) find the products that have been ordered atleast once
select product_name from product where product_id not in (select product_id from orders);

-- 7) find the name of the customers who placed atleast one order
select customer_name from customers where customer_id  in (select customer_id from orders);

-- --------------------------------------------Multi row sub query -------------------------------------------------------------------------------------------------------

-- 1) find the products price grater then any product in the furniture catgory
select price,product_name from product where price > ANY(select  price from product where category='Furniture');      -- *** ANY  & ALL 

select price,product_name from product where price > ALL(select  price from product where category='Furniture');  

-- ---------------------------------------------------------- Nested sub queries -------------------------------------------------------------------------------------------

SELECT  MAX(Price) AS THIRD_PRICE FROM PRODUCT WHERE PRICE<(SELECT MAX(PRICE) FROM PRODUCT WHERE PRICE<(SELECT MAX(PRICE) FROM PRODUCT));

-- 1) FIND THE NAME OF THE  CUSTOMER WHO ORDERED MOST EXPENSIVE PRODUCT 

SELECT customer_name from customers 
where customer_id IN ( SELECT customer_id FROM  orders 
                                 where Product_id = (SELECT PRODUCT_ID FROM  Product 
                                 where price =(select MAX(price) from product)
                                 )
                                 );




