CREATE DATABASE customer_sales_db;
USE customer_sales_db;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    gender VARCHAR(10),
    city VARCHAR(50),
    email VARCHAR(100)
);
INSERT INTO customers VALUES
(1,'Aarav Sharma','Male','Pune','aarav@gmail.com'),
(2,'Priya Patil','Female','Nashik','priya@gmail.com'),
(3,'Rahul Joshi','Male','Mumbai','rahul@gmail.com'),
(4,'Sneha Kulkarni','Female','Pune','sneha@gmail.com'),
(5,'Aditya Deshmukh','Male','Nashik','aditya@gmail.com'),
(6,'Neha Shah','Female','Mumbai','neha@gmail.com'),
(7,'Rohan More','Male','Pune','rohan@gmail.com'),
(8,'Pooja Pawar','Female','Nashik','pooja@gmail.com'),
(9,'Sanket Jadhav','Male','Mumbai','sanket@gmail.com'),
(10,'Kajal Patil','Female','Pune','kajal@gmail.com'),
(11,'Amit Chavan','Male','Nashik','amit@gmail.com'),
(12,'Snehal More','Female','Mumbai','snehal@gmail.com'),
(13,'Vishal Shinde','Male','Pune','vishal@gmail.com'),
(14,'Anjali Thakur','Female','Nashik','anjali@gmail.com'),
(15,'Akshay Pawar','Male','Mumbai','akshay@gmail.com'),
(16,'Nikita Joshi','Female','Pune','nikita@gmail.com'),
(17,'Pranav Patil','Male','Nashik','pranav@gmail.com'),
(18,'Riya Deshmukh','Female','Mumbai','riya@gmail.com'),
(19,'Kunal More','Male','Pune','kunal@gmail.com'),
(20,'Mansi Shah','Female','Nashik','mansi@gmail.com');
SELECT * FROM customers;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    manager_id INT
);
INSERT INTO employees VALUES
(101,'Priyanka','Sales',105),
(102,'Anurag','Sales',105),
(103,'Sambit','Sales',105),
(104,'Pranay','Marketing',106),
(105,'Rajesh','Sales',NULL),
(106,'Preety','Marketing',NULL),
(107,'Hina','Sales',105),
(108,'Riya','Marketing',106),
(109,'Amit','Sales',105),
(110,'Sneha','Marketing',106);
select * FROM employees;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);
INSERT INTO products VALUES
(201,'Laptop','Electronics',55000),
(202,'Mobile','Electronics',25000),
(203,'Headphones','Electronics',2000),
(204,'Keyboard','Accessories',1500),
(205,'Mouse','Accessories',800),
(206,'Monitor','Electronics',12000),
(207,'Printer','Electronics',15000),
(208,'Webcam','Accessories',3000),
(209,'Tablet','Electronics',22000),
(210,'Speaker','Electronics',5000);
SELECT * FROM products;

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    employee_id INT,
    sale_date DATE,
    quantity INT,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO sales VALUES
(1,1,201,101,'2026-01-05',1,55000),
(2,2,202,102,'2026-01-08',2,50000),
(3,3,203,103,'2026-01-12',3,6000),
(4,4,204,101,'2026-01-15',2,3000),
(5,5,205,107,'2026-01-18',4,3200),
(6,6,206,102,'2026-01-22',1,12000),
(7,7,207,103,'2026-02-02',1,15000),
(8,8,208,101,'2026-02-05',2,6000),
(9,9,209,107,'2026-02-10',1,22000),
(10,10,210,102,'2026-02-15',3,15000),
(11,11,201,103,'2026-02-20',1,55000),
(12,12,202,101,'2026-03-03',1,25000),
(13,13,203,107,'2026-03-07',5,10000),
(14,14,206,102,'2026-03-12',2,24000),
(15,15,207,103,'2026-03-18',1,15000),
(16,16,209,101,'2026-03-22',2,44000),
(17,17,204,107,'2026-04-02',3,4500),
(18,18,205,102,'2026-04-08',5,4000),
(19,19,201,103,'2026-04-15',1,55000),
(20,20,210,101,'2026-04-20',2,10000),
(21,1,202,107,'2026-05-03',1,25000),
(22,3,206,102,'2026-05-08',1,12000),
(23,6,209,103,'2026-05-15',1,22000),
(24,10,201,101,'2026-05-20',2,110000),
(25,15,207,107,'2026-05-25',2,30000);
select * from sales;

SELECT * FROM customers;

SELECT *FROM customers
WHERE gender = 'Female';

SELECT *FROM customers
WHERE city = 'Pune';

SELECT customer_name
FROM customers
ORDER BY customer_name;

SELECT SUM(total_amount) AS total_sales
FROM sales;

SELECT AVG(total_amount) AS average_sale
FROM sales;

SELECT MAX(total_amount) AS highest_sale
FROM sales;

SELECT MIN(total_amount) AS lowest_sale
FROM sales;

SELECT COUNT(*) AS total_transactions
FROM sales;

SELECT city, COUNT(*) AS customer_count
FROM customers
GROUP BY city;

SELECT gender, COUNT(*) AS customer_count
FROM customers
GROUP BY gender;

SELECT employee_id, SUM(total_amount) AS total_sales
FROM sales
GROUP BY employee_id;

SELECT employee_id, SUM(total_amount) AS total_sales
FROM sales
GROUP BY employee_id;

SELECT
    c.customer_name,
    p.product_name,
    p.category,
    s.quantity,
    s.total_amount
FROM sales s
JOIN customers c
ON s.customer_id = c.customer_id
JOIN products p
ON s.product_id = p.product_id;

SELECT
    c.customer_name,
    c.city,
    s.sale_date,
    s.quantity,
    s.total_amount
FROM customers c
JOIN sales s
ON c.customer_id = s.customer_id;

SELECT
    e.employee_name AS employee,
    m.employee_name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;

SELECT
    e.employee_name AS employee,
    m.employee_name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;

SELECT
    p.product_name,
    SUM(s.total_amount) AS total_sales
FROM sales s
JOIN products p
ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC;

SELECT
    p.product_name,
    SUM(s.total_amount) AS total_sales
FROM sales s
JOIN products p
ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC;

SELECT
    c.customer_name,
    SUM(s.total_amount) AS total_sales
FROM customers c
JOIN sales s
ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(s.total_amount) > 50000;

SELECT *
FROM sales
WHERE total_amount >
(
    SELECT AVG(total_amount)
    FROM sales
);

UPDATE customers
SET city = 'Mumbai'
WHERE customer_id = 1;

SELECT *
FROM customers
WHERE customer_id = 1;





