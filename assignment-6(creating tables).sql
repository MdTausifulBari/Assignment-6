-- drop table order_items;
-- drop table orders;
-- drop table products;
-- drop table categories;
-- drop table customers;

-- Customers Table
CREATE TABLE Customers (
    customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(25) NOT NULL,
    location VARCHAR(100) NOT NULL,
    created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP()
);

INSERT INTO Customers (name, email, location)
VALUES 
('John Doe', 'john.doe@example.com', 'New York'),
('Alice Johnson', 'alice.j@example.com', 'Los Angeles'),
('Bob Smith', 'bob.smith@example.com', 'Chicago'),
('Eva Brown', 'eva.b@example.com', 'Houston'),
('Michael Davis', 'michael.d@example.com', 'Miami'),
('Sarah Wilson', 'sarah.w@example.com', 'San Francisco'),
('David Lee', 'david.l@example.com', 'Seattle'),
('Emma White', 'emma.w@example.com', 'Boston'),
('Daniel Turner', 'daniel.t@example.com', 'Denver'),
('Olivia Clark', 'olivia.c@example.com', 'Austin');

-- Categories Table
CREATE TABLE Categories (
    category_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO Categories (category_id, name)
VALUES 
(1, 'Category 1'),
(2, 'Category 2'),
(3, 'Category 3'),
(4, 'Category 4'),
(5, 'Category 5');

-- Products Table
CREATE TABLE Products (
    product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    category_id INT,
    name VARCHAR(50),
    description TEXT,
    price DECIMAL(10, 2),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO Products (category_id, name, description, price)
VALUES 
(1, 'Product 1', 'Description for Product 1', 29.99),
(2, 'Product 2', 'Description for Product 2', 39.95),
(1, 'Product 3', 'Description for Product 3', 49.99),
(3, 'Product 4', 'Description for Product 4', 19.99),
(2, 'Product 5', 'Description for Product 5', 59.99),
(4, 'Product 6', 'Description for Product 6', 79.99),
(3, 'Product 7', 'Description for Product 7', 69.95),
(5, 'Product 8', 'Description for Product 8', 89.99),
(4, 'Product 9', 'Description for Product 9', 99.99),
(5, 'Product 10', 'Description for Product 10', 109.99);

-- Orders Table
CREATE TABLE Orders (
    order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO Orders (customer_id, order_date, total_amount) VALUES 
(4, '2023-01-15', 150.00),
(2, '2023-01-16', 200.50),
(1, '2023-01-17', 180.75),
(3, '2023-01-18', 250.20),
(3, '2023-01-19', 300.75),
(2, '2023-01-20', 220.40),
(5, '2023-01-21', 280.90),
(3, '2023-01-22', 190.60),
(1, '2023-01-23', 320.25),
(4, '2023-01-24', 270.30),
(5, '2023-01-25', 180.00),
(7, '2023-01-26', 210.50),
(5, '2023-01-27', 195.75),
(8, '2023-01-28', 260.20),
(2, '2023-01-29', 310.75);

-- Order_Items Table
CREATE TABLE Order_Items (
    order_item_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO Order_Items (order_id, product_id, quantity, unit_price) VALUES 
(3, 6, 4, 79.99),
(7, 3, 3, 49.99),
(1, 2, 1, 39.95),
(2, 3, 3, 49.99),
(5, 10, 2, 109.99),
(3, 5, 1, 59.99),
(1, 1, 2, 29.99),
(4, 7, 2, 69.95),
(4, 8, 3, 89.99),
(5, 9, 1, 99.99),
(6, 1, 2, 29.99),
(2, 4, 2, 19.99),
(6, 2, 1, 39.95),
(7, 4, 2, 19.99),
(8, 5, 1, 59.99);


