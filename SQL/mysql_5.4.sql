

-- 1.	Write a SQL query to retrieve the names of all customers who have made at least one order in the "orders" table and have not made any orders in the "returns" table.

SELECT DISTINCT c.name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN returns r ON o.order_id = r.order_id
WHERE r.order_id IS NULL;


-- 2.	Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table and have returned at least one item in the "returns" table.


SELECT DISTINCT c.customer_name AS customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN returns r ON o.order_id = r.order_id;

-- 3.	Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table and have not returned any items in the "returns" table.

SELECT DISTINCT c.name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN returns r ON o.order_id = r.order_id
WHERE r.order_id IS NULL;

-- 4.	Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table and have returned more items than they have ordered.

SELECT c.name
FROM customers c
JOIN (
    SELECT o.customer_id,
           COUNT(o.order_id) AS orders_count,
           COUNT(r.return_id) AS returns_count
    FROM orders o
    LEFT JOIN returns r ON o.order_id = r.order_id
    GROUP BY o.customer_id
) AS counts ON c.customer_id = counts.customer_id
WHERE counts.returns_count > counts.orders_count;

-- 5.	Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table and have not returned more items than they have ordered.



