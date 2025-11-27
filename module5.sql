
use batch3;
drop table dummyusers;
CREATE TABLE DummyUsers (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Address VARCHAR(255),
    City VARCHAR(50),
    Country VARCHAR(50),
    BirthDate DATE,
    RegistrationDate DATETIME,
    Salary DECIMAL(10,2),
    Bonus DECIMAL(10,2),
    Age INT,
    Score INT
);
INSERT INTO DummyUsers (FirstName, LastName, Email, Address, City, Country, BirthDate, RegistrationDate, Salary, Bonus, Age, Score)
VALUES
('John', '      Doe', 'john.doe@example.com', '123 Main St', 'New York', 'USA', '1990-05-15', '2023-01-10 09:30:00', 50000, 5000, 33, 85),
('Jane', 'Smith      ', 'jane.smith@example.com', '456 Elm St', 'Los Angeles', 'USA', '1985-08-22', '2023-03-15 14:45:00', 65000, 7000, 38, 92),
('Michael', '   Brown', 'michael.brown@example.com', '789 Oak St', 'Chicago', 'USA', '2000-12-05', '2023-05-20 11:20:00', 40000, 3000, 23, 78),
('Emily', 'Davis   ', 'emily.davis@example.com', '321 Pine St', 'Houston', 'USA', '1995-03-30', '2023-07-08 16:10:00', 55000, 4500, 28, 88),
('David', 'Wilson', 'david.wilson@example.com', '654 Maple St', 'Phoenix', 'USA', '1988-11-12', '2023-09-25 08:55:00', 72000, 8000, 35, 95);
select * from dummyusers;
SELECT CONCAT(FirstName, ' , ', LastName) AS FullName FROM DummyUsers;
SELECT lastname,LENGTH(lastName) AS NameLength FROM DummyUsers;
SELECT UPPER(Email) FROM DummyUsers;
SELECT LOWER(City) AS LowerCity FROM DummyUsers;
SELECT address,SUBSTRING(Address, 1, 3) AS ShortAddress FROM DummyUsers;
SELECT email,SUBSTRING(Email, 1, 4) AS EmailStart FROM DummyUsers;
SELECT 
    email,
    SUBSTRING_INDEX(email, '@', 1) AS username
FROM dummyusers;

SELECT 
    email,
    SUBSTRING_INDEX(email, '@', -1) AS username
FROM dummyusers;
SELECT city,LEFT(City, 3) AS CityShort FROM DummyUsers;
SELECT address, RIGHT(Address, 5) AS AddressEnd FROM DummyUsers;

-- TRIM / LTRIM / RTRIM
-- Purpose: Remove unwanted spaces or characters.
SELECT lastname,TRIM(lastname) AS Cleaned from DummyUsers;

SELECT LTRIM(lastname) AS LeftClean from DummyUsers;

SELECT TRIM(BOTH 'x' FROM 'xxhelloxx') AS result;

SELECT TRIM(LEADING '0' FROM '00012345') AS result;

SELECT TRIM(TRAILING '!' FROM 'Hello World!!!') AS result;

SELECT REPLACE('Hello World', 'World', 'SQL') AS NewString;


Date functions:


SELECT CURDATE();  -- only current date
SELECT NOW(); -- Current date & time
SELECT DATE(NOW());-- extract date 

SELECT birthdate,YEAR(BirthDate) AS BirthYear FROM DummyUsers;
SELECT day(BirthDate) AS BirthYear FROM DummyUsers;
SELECT birthdate,month(BirthDate) AS BirthYear FROM DummyUsers;
SELECT birthdate,dayname(BirthDate) AS BirthYear FROM DummyUsers;
SELECT birthdate,monthname(BirthDate) AS BirthYear FROM DummyUsers;
SELECT MONTH(RegistrationDate) AS RegistrationMonth FROM DummyUsers;
SELECT birthdate, DATEDIFF(NOW(), BirthDate) AS DaysLived FROM DummyUsers;

SELECT birthdate,DATE_ADD(BirthDate, INTERVAL 1 year) from dummyusers;


SELECT Salary + Bonus AS TotalIncome FROM DummyUsers;
SELECT salary,ROUND(Salary * 0.1, -1) AS Tax FROM DummyUsers; -- Rounds a number to N decimal places

SELECT CEIL(Score / 10) AS GradeLevel FROM DummyUsers; -- Rounds a number up to the nearest integer

SELECT FLOOR(Salary / 1000) AS SalaryInThousands FROM DummyUsers;-- Rounds a number down to the nearest integer

SELECT ABS(Salary - 60000) AS DifferenceFromTarget FROM DummyUsers;-- Returns the absolute (positive) value of a number

-- HANDLING NULL VALUES


