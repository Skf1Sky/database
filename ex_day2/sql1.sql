CREATE DATABASE electronic_contact_book;
USE electronic_contact_book;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL
);

CREATE TABLE phone_numbers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    phone VARCHAR(20) NOT NULL,
    user_id INT,
    CONSTRAINT fk_phone_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE emails (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email_address VARCHAR(150) NOT NULL,
    user_id INT,
    CONSTRAINT fk_email_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

INSERT INTO users (full_name) VALUES ('Trần Nhất Thiên');
INSERT INTO phone_numbers (phone, user_id) VALUES ('0905123456', 1), ('0935999888', 1);
INSERT INTO emails (email_address, user_id) VALUES ('thien@gmail.com', 1), ('thien.dev@outlook.com', 1);

SELECT 
    u.full_name, 
    GROUP_CONCAT(DISTINCT p.phone SEPARATOR ', ') AS all_phones, 
    GROUP_CONCAT(DISTINCT e.email_address SEPARATOR ', ') AS all_emails
FROM users u
LEFT JOIN phone_numbers p ON u.id = p.user_id
LEFT JOIN emails e ON u.id = e.user_id
GROUP BY u.id;