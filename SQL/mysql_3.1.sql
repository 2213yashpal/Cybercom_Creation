-- CASE - 1 Create a table called "customers" with the following columns: id (integer, primary key), name (text), email (text), and created_at (timestamp).

-- Que - 1. Write a query that selects all customers whose email address ends with "@gmail.com".

SELECT * FROM customers where email LIKE '%@gmail.com';

-- Que - 2.	Write a query that selects the customer with the earliest created_at date

SELECT * FROM customers ORDER BY created_at ;

-- Que -3. Write a query that selects the name and email of customers who were created on or after January 3, 2022.

SELECT name, email FROM customers WHERE created_at >= '2022-01-03';

-- Que -4.	Write a query that updates the email address of the customer with id=5 to "davidkim@gmail.com".

UPDATE customers SET email="davidkim@gmail.com" WHERE id=5;

-- Que -5. Write a query that deletes the customer with id=2

DELETE FROM customers WHERE id=2;

-- Que - 6. Write a query that calculates the total number of customers in the "customers" table.

SELECT COUNT(*) AS total_customers FROM customers;

-- CASE - 2  Write a query to retrieve the name and price of all items in the inventory where the quantity is greater 
-- than 0 and the category is 'electronics', sorted in descending order by price.

INSERT INTO inventory (id, name, quantity, price, category)
VALUES
    (1, 'Product A', 100, 10.99, 'Electronics'),
    (2, 'Product B', 50, 25.50, 'Clothing'),
    (3, 'Product C', 200, 5.75, 'Office Supplies'),
    (4, 'Product D', 75, 15.99, 'Electronics'),
    (5, 'Product E', 30, 49.99, 'Home Appliances');

SELECT name,price from inventory where quantity>0 AND category='electronics' ORDER BY price DESC;

-- CASE - 3  Write a query to retrieve the total sales for each month in the year 2021, sorted in ascending order by month

INSERT INTO sales (id, date, customer_id, product_id, quantity, total_price)
VALUES
    (1, '2021-01-15', 1, 1, 2, 21.98),
    (2, '2021-02-20', 2, 3, 1, 5.75),
    (3, '2021-03-10', 3, 2, 3, 76.50),
    (4, '2021-04-05', 1, 4, 1, 15.99),
    (5, '2021-05-12', 2, 5, 2, 99.98),
    (6, '2021-06-30', 3, 1, 2, 35.98),
    (7, '2021-07-21', 1, 3, 1, 9.99),
    (8, '2021-08-17', 2, 2, 3, 76.50)
    
SELECT EXTRACT(MONTH FROM date) AS month, SUM(total_price) AS total_sales FROM sales WHERE EXTRACT(YEAR FROM date) = 2021 GROUP BY EXTRACT(MONTH FROM date) ORDER BY month ASC;
