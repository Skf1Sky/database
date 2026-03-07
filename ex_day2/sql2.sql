CREATE DATABASE bank_xyz;
USE bank_xyz;

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE accounts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    balance DECIMAL(15, 2) DEFAULT 0.00,
    customer_id INT NOT NULL,
    CONSTRAINT fk_account_customer FOREIGN KEY (customer_id) REFERENCES customers(id),
    CONSTRAINT uq_customer_id UNIQUE (customer_id)
);

INSERT INTO customers (name) VALUES ('Trần Nhất Thiên'), ('Nguyễn Văn A');
INSERT INTO accounts (balance, customer_id) VALUES (5000000, 1), (10000000, 2);

SELECT c.name, a.id AS account_number, a.balance
FROM customers c
JOIN accounts a ON c.id = a.customer_id;