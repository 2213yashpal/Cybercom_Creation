-- CASE - 2 Create a table called "employees" with the following columns: "id" (integer, primary key), "name" (text), "age" (integer), and "salary" (integer).

-- Que - 1.	Write a SQL query to select all employees from the "employees" table.

CREATE TABLE employees (id int PRIMARY KEY AUTO_INCREMENT,name text,age int,salary int);
INSERT INTO employees (name,age,salary) VALUES('John',35,60000),('Mary',27,50000),('Peter',42,7500),('Olivia',29,5500),('Michael',38,80000)

-- Que - 1.	Write a SQL query to select all employees from the "employees" table.

SELECT * FROM employees ;

-- 2.	Write a SQL query to select the name and salary of all employees with a salary greater than 60000.

SELECT name,salary FROM employees WHERE salary>60000;

-- 3.	Write a SQL query to update Peter's age to 43.

UPDATE employees SET age=43 WHERE name='Peter';

-- 4.	Write a SQL query to delete the employee with the id of 4.

DELETE from employees WHERE id=4;

-- 5.	Write a SQL query to calculate the average salary of all employees

SELECT avg(salary) as average_salary_of_employee FROM employees;

-- 6.	Write a SQL query to select the name and age of the oldest employee

SELECT name,age FROM employees ORDER BY age DESC LIMIT 1;

-- 7.	Write a SQL query to select the name and age of the youngest employee.

SELECT name,age FROM employees ORDER BY age LIMIT 1;

-- 8.	Write a SQL query to select the name of the employee with the highest salary

SELECT name,salary FROM employees ORDER BY salary DESC LIMIT 1;
