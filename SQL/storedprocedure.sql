DELIMITER //
CREATE PROCEDURE CreateAndInsertData()
BEGIN
    
    CREATE TABLE IF NOT EXISTS ExampleTable (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(50),
        age INT
    );

    INSERT INTO ExampleTable (name, age) VALUES ('John', 30);
    INSERT INTO ExampleTable (name, age) VALUES ('Alice', 25);
    INSERT INTO ExampleTable (name, age) VALUES ('Bob', 35);
    SELECT * FROM ExampleTable;

END //
DELIMITER ;
CALL CreateAndInsertData();


DELIMITER //
CREATE PROCEDURE ExampleProcedure()
BEGIN
    
    DECLARE var_int INT;
    DECLARE var_float FLOAT;
    DECLARE var_string VARCHAR(255);
    DECLARE var_date DATE;

    SET var_int = 10;
    SET var_float = 3.14;
    SET var_string = 'Hello, World!';
    SET var_date = '2024-03-12';

    SELECT var_int * var_float AS result;
    SELECT CONCAT(var_string, ' Today is ', var_date) AS message;

    IF var_int > 5 THEN
        SELECT 'Variable is greater than 5';
    ELSE
        SELECT 'Variable is less than or equal to 5';
    END IF;
END //

DELIMITER ;

--------------------------------------------------------------------------------------------------------------------------------

DELIMITER //

CREATE PROCEDURE GetCustomerOrders()
BEGIN
    SELECT 
        c.customer_name,
        SUM(o.quantity * o.price_per_item) AS total_amount_spent,
        AVG(o.quantity * o.price_per_item) AS average_amount_per_order
    FROM 
        customers c
    INNER JOIN 
        orders o ON c.customer_id = o.customer_id
    GROUP BY 
        c.customer_name;
END //

DELIMITER ;

CALL GetCustomerOrders();

--------------------------------------------------------------------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE CountItems()
BEGIN
DECLARE count  int default 0;
SELECT count(*) INTO count from ExampleTable;
SELECT count;
END//
DELIMITER ;
CALL  CountItems();


-- in parameter

DELIMITER //
CREATE PROCEDURE SELECTByName(IN l_name varchar(255))
BEGIN
SELECT * from ExampleTable WHERE name=l_name;
END//
DELIMITER ;
CALL  SELECTByName('john');

-- out parameter

DELIMITER //

CREATE PROCEDURE SELECTByNamesses(IN l_name VARCHAR(255), OUT count_l INT)
BEGIN
SELECT COUNT(*) INTO count_l FROM ExampleTable WHERE name = l_name;
END//
DELIMITER ;
CALL SELECTByNamesses('john', @count_last);
SELECT @count_last;


DROP PROCEDURE IF EXISTS SELECTByNamesses;


DELIMITER //

CREATE PROCEDURE increases_salary(
    IN emp_id INT,
    OUT new_salary DECIMAL(10, 2)
)
BEGIN
    DECLARE current_salary DECIMAL(10, 2);
    DECLARE salary_increase DECIMAL(10, 2);
    
    SELECT salary INTO current_salary FROM employees WHERE employee_id = emp_id;
    
    SET salary_increase = current_salary * 0.1;
    
    SET new_salary = current_salary + salary_increase;
    
    UPDATE employees SET salary = new_salary WHERE employee_id = emp_id;
    
END //

DELIMITER ;

CALL increases_salary(2, @new_salary);
SELECT @new_salary;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELIMITER //

CREATE PROCEDURE GetCustomersWithExpensiveOrders()
BEGIN
    SELECT 
        c.customer_name,
        SUM(o.quantity * p.price) AS total_amount_spent
    FROM 
        customers c
    INNER JOIN 
        orders o ON c.customer_id = o.customer_id
    INNER JOIN 
        products p ON o.product_id = p.product_id
    WHERE 
        p.price > 100
    GROUP BY 
        c.customer_name;
END //

DELIMITER ;

CALL GetCustomersWithExpensiveOr();

-------------------------------------------------------------------------------------------


CREATE PROCEDURE ManageEmployee(
    IN emp_id INT,
    IN emp_name VARCHAR(255),
    IN emp_age INT,
    IN emp_salary DECIMAL(10, 2),
    IN operation VARCHAR(10)
)
BEGIN
    IF operation = 'CREATE' THEN
        INSERT INTO employees (name, age, salary) VALUES (emp_name, emp_age, emp_salary);
    ELSEIF operation = 'READ' THEN
        SELECT * FROM employees WHERE id = emp_id;
    ELSEIF operation = 'UPDATE' THEN
        UPDATE employees SET name = emp_name, age = emp_age, salary = emp_salary WHERE id = emp_id;
    ELSEIF operation = 'DELETE' THEN
        DELETE FROM employees WHERE id = emp_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid operation specified';
    END IF;
END//

DELIMITER ;

CALL ManageEmployee(NULL, 'John Doe', 30, 50000.00, 'CREATE');
CALL ManageEmployee(1, NULL, NULL, NULL, 'READ');
CALL ManageEmployee(1, 'Jane Doe', 35, 55000.00, 'UPDATE');
CALL ManageEmployee(1, NULL, NULL, NULL, 'DELETE');








