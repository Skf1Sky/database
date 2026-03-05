CREATE DATABASE store_managements;

USE store_managements;


CREATE TABLE products (id int AUTO_INCREMENT PRIMARY KEY,
                                             name varchar(255) NOT NULL,
                                                               des text NULL,
                                                                        price decimal(15, 2) NULL,
                                                                                             quantity int NULL);


INSERT INTO products (name, des, price, quantity)
VALUES ('Ban Phim','Full Layout',750000,1),
       ('Tai nghe','Tai nghe 7.1',500000,1),
       ('Man hinh','Full HD',1250000,1);


SELECT *
FROM products;


SELECT name,
       des
FROM products ;


UPDATE products
SET price = 800000
WHERE id = 1 ;


UPDATE products
SET name = 'Ban phim co',
    price = 850000,
    quantity=5
WHERE id =2;


DELETE
FROM products
WHERE id =1;


TRUNCATE TABLE products;
