
QUE - 1.	Write a SQL query to retrieve the top 10 customers who have made the most orders in the "orders" table, along with the
             total number of orders they have made.

SELECT c.id AS customer_id,
       c.name AS customer_name,
       COUNT(o.id) AS total_orders
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.id
ORDER BY total_orders DESC
LIMIT 10;

Que - 2.	Write a SQL query to retrieve the names of all employees who have sold more than $100,000 worth of products in the
             "order_details" table, sorted by the amount sold in descending order.

SELECT employees.employee_name, SUM(order_details.quantity * order_details.unit_price) AS total_sales
FROM employees
INNER JOIN orders512 ON employees.employee_id = orders512.employee_id
INNER JOIN order_details ON orders512.order_id = order_details.order_id
GROUP BY employees.employee_name
HAVING total_sales > 100000
ORDER BY total_sales DESC;



Que- 3.	Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table, along with the total
         amount they have spent on all orders and the total amount they have spent on orders made in the last 30 days.

SELECT 
    c.customer_name,
    SUM(o.quantity * o.price_per_item) AS total_amount_spent,
    SUM(CASE WHEN o.order_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY) THEN o.quantity * o.price_per_item ELSE 0 END) AS total_amount_spent_last_30_days
FROM 
    customers c
INNER JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_name;

Que -4.	Write a SQL query to retrieve the names and salaries of all employees who have a salary greater than the average salary 
        of all employees in the "employees" table, sorted by salary in descending order.

SELECT employee_name, salary 
FROM employees 
WHERE  salary > (SELECT AVG(salary) FROM employees) 
ORDER BY salary DESC;

Que - 5.	Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table, but have not
             made any orders in the last 90 days.

SELECT c.customer_name
FROM customers c
WHERE c.customer_id IN (
    SELECT o.customer_id
    FROM orders o
    GROUP BY o.customer_id
    HAVING MAX(o.order_date) <= DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY)
);

Que - 6.	Write a SQL query to retrieve the names and salaries of all employees who have a salary greater than the minimum salary
             of their department in the "employees" table, sorted by department ID and then by salary in descending order.


SELECT 
    e.employee_name,
    e.salary
FROM 
    employees e
JOIN 
    (
        SELECT 
            department_id,
            MIN(salary) AS min_salary
        FROM 
            employees
        GROUP BY 
            department_id
    ) AS dept_min_salary ON e.department_id = dept_min_salary.department_id
WHERE 
    e.salary > dept_min_salary.min_salary
ORDER BY 
    e.department_id ASC,
    e.salary DESC;

Que - 7.	Write a SQL query to retrieve the names and salaries of the five highest paid employees in each department of the 
            "employees" table, sorted by department ID and then by salary in descending order.

            SELECT department_id, employee_name, salary
FROM (
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS row_num
    FROM employees
) AS ranked_employees
WHERE row_num <= 5
ORDER BY department_id, salary DESC;

Que - 8.	Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table, but have not 
            made any orders for products in the "products" table with a price greater than $100.

SELECT DISTINCT c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.product_id NOT IN (
    SELECT product_id
    FROM products
    WHERE price > 100.00
);

Que - 9.	Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table, along with the total 
    amount they have spent on all orders and the average amount they have spent per order.

SELECT 
    c.customer_name,
    SUM(o.quantity * o.price_per_item) AS total_amount_spent,
    AVG(o.quantity * o.price_per_item) AS average_amount_per_order
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_name;