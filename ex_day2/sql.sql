CREATE DATABASE bookstore_management;
USE bookstore_management;

CREATE TABLE authors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address TEXT
);

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    price DECIMAL(15, 2),
    author_id INT,
    CONSTRAINT fk_book_author FOREIGN KEY (author_id) REFERENCES authors(id)
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_order_employee FOREIGN KEY (employee_id) REFERENCES employees(id)
);

CREATE TABLE order_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT,
    CONSTRAINT fk_detail_order FOREIGN KEY (order_id) REFERENCES orders(id),
    CONSTRAINT fk_detail_book FOREIGN KEY (book_id) REFERENCES books(id)
);

INSERT INTO authors (name) VALUES ('Nam Cao'), ('Xuân Diệu');
INSERT INTO employees (name, address) VALUES ('Trần Nhất Thiên', 'Đà Nẵng'), ('Nguyễn Văn A', 'Hà Nội');
INSERT INTO books (title, price, author_id) VALUES ('Chí Phèo', 50000, 1), ('