INSERT INTO DummyUsers (FirstName, LastName, Email, Address, City, Country, BirthDate, RegistrationDate, Salary, Bonus, Age, Score)
VALUES
('Alice', 'Johnson', NULL, '987 Birch St', 'Seattle', 'USA', '1992-07-19', '2023-02-10 10:15:00', 60000, NULL, 31, 90),
('Bob', NULL, 'bob.smith@example.com', NULL, 'Miami', 'USA', NULL, '2023-04-12 12:00:00', NULL, 2000, NULL, 75),
('Charlie', 'Miller', 'charlie.miller@example.com', '159 Cedar St', NULL, 'USA', '1987-09-05', NULL, 70000, 5000, 38, NULL),
('Diana', NULL, NULL, NULL, 'Denver', 'USA', '1995-11-22', '2023-06-18 15:30:00', 55000, 3000, 28, 85);

-- MySQL because NULL represents “unknown” or missing data, and it behaves differently than regular values.
select * from dummyusers;

SELECT salary,bonus,Salary + Bonus AS TotalIncome
FROM DummyUsers;
-- NULL can break string operations
SELECT firstname,lastname,CONCAT(FirstName, ' ', LastName) AS FullName
FROM DummyUsers;

-- If either Salary or Bonus is NULL, TotalIncome becomes NULL
-- IFNULL()
-- Purpose: Replace NULL with a specified value.
SELECT bonus,IFNULL(Bonus, 0) AS BonusValue FROM DummyUsers;

SELECT IFNULL(Salary,0) + IFNULL(Bonus,0) AS TotalIncome
FROM DummyUsers;
SELECT lastname,IFNULL(LastName,'Unknown') AS lastName1
FROM DummyUsers;


SELECT CONCAT(FirstName, ' ', IFNULL(LastName,' ')) AS FullName
FROM DummyUsers;

SELECT bonus,IFNULL(Bonus, 0) AS BonusValue FROM DummyUsers;
SELECT SUM(IFNULL(Bonus,0)) AS TotalBonusWithZero FROM DummyUsers;


-- Aggregate functions like SUM(), AVG(), COUNT(column) ignore NULL values:
SELECT SUM(Bonus) FROM DummyUsers;  -- Ignores NULLs
SELECT COUNT(Bonus) FROM DummyUsers; -- Counts only non-NULL Bonus

-- ifnull Filter or count rows with NULL values.

SELECT * FROM DummyUsers
WHERE Email IS NULL;

-- Find users with Email present
SELECT * FROM DummyUsers
WHERE Email IS NOT NULL;

update dummyusers
set email='unknown'
where email is null;





-- ANOTHER EXAMPLE



--  return  First non-NULL value in the list


CREATE TABLE UserContacts (
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Phone VARCHAR(20),
    Mobile VARCHAR(20)
);
INSERT INTO UserContacts (FirstName, LastName, Phone, Mobile)
VALUES
('John', 'Doe', '123-456-7890', NULL),
('Jane', 'Smith', NULL, '987-654-3210'),
('Michael', 'Brown', NULL, NULL),
('Emily', 'Davis', '555-111-2222', '555-333-4444'),
('David', 'Wilson', NULL, NULL),
('Alice', 'Johnson', NULL, NULL);
SELECT FirstName, LastName, COALESCE(Phone, Mobile, 'No Contact') AS PrimaryContact
FROM usercontacts;


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    email VARCHAR(255),
    backup_email VARCHAR(255)
);
INSERT INTO customers (customer_id, email, backup_email)
VALUES
(1, 'john@example.com', NULL),
(2, NULL, 'backup@example.com'),
(3, NULL, NULL);
Write a query that returns the first available email from the columns above.
SELECT COALESCE(email, backup_email, 'no-email@domain.com') AS primary_email
FROM customers;







Write a query that returns the product name and description, but replace NULL descriptions with "No description".

CREATE TABLE products (
    id INT,
    name VARCHAR(100),
    description VARCHAR(200)
);

INSERT INTO products (id, name, description) VALUES
(1, 'Laptop', 'High-performance laptop'),
(2, 'Mouse', NULL),
(3, 'Keyboard', 'Mechanical keyboard'),
(4, 'Monitor', NULL),
(5, 'Printer', 'All-in-one printer');

-- ans
SELECT 
    name,
    COALESCE(description, 'No description') AS description
FROM products;

SELECT 
    name,
    ifnull (description, 'No description') AS description
FROM products;


-- q2
CREATE TABLE customers10 (
    id INT,
    city VARCHAR(50)
);

-- Sample data
INSERT INTO customers10 (id, city) VALUES
(1, 'New York'),
(2, NULL),
(3, 'Los Angeles'),
(4, NULL),
(5, 'Chicago');
-- Query to Replace NULL with "Unknown"

SELECT 
    id,
    COALESCE(city, 'Unknown') AS city
FROM customers10;

SELECT 
    id,
    ifnull (city, 'Unknown') AS city
FROM customers10;


CREATE TABLE orders (
    id INT,
    price DECIMAL(10,2),
    quantity INT
);

INSERT INTO orders (id, price, quantity) VALUES
(1, 100.00, 2),
(2, NULL, 5),
(3, 50.50, 3),
(4, NULL, 1);



-- Compute the total price, treating NULL price as 0.
SELECT 
    id,
    COALESCE(price, 0) * quantity AS total_price
FROM orders;


SELECT 
    id,
    IFNULL(price, 0) * quantity AS total_price
FROM orders;


