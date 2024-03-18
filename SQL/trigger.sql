-- Triggere

-- Create the users table
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    per_hour_salary DECIMAL(10, 2),
    working_hours INT,
    total_salary DECIMAL(10, 2)
);

DELIMITER //

CREATE TRIGGER calculate_total_salary
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
    DECLARE total DECIMAL(10, 2);
    
    SET total = NEW.per_hour_salary * NEW.working_hours;
    
    SET NEW.total_salary = total;
END;
//

DELIMITER ;

INSERT INTO users (name, per_hour_salary, working_hours) VALUES ('John Doe', 20.00, 40);

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE order_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    customer_id INT,
    product_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    action VARCHAR(50)
);

DELIMITER //
CREATE TRIGGER after_order_insert
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    INSERT INTO order_logs (order_id, customer_id, product_id, action)
    VALUES (NEW.order_id, NEW.customer_id, NEW.product_id, 'Order Inserted');
END //
DELIMITER ;


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER //

CREATE TRIGGER before_order_delete
BEFORE DELETE ON orders
FOR EACH ROW
BEGIN
    DECLARE order_date TIMESTAMP;
    
    SELECT order_date INTO order_date
    FROM orders
    WHERE order_id = OLD.order_id;

    IF TIMESTAMPDIFF(DAY, order_date, NOW()) > 30 THEN
        SIGNAL SQLSTATE '45001'
        SET MESSAGE_TEXT = 'Cannot delete orders placed more than 30 days ago';
    END IF;
END //
DELIMITER ; 


----------------------------------------------
CREATE TABLE order_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    customer_id INT,
    product_id INT,
    deleted_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER record_deleted_orders
BEFORE DELETE ON orders
FOR EACH ROW
BEGIN
    INSERT INTO order_logs (order_id, customer_id, product_id, deleted_date)
    VALUES (OLD.order_id, OLD.customer_id, OLD.product_id, NOW());
END //

DELIMITER ;