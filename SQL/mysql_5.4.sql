

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

SELECT DISTINCT c.name
FROM customers c
JOIN (
    SELECT o.customer_id,
           SUM(o.quantity) AS TotalOrdered,
           COALESCE(SUM(r.quantity), 0) AS TotalReturned
    FROM orders o
    LEFT JOIN returns r ON o.order_id = r.order_id
    GROUP BY o.customer_id
) AS OrderReturnSummary ON c.customer_id = OrderReturnSummary.customer_id
WHERE OrderReturnSummary.TotalReturned <= OrderReturnSummary.TotalOrdered;

Que -6 

SELECT c.name
FROM customers c
JOIN (
    SELECT o.customer_id, SUM(p.price * o.quantity) AS total_spent
    FROM orders o
    JOIN products p ON o.product_id = p.product_id
    GROUP BY o.customer_id
    HAVING SUM(p.price * o.quantity) < 100
) AS OrderSummary ON c.customer_id = OrderSummary.customer_id;

Que -7 

SELECT c.name, SUM(p.price * o.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.customer_id, c.name
HAVING SUM(p.price * o.quantity) > 100
ORDER BY total_spent DESC;


Que - 8 

SELECT DISTINCT c.CustomerName
FROM Customers c
JOIN (
    SELECT o.CustomerID
    FROM Orders o
    JOIN Products p ON o.ProductID = p.ProductID
    GROUP BY o.CustomerID
    HAVING COUNT(DISTINCT p.CategoryID) = (SELECT COUNT(*) FROM Categories)
) AS OrdersWithAllCategories ON c.CustomerID = OrdersWithAllCategories.CustomerID;

Que - 9

SELECT DISTINCT c.CustomerName
FROM Customers c
JOIN (
    SELECT o.CustomerID
    FROM Orders o
    JOIN Products p ON o.ProductID = p.ProductID
    GROUP BY o.CustomerID
    HAVING COUNT(DISTINCT p.CategoryID) < (SELECT COUNT(*) FROM Categories)
) AS OrdersWithoutAllCategories ON c.CustomerID = OrdersWithoutAllCategories.CustomerID;

Que - 10 

SELECT DISTINCT c.CustomerName
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
INNER JOIN Products p ON p.ProductID = o.ProductID
GROUP BY c.CustomerID 
HAVING COUNT(DISTINCT p.CategoryID) >= 2;


