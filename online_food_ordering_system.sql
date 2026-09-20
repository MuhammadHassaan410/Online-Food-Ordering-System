CREATE DATABASE online_food_ordering_system;

USE online_food_ordering_system;


/* =========================================================
   CUSTOMER TABLE
   ========================================================= */

CREATE TABLE Customer
(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15) UNIQUE,
    address VARCHAR(200),
    age INT CHECK(age >= 18)
);


/* =========================================================
   RESTAURANT TABLE
   ========================================================= */

CREATE TABLE Restaurant
(
    restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_name VARCHAR(100) NOT NULL,
    city VARCHAR(100),
    contact_no VARCHAR(15)
);


/* =========================================================
   CATEGORY TABLE
   ========================================================= */

CREATE TABLE Category
(
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL
);


/* =========================================================
   FOOD ITEM TABLE
   ========================================================= */

CREATE TABLE Food_Item
(
    food_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT,
    category_id INT,
    food_name VARCHAR(100) NOT NULL,
    description VARCHAR(200),
    price DECIMAL(10,2) CHECK(price > 0),
    stock INT,

    FOREIGN KEY (restaurant_id)
        REFERENCES Restaurant(restaurant_id),

    FOREIGN KEY (category_id)
        REFERENCES Category(category_id)
);


/* =========================================================
   ORDERS TABLE
   ========================================================= */

CREATE TABLE Orders
(
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    order_status VARCHAR(50),

    FOREIGN KEY (customer_id)
        REFERENCES Customer(customer_id)
);


/* =========================================================
   ORDER DETAILS TABLE
   ========================================================= */

CREATE TABLE Order_Details
(
    detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    food_id INT,
    quantity INT CHECK(quantity > 0),
    subtotal DECIMAL(10,2),

    FOREIGN KEY (order_id)
        REFERENCES Orders(order_id),

    FOREIGN KEY (food_id)
        REFERENCES Food_Item(food_id)
);


/* =========================================================
   PAYMENT TABLE
   ========================================================= */

CREATE TABLE Payment
(
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    payment_date DATE,

    FOREIGN KEY (order_id)
        REFERENCES Orders(order_id)
);


/* =========================================================
   DELIVERY TABLE
   ========================================================= */

CREATE TABLE Delivery
(
    delivery_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    rider_name VARCHAR(100),
    delivery_status VARCHAR(50),

    FOREIGN KEY (order_id)
        REFERENCES Orders(order_id)
);


/* =========================================================
   INSERT CUSTOMER DATA
   ========================================================= */

INSERT INTO Customer
(customer_name, email, phone, address, age)

VALUES
('Ali Khan', 'ali@gmail.com', '03001234567', 'Karachi', 21),
('Ahmed Raza', 'ahmed@gmail.com', '03111234567', 'Hyderabad', 22),
('Sara Noor', 'sara@gmail.com', '03221234567', 'Lahore', 20),
('Hassan Ali', 'hassan@gmail.com', '03331234567', 'Islamabad', 25),
('Areeba Khan', 'areeba@gmail.com', '03441234567', 'Karachi', 23);


/* =========================================================
   INSERT RESTAURANT DATA
   ========================================================= */

INSERT INTO Restaurant
(restaurant_name, city, contact_no)

VALUES
('Burger Lab', 'Karachi', '03009998888'),
('Pizza Point', 'Hyderabad', '03119998888'),
('Food Center', 'Lahore', '03229998888');


/* =========================================================
   INSERT CATEGORY DATA
   ========================================================= */

INSERT INTO Category
(category_name)

VALUES
('Fast Food'),
('Pizza'),
('Dessert'),
('Drinks');


/* =========================================================
   INSERT FOOD ITEMS
   ========================================================= */

INSERT INTO Food_Item
(restaurant_id, category_id, food_name, description, price, stock)

