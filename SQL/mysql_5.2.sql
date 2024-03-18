-- 1.	Write a SQL query to retrieve the names of all customers who have placed orders for products in the "Electronics" category, along 
--     with the total amount they have spent on all orders. The output should be sorted by the total amount spent in descending order.





SELECT c.customer_name,
       SUM(od.unit_price * od.quantity) AS total_amount_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN OrderDetails od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
WHERE p.category = 'Electronics'
GROUP BY c.customer_name
ORDER BY total_amount_spent DESC;



-- 2.	Write a SQL query to retrieve the names of all employees who have sold at least one product in the "Clothing" category, along with
--     the total revenue they have generated from those sales. The output should be sorted by total revenue generated in descending order.

SELECT e.employee_name,
       SUM(od.unit_price * od.quantity) AS total_revenue_generated
FROM Employees e
JOIN Orders o ON e.employee_id = o.employee_id
JOIN OrderDetails od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
WHERE p.category = 'Clothing'
GROUP BY e.employee_name
ORDER BY total_revenue_generated DESC;

-- 3.	Write a SQL query to retrieve the names of all customers who have placed orders for products in both the "Electronics" and "Clothing" 
--     categories. The output should only include customers who have ordered products in both categories.

SELECT c.customer_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN OrderDetails od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
WHERE p.category IN ('Electronics', 'Clothing')
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(DISTINCT p.category) = 2;

-- 4.	Write a SQL query to retrieve the names of all employees who have sold at least one product to a customer who has a shipping 
--     address in the same city as the employee. The output should only include employees who have made at least one such sale.

SELECT DISTINCT e.employee_name
FROM employees e
JOIN orders o ON e.employee_id = o.employee_id
JOIN orderdetails od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
JOIN customers c ON o.customer_id = c.customer_id
WHERE c.shipping_city = e.city;

-- 5.	Write a SQL query to retrieve the names of all customers who have placed orders for products in the "Electronics" category, 
--     but have never placed an order for products in the "Clothing" category.

SELECT DISTINCT c.customer_name AS customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN orderdetails od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE p.category = 'Electronics'
AND c.customer_id NOT IN (
    SELECT c2.customer_id
    FROM customers c2
    JOIN orders o2 ON c2.customer_id = o2.customer_id
    JOIN orderdetails od2 ON o2.order_id = od2.order_id
    JOIN products p2 ON od2.product_id = p2.product_id
    WHERE p2.category = 'Clothing'
);

-- 6.	Write a SQL query to retrieve the names of all employees who have sold at least one product to customers who have placed orders for 
--     products in the "Electronics" category, but have never placed an order for products in the "Clothing" category. The output should 
--     only include employees who have made at least one such sale.

SELECT DISTINCT e.employee_name AS employee_name
FROM employees e
JOIN orders o ON e.employee_id = o.employee_id
JOIN orderdetails od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
JOIN customers c ON o.customer_id = c.customer_id
WHERE p.category = 'Electronics'
AND c.customer_id NOT IN (
    SELECT c2.customer_id
    FROM customers c2
    JOIN orders o2 ON c2.customer_id = o2.customer_id
    JOIN orderdetails od2 ON o2.order_id = od2.order_id
    JOIN products p2 ON od2.product_id = p2.product_id
    WHERE p2.category = 'Clothing'
);

-- 7.	Write a SQL query to retrieve the names of all customers who have placed orders for more than five different products in the
--      "Electronics" category.

SELECT c.customer_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN OrderDetails od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
WHERE p.category = 'Electronics'
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(DISTINCT od.product_id) > 5;

-- 8.	Write a SQL query to retrieve the names of all employees who have sold products to customers who have placed orders for more than
--     five different products in the "Electronics" category. The output should only include employees who have made at least one such sale

SELECT e.employee_name
FROM Employees e
JOIN Orders o ON e.employee_id = o.employee_id
JOIN OrderDetails od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
JOIN (
    SELECT c.customer_id
    FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    JOIN OrderDetails od ON o.order_id = od.order_id
    JOIN Products p ON od.product_id = p.product_id
    WHERE p.category = 'Electronics'
    GROUP BY c.customer_id
    HAVING COUNT(DISTINCT od.product_id) > 5
) AS electronics_customers ON o.customer_id = electronics_customers.customer_id
GROUP BY e.employee_id, e.employee_name
HAVING COUNT(DISTINCT o.order_id) >= 1;
