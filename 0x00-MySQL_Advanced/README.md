# MySQL Advanced

### Creating Tables with Constraints
In MySQL, constraints are used to limit the type of data that can go into a table. These ensure the accuracy and reliability of the data within the database. Constraints can be applied at the column level or the table level.

- **Primary Key Constraint:** Ensures that each row in a table is uniquely identifiable.
```
CREATE TABLE employees (
    id INT AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    PRIMARY KEY (id)
);
```

- **Foreign Key Constraint:** Ensures referential integrity between tables.
```
CREATE TABLE departments (
    dept_id INT AUTO_INCREMENT,
    dept_name VARCHAR(50),
    PRIMARY KEY (dept_id)
);

CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dept_id INT,
    PRIMARY KEY (emp_id),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
```

- **Unique Constraint:** Ensures that all values in a column are unique.
```
CREATE TABLE users (
    user_id INT AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE,
    email VARCHAR(100) UNIQUE,
    PRIMARY KEY (user_id)
);
```

- **Check Constraint:** Ensures that the value in a column meets a specific condition.
```
CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    salary DECIMAL(10, 2),
    PRIMARY KEY (emp_id),
    CHECK (age >= 18 AND age <= 65),
    CHECK (salary > 0)
);
```

### Optimizing Queries by Adding Indexes
Indexes improve the speed of data retrieval operations on a database table at the cost of additional writes and storage space.

- **Creating an Index:**

```
CREATE INDEX idx_last_name ON employees(last_name);
```

- **Unique Index:**
```
CREATE UNIQUE INDEX idx_username ON users(username);
```

- **Composite Index:**
```
CREATE INDEX idx_name_dept ON employees(first_name, dept_id);
```

### Stored Procedures and Functions
Stored procedures and functions are a set of SQL statements that can be stored in the database and executed later.

- **Stored Procedure:**
A stored procedure can perform operations such as inserting, updating, or deleting records.
```
DELIMITER //

CREATE PROCEDURE AddEmployee(IN fname VARCHAR(50), IN lname VARCHAR(50), IN dept INT)
BEGIN
    INSERT INTO employees (first_name, last_name, dept_id) VALUES (fname, lname, dept);
END //

DELIMITER ;
```

- **Calling the Stored Procedure:**
```
CALL AddEmployee('John', 'Doe', 1);
```

- **Function:** A function returns a single value and can be used in SQL statements.
```
DELIMITER //

CREATE FUNCTION GetEmployeeCount() RETURNS INT
BEGIN
    DECLARE emp_count INT;
    SELECT COUNT(*) INTO emp_count FROM employees;
    RETURN emp_count;
END //

DELIMITER ;
```

- **Using the Function:**
```
SELECT GetEmployeeCount();
```

### Views in MySQL
A view is a virtual table based on the result set of a SQL query. It does not store data itself but displays data stored in other tables.

- **Creating a View:**
```
CREATE VIEW employee_details AS
SELECT e.emp_id, e.first_name, e.last_name, d.dept_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;
```

- **Using the View:**
```
SELECT * FROM employee_details;
```

### Triggers in MySQL
Triggers are database objects that are automatically executed or fired when certain events occur.

- **Creating a Trigger:**
```
CREATE TRIGGER before_employee_insert
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    SET NEW.created_at = NOW();
END;
```

- **Trigger Types:**
- BEFORE INSERT: Trigger fires before a new row is inserted into the table.
- AFTER INSERT: Trigger fires after a new row is inserted into the table.
- BEFORE UPDATE: Trigger fires before a row is updated.
- AFTER UPDATE: Trigger fires after a row is updated.
- BEFORE DELETE: Trigger fires before a row is deleted.
- AFTER DELETE: Trigger fires after a row is deleted.

Summary
- Constraints: Primary Key, Foreign Key, Unique, Check.
- Indexes: Basic, Unique, Composite.
- Stored Procedures: Set of SQL statements for performing operations.
- Functions: Return a single value, used in SQL statements.
- Views: Virtual tables representing the result set of a query.
- Triggers: Automated actions executed upon certain table events.

These concepts and techniques are essential for managing and optimizing databases effectively in MySQL.