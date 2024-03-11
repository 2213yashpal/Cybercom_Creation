
CREATE TABLE Cars (CarId int PRIMARY KEY,Brand varchar(50),Model varchar(50),Year int,Mileage int,Price decimal(10,2),Available bit); 
CREATE TABLE Customers (CustomerID int PRIMARY KEY,FirstName varchar(50),LastName varchar(50),Email varchar(100),PhoneNumber varchar(20));
CREATE TABLE Sales (SaleID int  PRIMARY KEY,CarID int,CustomerID int,SaleDate date,SalePrice decimal(10,2), FOREIGN KEY(CarID) REFERENCES cars(CarId),FOREIGN KEY(CustomerID) REFERENCES customers(CustomerID)) ;

-- 1.	Retrieve the top 10 most expensive cars from the Cars table.

SELECT * FROM cars ORDER BY Price DESC LIMIT 10;

-- 2.	Retrieve the average price of all available cars from the Cars table

SELECT AVG(Price) as avg_price_of_car FROM cars;

-- 3.	Retrieve the list of customers who have purchased a car, along with the total number of cars each customer has purchased.

SELECT 
    c.CustomerID, 
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, 
    COUNT(s.SaleID) AS TotalPurchases
FROM 
    Customers c
JOIN 
    Sales s ON c.CustomerID = s.CustomerID
GROUP BY 
    c.CustomerID, c.FirstName, c.LastName

    -- 4.	Retrieve the list of customers who have not yet made a purchase

    SELECT 
    c.CustomerID, 
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName
FROM 
    Customers c
LEFT JOIN 
    Sales s ON c.CustomerID = s.CustomerID
WHERE 
    s.CustomerID IS NULL;

-- 5.	Insert a new car into the Cars table with the following information: Brand='Toyota', Model='Corolla', Year=2022, Mileage=0, Price=20000, Available=1.

INSERT INTO cars(Brand,Model,Year,Mileage,Price,Available) VALUES('Toyota','Corolla',2022,0,20000,true);

-- 6.	Update the price of all cars in the Cars table by adding 10% to their current price

UPDATE Cars SET Price = Price * 1.1;

-- 7.	Delete all sales from the Sales table that occurred before march 8, 2022.

    DELETE FROM Sales WHERE SaleDate < '2024-03-08';

CASE -2 

CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Title VARCHAR(100),
    Department VARCHAR(100),
    HireDate DATE,
    Salary DECIMAL(10, 2)
);
INSERT INTO Employees (EmployeeID, FirstName, LastName, Title, Department, HireDate, Salary)
VALUES 
    ('John', 'Doe', 'Manager', 'Sales', '2005-06-15', 60000.00),
    ( 'Jane', 'Smith', 'Sales Associate', 'Sales', '2008-03-20', 50000.00),
    ( 'Michael', 'Johnson', 'Manager', 'Marketing', '2010-09-10', 65000.00),
    ( 'Emily', 'Williams', 'Marketing Associate', 'Marketing', '2012-05-01', 55000.00),
    ('David', 'Brown', 'Manager', 'Finance', '2007-11-30', 70000.00),
    ('Jessica', 'Jones', 'Financial Analyst', 'Finance', '2015-02-18', 60000.00),
    ('William', 'Taylor', 'Manager', 'HR', '2009-08-25', 62000.00),
    ('Olivia', 'Miller', 'HR Specialist', 'HR', '2018-04-05', 52000.00),
    ('Daniel', 'Anderson', 'Manager', 'IT', '2011-07-12', 68000.00),
    ('Sophia', 'Wilson', 'Software Engineer', 'IT', '2014-10-22', 65000.00);

-- 1.	Write a query that returns the first and last name of all employees who have a title that contains the word "Manager".
    
    SELECT FirstName,LastName FROM Employees WHERE Title LIKE '%Manager%';

-- 2.	Write a query that returns the department name and the average salary of all employees in each department.

    SELECT Department,AVG(Salary) as average_salary FROM employees GROUP BY Department;

-- 3.	Write a query that returns the number of employees who were hired in each year, sorted by year.

SELECT year(HireDate) as hireyear,COUNT(*) AS num_of_employee FROM employees GROUP BY year(HireDate) ORDER BY year(HireDate);

-- 4.	Write a query that returns the first name, last name, and salary of the top 10 highest-paid employees.

SELECT FirstName,LastName,Salary FROM employees ORDER BY Salary DESC LIMIT 10;

-- 5.	Write a query that updates the salary of all employees in the "Sales" department to be 10% higher than their current salary.

UPDATE Employees SET Salary = Salary * 1.1 WHERE Department = 'Sales';

-- 6.	Write a query that deletes all employees who were hired before the year 2000

DELETE FROM Employees WHERE YEAR(HireDate) < 2000;

-- 7.	Write a query that creates a new table called "employee_stats" that contains the following columns: "department_name", "total_employees", and "average_salary". The table should include one row for each department.

CREATE TABLE employee_stats (
    department_name VARCHAR(100),
    total_employees INT,
    average_salary DECIMAL(10, 2)
);

INSERT INTO employee_stats (department_name, total_employees, average_salary)
SELECT Department, COUNT(*), AVG(Salary)
FROM Employees
GROUP BY Department;

-- 8.	Write a query that returns the first and last name of all employees who have the same last name as their manager.

SELECT e.FirstName, e.LastName FROM Employees e JOIN Employees m ON e.LastName = m.LastName AND e.EmployeeID != m.EmployeeID;

-- 9.	Write a query that returns the top 5 departments with the highest average salary.

SELECT Department,AVG(Salary) AS average_salary FROM employees GROUP BY Department ORDER BY average_salary DESC LIMIT 5;

-- 10.	Write a query that returns the first and last name of all employees who have at least one dependent. Sort the results by last name

