-- Create Database
-- Ensure the database exists before using it
CREATE DATABASE InventoryDB;


-- Create 'Users' Table (Optional, for user management)
CREATE TABLE Users (
    user_id INT  PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

-- Create 'Suppliers' Table
CREATE TABLE Suppliers (
    supplier_id INT  PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    contact_name VARCHAR(255),
    contact_phone VARCHAR(15),
    contact_email VARCHAR(255)
);

-- Create 'Items' Table
CREATE TABLE Items (
    item_id INT  PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    quantity INT DEFAULT 0,
    price DECIMAL(10, 2) NOT NULL,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id) ON DELETE SET NULL
);

-- Create 'Transactions' Table
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    transaction_date DATE NOT NULL,
    user_id INT,
    transaction_type VARCHAR(10) NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE SET NULL
);

-- Create 'TransactionDetails' Table (for items in each transaction)
CREATE TABLE TransactionDetails (
    transaction_detail_id INT PRIMARY KEY,
    transaction_id INT,
    item_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (transaction_id) REFERENCES Transactions(transaction_id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES Items(item_id) ON DELETE CASCADE
);

-- Insert sample data into 'Suppliers'
INSERT INTO Suppliers (name, contact_name, contact_phone, contact_email)
VALUES ('Supplier A', 'John Doe', '1234567890', 'johndoe@supplier.com');

-- Insert sample data into 'Items'
INSERT INTO Items (name, description, quantity, price, supplier_id)
VALUES ('Item A', 'Description of Item A', 100, 10.50, 1);

-- Insert sample data into 'Users'
INSERT INTO Users (username, password, email)
VALUES ('admin', 'password123', 'admin@example.com');

-- Insert sample transaction data
INSERT INTO Transactions (transaction_date, user_id, transaction_type, total_amount)
VALUES ('2025-05-01', 1, 'sale', 100.50);

-- Insert sample transaction details
INSERT INTO TransactionDetails (transaction_id, item_id, quantity, price)
VALUES (1, 1, 5, 10.50);
