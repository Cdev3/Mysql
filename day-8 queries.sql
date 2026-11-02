CREATE DATABASE IF NOT EXISTS Employees;

USE Employees;

SHOW TABLES;

CREATE TABLE Employees (
   id INT,
   name VARCHAR(100),
   department VARCHAR(100),
   salary INT,
   isactive BOOLEAN
);
INSERT INTO Employees VALUES
(1, 'Rahul Sharma', 'IT', 50000, TRUE),
(2, 'Priya Reddy', 'HR', 30000, TRUE),
(3, 'Amit Kumar', 'Finance', 45000, FALSE),
(4, 'Sneha Patel', 'IT', 35000, TRUE),
(5, 'Vikram Singh', 'Finance', 28000, TRUE),
(6, 'Anjali Mehta', 'HR', 32000, FALSE),
(7, 'Kiran Rao', 'IT', 60000, TRUE),
(8, 'Pooja Verma', 'Marketing', 27000, TRUE);

SELECT * FROM Employees;

-- QUERIES 

-- 1) FROM IT DEPARTMENT AND SALARY GREATER THEN 40K
SELECT * FROM Employees WHERE department = 'IT' AND SALARY > 40000;

-- 2) HR OR WITH SALARY <35K
SELECT * FROM Employees WHERE department = 'HR' OR SALARY < 35000;

-- 3) SHOW EMPLOYEES NOT IN HR DEPT
SELECT * FROM Employees WHERE NOT department = 'HR';

-- 4) 
SELECT * FROM Employees WHERE department = 'Finance' OR 
(SALARY > 30000 AND isactive= 1);

-- queries on update 

-- 1) update salaries with 2000 for active it employees who earn less than 60k
UPDATE Employees SET  SALARY = SALARY +2000 WHERE DEPARTMENT = 'IT' AND ISACTIVE = TRUE AND SALARY < 60000;

-- 2) MAKE FINANCE OR INACTIVE EMPLOYEES SALARY 10PERCENT LESS
UPDATE Employees 
SET SALARY = SALARY-(SALARY*0.10) 
WHERE DEPARTMENT='FINANCE' 
OR ISACTIVE=FALSE;
