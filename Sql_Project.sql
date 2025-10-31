/* ====================================
   RESTAURANT DATABASE PROJECT (FULL)
   11 ROWS PER TABLE + FETCHING QUERIES
   ==================================== */

CREATE DATABASE Restaurant;
USE Restaurant;

/* 1. Customer Details */
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    phone VARCHAR(11) UNIQUE,
    date_visited DATE
);

INSERT INTO Customers VALUES
(101, 'Alice', '7555876841', '2023-01-01'),
(102, 'Bob', '7555876842', '2023-01-02'),
(103, 'Charlie', '7555876843', '2023-01-03'),
(104, 'David', '7555876844', '2023-01-04'),
(105, 'Emma', '7555876845', '2023-01-05'),
(106, 'Frank', '7555876846', '2023-01-06'),
(107, 'Grace', '7555876847', '2023-01-07'),
(108, 'Hannah', '7555876848', '2023-01-08'),
(109, 'Ian', '7555876849', '2023-01-09'),
(110, 'Jack', '7555876850', '2023-01-10'),
(111, 'Kelly', '7555876851', '2023-01-11');

/* 2. Menu Details */
CREATE TABLE Menu (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(50) NOT NULL,
    item_price INT NOT NULL
);

INSERT INTO Menu VALUES
(1, 'Burger', 150),
(2, 'Pizza', 300),
(3, 'Pasta', 250),
(4, 'Sandwich', 120),
(5, 'Fries', 100),
(6, 'Coffee', 80),
(7, 'Tea', 60),
(8, 'Juice', 90),
(9, 'Ice Cream', 110),
(10, 'Salad', 180),
(11, 'Soup', 130);

/* 3. Orders */
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    table_number INT NOT NULL,
    order_time DATETIME,
    total_amount INT CHECK (total_amount >= 0),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders (customer_id, table_number, order_time, total_amount) VALUES
(101, 1, '2023-02-01 12:00:00', 400),
(102, 2, '2023-02-02 13:00:00', 300),
(103, 3, '2023-02-03 14:00:00', 450),
(104, 4, '2023-02-04 15:00:00', 500),
(105, 5, '2023-02-05 12:00:00', 350),
(106, 1, '2023-02-06 13:30:00', 420),
(107, 2, '2023-02-07 14:15:00', 250),
(108, 3, '2023-02-08 15:45:00', 600),
(109, 4, '2023-02-09 16:30:00', 320),
(110, 5, '2023-02-10 17:00:00', 270),
(111, 1, '2023-02-11 12:15:00', 380);

/* 4. Order Items */
CREATE TABLE Order_Items (
    order_id INT,
    item_id INT NOT NULL,
    quantity INT CHECK (quantity >= 1),
    item_price INT CHECK (item_price >= 0),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (item_id) REFERENCES Menu(item_id)
);

INSERT INTO Order_Items VALUES
(1, 1, 2, 150),
(2, 2, 1, 300),
(3, 3, 2, 250),
(4, 4, 3, 120),
(5, 5, 2, 100),
(6, 6, 3, 80),
(7, 7, 2, 60),
(8, 8, 1, 90),
(9, 9, 3, 110),
(10, 10, 2, 180),
(11, 11, 1, 130);

/* 5. Staff */
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(25) NOT NULL,
    role VARCHAR(25) NOT NULL,
    phone VARCHAR(20) UNIQUE,
    hire_date DATE
);

INSERT INTO Staff (staff_id, name, role, phone, hire_date) VALUES
(1, 'John', 'Waiter', '0900000001', '2021-01-01'),
(2, 'Maria', 'Chef', '0900000002', '2021-02-01'),
(3, 'Sam', 'Manager', '0900000003', '2021-03-01'),
(4, 'Rita', 'Waiter', '0900000004', '2021-04-01'),
(5, 'Tom', 'Chef', '0900000005', '2021-05-01'),
(6, 'Lucy', 'Cleaner', '0900000006', '2021-06-01'),
(7, 'Peter', 'Waiter', '0900000007', '2021-07-01'),
(8, 'Sophia', 'Chef', '0900000008', '2021-08-01'),
(9, 'Ryan', 'Manager', '0900000009', '2021-09-01'),
(10, 'Olivia', 'Cashier', '0900000010', '2021-10-01'),
(11, 'Liam', 'Security', '0900000011', '2021-11-01');

/* 6. Payments */
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    customer_id INT,
    amount_paid INT NOT NULL,
    payment_method VARCHAR(20) NOT NULL CHECK (payment_method IN ('Cash', 'Card', 'UPI')),
    payment_time DATETIME,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Payments VALUES
