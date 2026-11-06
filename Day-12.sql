USE DA8;
SHOW TABLES;
DROP TABLE STUDENTS ;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    course VARCHAR(50)
);

INSERT INTO Students VALUES
(101,'Rahul','Java Full Stack'),
(102,'Priya','Python Full Stack'),
(103,'Kiran','Data Science'),
(104,'Sneha','Java Full Stack'),
(105,'Ajay','Testing');

select*from students;

CREATE TABLE Placed_Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    company_name VARCHAR(50)
);
INSERT INTO Placed_Students VALUES
(103,'Kiran','TCS'),
(104,'Sneha','Infosys'),
(105,'Ajay','Wipro'),
(106,'Pooja','Accenture'),
(107,'Ramesh','Capgemini');

select*from placed_students;

-- UNION OPERATOR-------------------------------------------------

SELECT STUDENT_NAME FROM students
UNION
SELECT STUDENT_NAME FROM PLACED_STUDENTS;

-- UNION ALL OPERATOR-------------------------------------------------

SELECT STUDENT_NAME FROM students
UNION ALL
SELECT STUDENT_NAME FROM PLACED_STUDENTS;

-- INTERSECT OPERATOR-------------------------------------------------

SELECT STUDENT_NAME FROM students
INTERSECT
SELECT STUDENT_NAME FROM PLACED_STUDENTS;

-- EXCEPT OR MINUS OPERATOR-------------------------------------------------

SELECT STUDENT_NAME FROM students
EXCEPT 
SELECT STUDENT_NAME FROM PLACED_STUDENTS;



-- ----------------------JOINS--------------------------------------------
-- -----------------------------------------------------------------------

-- 1 INNER JOINS
-- 2 LEFT JOINS
-- 3 RIGHT JOINS
-- 4 FULL JOINS ( COMBO OF LEFT AND RIGHT JOINS)

-- INNER JOIN -----------------------------------------------------------------------------------

SELECT Students.student_ID
FROM Students
INNER JOIN Placed_Students
ON Students.student_id = Placed_Students.student_id;    -- STUDENTS ID USING INNER JOIN 

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DROP DATABASE DA8;
CREATE DATABASE IF NOT EXISTS DEV;
USE DEV;
SHOW TABLES;
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    salary DECIMAL(10,2)
);
 
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
 
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    emp_id INT
);
 
INSERT INTO Departments (department_id, department_name) VALUES
(1, 'Human Resources'), (2, 'Engineering'), (3, 'Marketing'), (4, 'Finance'), (5, 'Operations'),(6,'HR');
 
INSERT INTO Employees (emp_id, name, department_id, salary) VALUES
(101, 'Arjun', 1, 50000), (102, 'Bhavana', 2, 65000), (103, 'Charan', 2, 72000),
(104, 'Divya', 3, 45000), (105, 'Eswar', NULL, 40000), (106, 'Farhan', 4, 55000),
(107, 'Gowri', 2, 62000), (108, 'Harish', 5, 48000), (109, 'Ishita', NULL, 53000),
(110, 'Jagan', 3, 60000);
 
INSERT INTO Projects (project_id, project_name, emp_id) VALUES
(201, 'Website Redesign', 102), (202, 'Mobile Banking App', 103), (203, 'Marketing Campaign', 104),
(204, 'Payroll System', 106), (205, 'Backend Optimization', 107), (206, 'Cloud Migration', 102),
(207, 'Customer Analytics', 110), (208, 'Inventory System', NULL);

SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM PROJECTS;

-- --------------------------------------------------------------QUERIES---------------------------------------------------------------------------------------------------

SELECT E.EMP_ID,E.NAME,P.PROJECT_NAME
FROM EMPLOYEES E
INNER JOIN PROJECTS P
ON E.EMP_ID = P.EMP_ID;

