USE da8;

CREATE TABLE Emp (
 id INT,
 name VARCHAR(100),
 dept VARCHAR(20),
 salary INT
 );


INSERT INTO Emp VALUES
 (1, 'Rahul', 'IT', 50000),
 (2, 'Ramesh', 'HR', 35000),
 (3, 'Karan', 'Finance', 45000),
 (4, 'Mahesh', 'Marketing', 40000),
 (5, 'Suresh', 'IT', 55000),
 (6, 'Arjun', 'Sales', 38000),
 (7, 'Manish', 'Admin', 42000),
 (8, 'Ganesh', 'Finance', 47000),
 (9, 'Naresh', 'HR', 39000),
 (10, 'Rohan', 'IT', 52000),
 (11, 'Mohan', 'Sales', 41000),
 (12, 'Kishan', 'Marketing', 43000),
 (13, 'Dinesh', 'Admin', 46000),
 (14, 'Rajesh', 'Finance', 51000),
 (15, 'Kiran', 'IT', 48000);

select*from emp;


-- queries 

-- 1) only it and finance dept
SELECT *FROM emp
WHERE dept in ('IT','FINANCE');

-- 2) hr or sales 
SELECT *FROM emp
WHERE dept in ('HR','SALES');

-- 3) SALARY 
SELECT *FROM emp
WHERE SALARY in ('35000','42000','60000');

-- 4) increase 2000 hr or marketing 
UPDATE emp
SET salary = salary + 2000
WHERE department IN ('HR', 'Marketing');
SELECT *FROM emp;

-- 5) 
UPDATE emp
SET salary = salary + 2000
WHERE department IN ('35000', 'Marketing');
SELECT *FROM emp;

DROP TABLE EMP;