VALUES
(1, 1, 'Zinger Burger', 'Spicy Chicken Burger', 650, 50),
(2, 2, 'Chicken Pizza', 'Large Pizza', 1500, 25),
(1, 3, 'Ice Cream', 'Chocolate Ice Cream', 300, 40),
(3, 4, 'Cold Drink', 'Soft Drink', 120, 70),
(2, 1, 'Beef Burger', 'Double Patty Burger', 850, 30);


/* =========================================================
   INSERT ORDERS
   ========================================================= */

INSERT INTO Orders
(customer_id, order_date, total_amount, order_status)

VALUES
(1, '2026-05-20', 2150, 'Pending'),
(2, '2026-05-20', 650, 'Delivered'),
(3, '2026-05-21', 1500, 'Preparing'),
(4, '2026-05-21', 970, 'Delivered'),
(5, '2026-05-22', 300, 'Pending');


/* =========================================================
   INSERT ORDER DETAILS
   ========================================================= */

INSERT INTO Order_Details
(order_id, food_id, quantity, subtotal)

VALUES
(1, 1, 1, 650),
(1, 2, 1, 1500),
(2, 1, 1, 650),
(3, 2, 1, 1500),
(4, 5, 1, 850),
(4, 4, 1, 120),
(5, 3, 1, 300);


/* =========================================================
   INSERT PAYMENT DATA
   ========================================================= */

INSERT INTO Payment
(order_id, payment_method, payment_status, payment_date)

VALUES
(1, 'Cash', 'Paid', '2026-05-20'),
(2, 'Card', 'Paid', '2026-05-20'),
(3, 'JazzCash', 'Paid', '2026-05-21'),
(4, 'Cash', 'Paid', '2026-05-21'),
(5, 'Card', 'Unpaid', '2026-05-22');


/* =========================================================
   INSERT DELIVERY DATA
   ========================================================= */

INSERT INTO Delivery
(order_id, rider_name, delivery_status)

VALUES
(1, 'Usman', 'Preparing'),
(2, 'Hamza', 'Delivered'),
(3, 'Bilal', 'On The Way'),
(4, 'Ahmed', 'Delivered'),
(5, 'Saad', 'Pending');


/* =========================================================
   SELECT OPERATION
   ========================================================= */

SELECT *
FROM Food_Item
WHERE price > 500;


/* =========================================================
   PROJECT OPERATION
   ========================================================= */

SELECT food_name, price
FROM Food_Item;


/* =========================================================
   RENAME OPERATION
   ========================================================= */

SELECT
    food_name AS Item_Name,
    price AS Food_Price
FROM Food_Item;


/* =========================================================
   UNION OPERATION
   ========================================================= */

SELECT customer_name
FROM Customer

UNION

SELECT restaurant_name
FROM Restaurant;


/* =========================================================
   CARTESIAN PRODUCT
   ========================================================= */

SELECT *
FROM Customer
CROSS JOIN Food_Item;


/* =========================================================
   EQUI JOIN
   ========================================================= */

SELECT
    Customer.customer_name,
    Orders.order_id

FROM Customer, Orders

WHERE Customer.customer_id = Orders.customer_id;


/* =========================================================
   NATURAL JOIN
   ========================================================= */

SELECT *
FROM Customer
NATURAL JOIN Orders;


/* =========================================================
   LEFT OUTER JOIN
   ========================================================= */

SELECT
    Customer.customer_name,
    Orders.order_id,
    Orders.order_status

FROM Customer

LEFT JOIN Orders
ON Customer.customer_id = Orders.customer_id;


/* =========================================================
   RIGHT OUTER JOIN
   ========================================================= */

SELECT
    Customer.customer_name,
    Orders.order_id,
    Orders.order_status

FROM Customer

RIGHT JOIN Orders
ON Customer.customer_id = Orders.customer_id;


/* =========================================================
   COUNT FUNCTION
   ========================================================= */

SELECT COUNT(*) AS Total_Orders
FROM Orders;


/* =========================================================
   SUM FUNCTION
   ========================================================= */

