USE da8;

CREATE TABLE Orders (
 id INT,
 customer_name VARCHAR(100),
 order_date DATE,
 total_amount DECIMAL(10,2)
 );

INSERT INTO Orders VALUES
 (1, 'Alice', '2024-03-01', 1500.00),
 (2, 'Bob', '2024-03-05', 450.00),
 (3, 'Charlie', '2024-03-10', 2500.00),
 (4, 'Diana', '2024-03-15', 800.00),
 (5, 'Eve', '2024-03-20', 1200.00),
 (6, 'Frank', '2024-03-25', 3000.00),
 (7, 'Grace', '2024-04-02', 1800.00),
 (8, 'Henry', '2024-04-08', 950.00),
 (9, 'Ivy', '2024-04-12', 2750.00),
 (10, 'Jack', '2024-04-18', 650.00),
 (11, 'Kevin', '2024-04-22', 4200.00),
 (12, 'Lily', '2024-05-01', 1350.00),
 (13, 'Michael', '2024-05-08', 5000.00),
 (14, 'Nancy', '2024-05-15', 2250.00),
 (15, 'Oliver', '2024-05-25', 900.00);

SELECT*FROM ORDERS;


-- 1) order date from 3 to 10 of march in 2024
SELECT * FROM ORDERS
WHERE  ORDER_DATE BETWEEN '2024-03-03' AND '2024-03-10';

-- 2) order date from  
SELECT * FROM ORDERS
WHERE  ORDER_DATE BETWEEN '2024-04-01' AND '2024-04-30';

-- 3)
SELECT * FROM ORDERS
WHERE  total_amount BETWEEN 500 AND 1000;

-- 4)update 1000
SET sql_safe_updates=0;
UPDATE Orders SET  total_amount = total_amount+1000
WHERE  Order_date BETWEEN '2024-03-04' AND '2024-03-10';
SELECT * FROM ORDERS;

-- 5) reduce 200 btw 1000 and 2000
UPDATE Orders SET  total_amount = total_amount-200
WHERE  total_amount BETWEEN 1000 AND 2000;
SELECT * FROM ORDERS;

-- 6) increase total amount 
UPDATE Orders SET  total_amount = total_amount+(total_amount+0.10)
WHERE  total_amount BETWEEN 2500 AND 5000;
SELECT * FROM ORDERS;

