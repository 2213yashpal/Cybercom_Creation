-- CASE 1 : Write a query to retrieve the title and body of the five most recent blog posts, along with the number of comments each post has.

CASE - 2 

SELECT u.name,
       COUNT(p.id) AS num_posts,
       SUM(CASE WHEN l.id IS NOT NULL THEN 1 ELSE 0 END) AS num_likes
FROM users u
LEFT JOIN posts p ON u.id = p.user_id
LEFT JOIN likes l ON p.id = l.post_id
WHERE EXTRACT(YEAR FROM u.created_at) = 2022
GROUP BY u.id, u.name;

CASE - 3 

CREATE TABLE employees (
    id int AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(100),
    salary DECIMAL(10, 2)
);

-- Insert sample data into the employees table
INSERT INTO employees (name, department, salary) VALUES
('John Doe', 'sales', 60000.00),
('Jane Smith', 'sales', 55000.00),
('Mike Johnson', 'marketing', 48000.00),
('Emily Brown', 'sales', 52000.00),
('Chris Lee', 'engineering', 70000.00);

SELECT name, salary
FROM employees
WHERE department = 'sales' AND salary > 50000;

CASE -3 

CREATE TABLE orders (
    id int PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

-- Insert sample data into the orders table
INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2024-01-01', 100.00),
(2, '2024-01-02', 150.00),
(1, '2024-01-03', 200.00),
(3, '2024-01-04', 120.00),
(2, '2024-01-05', 180.00),
(1, '2024-01-06', 250.00);

SELECT customer_id, SUM(total_amount) AS total_order_amount
FROM orders
GROUP BY customer_id
ORDER BY total_order_amount DESC;