SELECT SUM(total_amount) AS Total_Sales
FROM Orders;


/* =========================================================
   AVG FUNCTION
   ========================================================= */

SELECT AVG(price) AS Average_Price
FROM Food_Item;


/* =========================================================
   MAX FUNCTION
   ========================================================= */

SELECT MAX(price) AS Highest_Price
FROM Food_Item;


/* =========================================================
   MIN FUNCTION
   ========================================================= */

SELECT MIN(price) AS Lowest_Price
FROM Food_Item;


/* =========================================================
   GROUP BY
   ========================================================= */

SELECT
    customer_id,
    SUM(total_amount) AS Total_Purchase

FROM Orders

GROUP BY customer_id;


/* =========================================================
   HAVING CLAUSE
   ========================================================= */

SELECT
    customer_id,
    SUM(total_amount) AS Total_Purchase

FROM Orders

GROUP BY customer_id

HAVING SUM(total_amount) > 1000;


/* =========================================================
   SUBQUERY
   ========================================================= */

SELECT customer_name

FROM Customer

WHERE customer_id IN
(
    SELECT customer_id
    FROM Orders
    WHERE total_amount > 1000
);


/* =========================================================
   DISTINCT
   ========================================================= */

SELECT DISTINCT order_status
FROM Orders;


/* =========================================================
   LIKE OPERATOR
   ========================================================= */

SELECT *
FROM Customer
WHERE customer_name LIKE 'A%';


/* =========================================================
   IN OPERATOR
   ========================================================= */

SELECT *
FROM Orders

WHERE order_status IN
(
    'Pending',
    'Delivered'
);


/* =========================================================
   BETWEEN OPERATOR
   ========================================================= */

SELECT *
FROM Food_Item

WHERE price BETWEEN 500 AND 2000;


/* =========================================================
   LOGICAL OPERATORS
   ========================================================= */

SELECT *
FROM Customer

WHERE age > 20
AND address = 'Karachi';


/* =========================================================
   ORDER BY
   ========================================================= */

SELECT *
FROM Food_Item

ORDER BY price DESC;


/* =========================================================
   CREATE VIEW
   ========================================================= */

CREATE VIEW customer_orders AS

SELECT
    Customer.customer_name,
    Orders.order_id,
    Orders.total_amount,
    Orders.order_status

FROM Customer

JOIN Orders
ON Customer.customer_id = Orders.customer_id;


/* =========================================================
   DISPLAY VIEW
   ========================================================= */

SELECT *
FROM customer_orders;


/* =========================================================
   REPLACE VIEW
   ========================================================= */

CREATE OR REPLACE VIEW customer_orders AS

SELECT
    Customer.customer_name,
    Orders.order_id,
    Orders.total_amount,
    Orders.order_status,
    Orders.order_date

FROM Customer

JOIN Orders
ON Customer.customer_id = Orders.customer_id;


/* =========================================================
   DISPLAY UPDATED VIEW
   ========================================================= */

SELECT *
FROM customer_orders;


/* =========================================================
   DROP VIEW
   ========================================================= */

DROP VIEW customer_orders;


/* =========================================================
   CREATE INDEX
   ========================================================= */

CREATE INDEX idx_customer_name
ON Customer(customer_name);


/* =========================================================
   UPDATE RECORD
   ========================================================= */

UPDATE Customer

SET address = 'Multan'

WHERE customer_id = 3;


/* =========================================================
   DELETE RECORD
   ========================================================= */

DELETE FROM Delivery

WHERE delivery_id = 5;


/* =========================================================
   SHOW ALL TABLES
   ========================================================= */

SHOW TABLES;


/* =========================================================
   DISPLAY ALL TABLE DATA
   ========================================================= */

SELECT * FROM Customer;

SELECT * FROM Restaurant;

SELECT * FROM Category;

SELECT * FROM Food_Item;

SELECT * FROM Orders;

SELECT * FROM Order_Details;

SELECT * FROM Payment;

SELECT * FROM Delivery;