(201, 101, 400, 'Cash', '2023-02-01 12:30:00'),
(202, 102, 300, 'Card', '2023-02-02 13:30:00'),
(203, 103, 450, 'UPI', '2023-02-03 14:30:00'),
(204, 104, 500, 'Card', '2023-02-04 15:30:00'),
(205, 105, 350, 'UPI', '2023-02-05 12:30:00'),
(206, 106, 420, 'Cash', '2023-02-06 13:45:00'),
(207, 107, 250, 'Cash', '2023-02-07 14:45:00'),
(208, 108, 600, 'Card', '2023-02-08 15:50:00'),
(209, 109, 320, 'UPI', '2023-02-09 16:35:00'),
(210, 110, 270, 'Card', '2023-02-10 17:15:00'),
(211, 111, 380, 'Cash', '2023-02-11 12:45:00');

/* 7. Reservations */
CREATE TABLE Reservations (
    reservation_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    reservation_time DATETIME NOT NULL,
    table_number INT NOT NULL,
    number_of_people INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Reservations VALUES
(1, 101, '2023-03-01 19:00:00', 1, 2),
(2, 102, '2023-03-02 19:30:00', 2, 4),
(3, 103, '2023-03-03 20:00:00', 3, 3),
(4, 104, '2023-03-04 18:45:00', 4, 2),
(5, 105, '2023-03-05 19:15:00', 5, 5),
(6, 106, '2023-03-06 20:00:00', 1, 4),
(7, 107, '2023-03-07 18:30:00', 2, 3),
(8, 108, '2023-03-08 19:00:00', 3, 2),
(9, 109, '2023-03-09 20:30:00', 4, 6),
(10, 110, '2023-03-10 21:00:00', 5, 4),
(11, 111, '2023-03-11 19:45:00', 1, 2);

/* FETCHING & ANALYSIS QUERIES */

/* 1. Display all customers */
SELECT * FROM Customers;

/* 2. WHERE - Orders above ₹400 */
SELECT * FROM Orders WHERE total_amount > 400;

/* 3. ORDER BY - Sort menu by price descending */
SELECT * FROM Menu ORDER BY item_price DESC;

/* 4. GROUP BY - Total spending per customer */
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name;

/* 5. HAVING - Customers who spent > ₹400 */
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name
HAVING total_spent > 400;

/* 6. JOIN - Orders with customer names */
SELECT o.order_id, c.name, o.total_amount, o.order_time
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id;

/* 7. INNER JOIN multiple tables - Order details */
SELECT o.order_id, c.name AS customer, m.item_name, oi.quantity, oi.item_price
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Menu m ON oi.item_id = m.item_id;

/* 8. COUNT - Number of customers */
SELECT COUNT(*) AS total_customers FROM Customers;

/* 9. DISTINCT - Payment methods used */
SELECT DISTINCT payment_method FROM Payments;

/* 10. BETWEEN - Payments in February */
SELECT * FROM Payments
WHERE payment_time BETWEEN '2023-02-01' AND '2023-02-28';

/* 11. LIKE - Customers with names starting with 'A' or 'B' */
SELECT * FROM Customers WHERE name LIKE 'A%' OR name LIKE 'B%';

/* 12. SUBQUERY - Customers who paid using Card */
SELECT name FROM Customers
WHERE customer_id IN (SELECT customer_id FROM Payments WHERE payment_method='Card');

/* 13. AGGREGATE FUNCTIONS */
SELECT 
    MAX(total_amount) AS Max_Bill,
    MIN(total_amount) AS Min_Bill,
    AVG(total_amount) AS Avg_Bill
FROM Orders;

/* 14. COUNT + GROUP BY - Payment method frequency */
SELECT payment_method, COUNT(*) AS total_transactions
FROM Payments
GROUP BY payment_method;

/* 15. RESERVATIONS per table */
SELECT table_number, COUNT(*) AS reservations_count
FROM Reservations
GROUP BY table_number;

/* 16. HAVING - Tables with >2 reservations */
SELECT table_number, COUNT(*) AS reservations_count
FROM Reservations
GROUP BY table_number
HAVING reservations_count > 2;

/* 17. ORDER BY - Top paying customers */
SELECT c.name, p.amount_paid
FROM Payments p
JOIN Customers c ON p.customer_id = c.customer_id
ORDER BY p.amount_paid DESC;

/* 18. LIMIT - Top 3 highest payments */
SELECT * FROM Payments ORDER BY amount_paid DESC LIMIT 3;

/* 19. JOIN - Reservations with customer names */
SELECT r.reservation_id, c.name, r.table_number, r.number_of_people
FROM Reservations r
JOIN Customers c ON r.customer_id = c.customer_id;

/* 20. AVG per table - Average order value */
SELECT table_number, AVG(total_amount) AS avg_bill
FROM Orders
GROUP BY table_number;

/* 21. Total revenue (SUM) */
SELECT SUM(total_amount) AS total_revenue FROM Orders;

/* 22. Staff hired before May 2021 */
SELECT * FROM Staff WHERE hire_date < '2021-05-01';

/* 23. GROUP BY role - Staff count per role */
SELECT role, COUNT(*) AS staff_count FROM Staff GROUP BY role;

/* 24. Customers who reserved table and paid via UPI */
SELECT DISTINCT c.name
FROM Customers c
JOIN Reservations r ON c.customer_id = r.customer_id
JOIN Payments p ON c.customer_id = p.customer_id
WHERE p.payment_method = 'UPI';

/* 25. FULL DATA JOIN - All orders with customer and payment info */
SELECT c.name, o.order_id, o.total_amount, p.payment_method, p.amount_paid
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Payments p ON c.customer_id = p.customer_id
ORDER BY o.order_id;

/* WORD PROBLEM */
/* ============================================
   🧮 RESTAURANT DATABASE - SQL WORD PROBLEMS
   (Questions as comments + Solutions as SQL)
   ============================================ */


/* 1️⃣ Find all customers who visited the restaurant before January 5, 2023. */
SELECT * FROM Customers
WHERE date_visited < '2023-01-05';


/* 2️⃣ List the names of customers who ordered food worth more than ₹400. */
SELECT c.name, o.total_amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.total_amount > 400;


/* 3️⃣ Display the top 3 most expensive menu items. */
SELECT item_name, item_price
FROM Menu
ORDER BY item_price DESC
LIMIT 3;


/* 4️⃣ Find the total amount each customer has spent in the restaurant. */
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name;


/* 5️⃣ Show only those customers who have spent more than ₹400 in total. */
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name
HAVING total_spent > 400;


/* 6️⃣ List all customers who made payments using UPI. */
SELECT c.name, p.payment_method
FROM Customers c
JOIN Payments p ON c.customer_id = p.customer_id
WHERE p.payment_method = 'UPI';


/* 7️⃣ Show all orders placed between 12 PM and 3 PM. */
SELECT * FROM Orders
WHERE HOUR(order_time) BETWEEN 12 AND 15;


/* 8️⃣ Find how many customers made reservations per table. */
SELECT table_number, COUNT(*) AS total_reservations
FROM Reservations
GROUP BY table_number;


/* 9️⃣ Display the tables that have more than 2 reservations. */
SELECT table_number, COUNT(*) AS total_reservations
FROM Reservations
GROUP BY table_number
HAVING total_reservations > 2;


/* 🔟 Show the names of customers and the items they ordered. */
SELECT c.name, m.item_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Menu m ON oi.item_id = m.item_id;


/* 11️⃣ Find the total revenue earned by the restaurant. */
SELECT SUM(total_amount) AS total_revenue
FROM Orders;


/* 12️⃣ Find the average order amount for each table. */
SELECT table_number, AVG(total_amount) AS avg_order_value
FROM Orders
GROUP BY table_number;


/* 13️⃣ Display the highest, lowest, and average bill amount. */
SELECT 
    MAX(total_amount) AS Highest_Bill,
    MIN(total_amount) AS Lowest_Bill,
    AVG(total_amount) AS Average_Bill
FROM Orders;


/* 14️⃣ List all customers whose names start with the letter ‘A’. */
SELECT * FROM Customers
WHERE name LIKE 'A%';


/* 15️⃣ Find the payment methods used and how many times each was used. */
SELECT payment_method, COUNT(*) AS usage_count
FROM Payments
GROUP BY payment_method;


/* 16️⃣ List all the customers who made payments using a card. */
SELECT name
FROM Customers
WHERE customer_id IN (
  SELECT customer_id FROM Payments WHERE payment_method = 'Card'
);


/* 17️⃣ Find all staff members who joined before May 2021. */
SELECT * FROM Staff
WHERE hire_date < '2021-05-01';


/* 18️⃣ Count how many staff members work in each role. */
SELECT role, COUNT(*) AS total_staff
FROM Staff
GROUP BY role;


/* 19️⃣ Find customers who made both a reservation and a payment via UPI. */
SELECT DISTINCT c.name
FROM Customers c
JOIN Reservations r ON c.customer_id = r.customer_id
JOIN Payments p ON c.customer_id = p.customer_id
WHERE p.payment_method = 'UPI';


/* 20️⃣ Show customers who spent more than ₹300 and paid by Cash. */
SELECT c.name, p.amount_paid, p.payment_method
FROM Customers c
JOIN Payments p ON c.customer_id = p.customer_id
WHERE p.amount_paid > 300 AND p.payment_method = 'Cash';


/* 21️⃣ List all orders with customer names and payment methods. */
SELECT c.name, o.order_id, o.total_amount, p.payment_method
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Payments p ON c.customer_id = p.customer_id;


/* 22️⃣ Find which item was ordered most frequently. */
SELECT m.item_name, COUNT(oi.item_id) AS times_ordered
FROM Order_Items oi
JOIN Menu m ON oi.item_id = m.item_id
GROUP BY m.item_name
ORDER BY times_ordered DESC
LIMIT 1;


/* 23️⃣ Find all customers who visited but did not place an order. */
SELECT name
FROM Customers
WHERE customer_id NOT IN (SELECT customer_id FROM Orders);


/* 24️⃣ Show total quantity of each menu item sold. */
SELECT m.item_name, SUM(oi.quantity) AS total_quantity
FROM Order_Items oi
JOIN Menu m ON oi.item_id = m.item_id
GROUP BY m.item_name;


/* 25️⃣ Display the top 3 customers who spent the most. */
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 3;