use mohitdb;
create database mohitdb;
select * from employees;
CREATE TABLE Employees (
    EmployeeID   int PRIMARY KEY,
    Name         varchar(100),
    DepartmentID int,
    Salary       int
);
 
INSERT INTO Employees VALUES (1, 'Alice',   10, 50000);
INSERT INTO Employees VALUES (2, 'Bob',     20, 75000);
INSERT INTO Employees VALUES (3, 'Charlie', 10, 45000);
INSERT INTO Employees VALUES (4, 'Diana',   30, 90000);
 
 select * from employees;
 
   -- SIMPLE CASE EXPRESSION 
   -- compare a column with fixed value:
 
SELECT 
    Name,
    DepartmentID,
    CASE DepartmentID
        WHEN 10 THEN 'HR'
        WHEN 20 THEN 'Finance'
        WHEN 30 THEN 'Engineering'
        ELSE 'Unknown'
    END AS DepartmentName
FROM Employees;
 
 
     --- Searched CASE Expression 
     -- Checks logical conditions (>, <, =, etc.)

 
SELECT 
    Name,
    Salary,
    CASE 
        WHEN Salary < 50000 THEN 'Low'
        WHEN Salary BETWEEN 50000 AND 80000 THEN 'Medium'
        WHEN Salary > 80000 THEN 'High'
        ELSE 'Not Specified'
    END AS SalaryCategory
FROM Employees;
 
 
      --CASE in ORDER BY :
SELECT 
    Name,
    Salary,
    CASE 
        WHEN Salary > 80000 THEN 'High'
        WHEN Salary BETWEEN 50000 AND 80000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM Employees
ORDER BY salarycategory asc;

 
 
      

 
 
  --CASE with Aggregate Functions :

  SELECT
    COUNT(CASE WHEN DepartmentID = 10 THEN 1 END) AS HR_Count,
    COUNT(CASE WHEN DepartmentID = 20 THEN 1 END) AS Finance_Count,
    COUNT(CASE WHEN DepartmentID = 30 THEN 1 END) AS Engineering_Count
FROM Employees;




CREATE TABLE users (
    id INT,
    name VARCHAR(50),
    status VARCHAR(20)
);

INSERT INTO users (id, name, status) VALUES
(1, 'Alice', 'active'),
(2, 'Bob', 'inactive'),
(3, 'Charlie', 'active'),
(4, 'David', 'active'),
(5, 'Eva', 'inactive');

SELECT
    COUNT(CASE WHEN status = 'active' THEN 1 END) AS active_count,
    COUNT(CASE WHEN status = 'inactive' THEN 1 END) AS inactive_count
FROM users;


CREATE TABLE employees (
    id INT,
    name VARCHAR(50),
    gender CHAR(1),
    salary INT
);

INSERT INTO employees (id, name, gender, salary) VALUES
(1, 'John', 'M', 5000),
(2, 'Mary', 'F', 6200),
(3, 'Alex', 'M', 7200),
(4, 'Sara', 'F', 5800),
(5, 'Mike', 'M', 4500);

SELECT
    MAX(CASE WHEN gender = 'M' THEN salary END) AS max_male_salary,
    MAX(CASE WHEN gender = 'F' THEN salary END) AS max_female_salary
FROM employees;


CREATE TABLE sales (
    id INT,
    date DATE,
    amount INT
);

INSERT INTO sales (id, date, amount) VALUES
(1, '2025-01-05', 100),
(2, '2025-01-20', 250),
(3, '2025-02-10', 300),
(4, '2025-02-28', 150),
(5, '2025-03-03', 500),
(6, '2025-03-15', 200);

SELECT
    SUM(CASE WHEN MONTH(date) = 1 THEN amount ELSE 0 END) AS jan,
    SUM(CASE WHEN MONTH(date) = 2 THEN amount ELSE 0 END) AS feb,
    SUM(CASE WHEN MONTH(date) = 3 THEN amount ELSE 0 END) AS mar
FROM sales;

