Online Food Ordering System

Introduction

The Online Food Ordering System is a database management project developed to manage food ordering operations using a structured relational database. The system stores and manages customer information, restaurants, food categories, food items, orders, payments, and delivery records.

The project is implemented using MySQL Workbench and demonstrates practical Database Management System (DBMS) concepts including table creation, primary and foreign keys, constraints, SQL queries, relational algebra operations, joins, aggregate functions, subqueries, views, indexing, and normalization.

Background

Online food delivery systems require organized management of customers, restaurants, menus, orders, payments, and deliveries. A relational database provides a structured way to store this information while maintaining relationships and data integrity.

This project demonstrates how MySQL can be used to design and manage an online food ordering database. Foreign keys establish relationships between related tables, while constraints help maintain consistency and valid data.

Features

- Customer registration and management
- Restaurant management
- Food category management
- Food item and menu management
- Food price and stock information
- Order management
- Order details management
- Payment and transaction records
- Delivery and rider information
- Primary and foreign key constraints
- UNIQUE and CHECK constraints
- SQL CRUD operations
- Relational algebra operations
- Equi Join
- Natural Join
- Left Outer Join
- Right Outer Join
- Aggregate functions
- GROUP BY and HAVING
- Subqueries
- Logical operators
- LIKE, IN and BETWEEN operators
- ORDER BY and DISTINCT
- Database views
- View replacement and deletion
- Indexing
- Normalized relational database structure

Database Tables

The system consists of the following tables:

Table| Purpose
"Customer"| Stores customer information
"Restaurant"| Stores restaurant details
"Category"| Stores food categories
"Food_Item"| Stores menu items, prices and stock
"Orders"| Stores customer orders
"Order_Details"| Stores individual items within orders
"Payment"| Stores payment information
"Delivery"| Stores delivery and rider information

Database Relationships

The major relationships include:

- A customer can place multiple orders.
- A restaurant can have multiple food items.
- A category can contain multiple food items.
- An order can contain multiple order details.
- A food item can appear in multiple order details.
- An order can have payment information.
- An order can have delivery information.

Foreign keys are used to maintain referential integrity between related tables.

DBMS Concepts Implemented

Relational Algebra

The project demonstrates concepts such as:

- Selection
- Projection
- Rename
- Union
- Cartesian Product

SQL Joins

The following joins are implemented:

- Equi Join
- Natural Join
- Left Outer Join
- Right Outer Join
- Cross Join

Aggregate Functions

The project uses:

- "COUNT()"
- "SUM()"
- "AVG()"
- "MAX()"
- "MIN()"

SQL Clauses and Operators

The project demonstrates:

- "WHERE"
- "GROUP BY"
- "HAVING"
- "ORDER BY"
- "DISTINCT"
- "LIKE"
- "IN"
- "BETWEEN"
- Logical operators such as "AND"

Views

A database view is created to display customer order information. The project also demonstrates:

- Creating a view
- Replacing a view
- Displaying a view
- Dropping a view

Indexing

An index is created on the customer name field to demonstrate database indexing for data retrieval.

Constraints

The database uses:

- Primary Key
- Foreign Key
- "NOT NULL"
- "UNIQUE"
- "CHECK"
- "AUTO_INCREMENT"

Sample Data

The database contains sample records for:

- Customers
- Restaurants
- Food categories
- Food items
- Orders
- Order details
- Payments
- Deliveries

This sample data is used to test SQL queries and demonstrate different DBMS operations.

Tools Used

- MySQL Workbench
- MySQL / SQL
- ER Diagram / Relational Database Design
- Microsoft Word for project documentation

Project Objectives

The main objectives of this project are:

1. Design a structured relational database for an online food ordering system.
2. Store customer, restaurant, menu, order, payment, and delivery information.
3. Establish relationships between database tables.
4. Maintain data integrity using constraints.
5. Implement SQL queries and CRUD operations.
6. Demonstrate relational algebra operations and SQL joins.
7. Implement aggregate functions, subqueries, views, and indexing.
8. Apply database normalization concepts.

Limitations

- The project currently runs in a local MySQL environment.
- Real-time online payment integration is not implemented.
- No complete graphical user interface is included.
- Delivery tracking is not connected to real GPS services.
- The project is primarily designed for academic and educational purposes.
- Advanced user authentication and security features are not implemented.
- Data is mainly managed through SQL queries in MySQL Workbench.

Future Improvements

The system could be expanded by adding:

- Web-based graphical user interface
- Mobile application
- Online payment gateway integration
- Real-time GPS delivery tracking
- Customer authentication
- Restaurant login system
- Admin dashboard
- Food search and filtering
- Order notifications
- Sales and analytics dashboard

Conclusion

The Online Food Ordering System demonstrates the practical implementation of database management concepts using MySQL Workbench. The project provides a structured relational database for managing customers, restaurants, food items, orders, payments, and delivery information.

It demonstrates important DBMS concepts including SQL queries, CRUD operations, relational algebra, joins, constraints, aggregate functions, subqueries, views, indexing, and relational database design.

The project provides practical experience in designing and implementing a relational database while applying concepts learned in the DBMS course.
