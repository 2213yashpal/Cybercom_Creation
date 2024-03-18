-- 1.	Write a query to return the names of all employees who work in the 'Sales' department.

SELECT e.name AS name_employee 
    FROM employees e 
    JOIN departments d ON e.department_id=d.department_id 
    WHERE department_name='sales';

-- 2.	Write a query to return the total number of employees in each department, ordered by department name

SELECT d.department_name ,
    COUNT(*) AS num_employee 
    FROM departments d JOIN employees e ON e.department_id=d.department_id 
    GROUP by d.department_name ;

    -- 3.	Write a query to return the average salary for each department, ordered by department name.

SELECT d.department_name, 
    AVG(e.salary) AS average_salary
    FROM employees e
    JOIN departments d ON e.department_id = d.department_id
    GROUP BY d.department_name
    ORDER BY d.department_name;

-- 4.	Write a query to return the top 10% of highest paid employees, ordered by salary.

SELECT *
FROM (
    SELECT *, NTILE(10) OVER (ORDER BY salary DESC) AS salary_percentile
    FROM Employees
) AS emp_with_percentile
WHERE salary_percentile = 1;

-- 5.	Write a query to return the salary of each employee for their latest salary entry.

SELECT e.id AS employee_id,
       e.name AS employee_name,
       s.salary AS latest_salary
FROM employees e
JOIN salaries s ON e.id = s.employee_id
WHERE s.date = (
    SELECT MAX(date)
    FROM salaries
    WHERE employee_id = e.id
);