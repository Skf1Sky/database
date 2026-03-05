create database store_managements;
USE store_managements;
create table products (
 id int auto_increment primary key,
 name varchar(255) not null,
 des text null,
 price decimal(15,2) null,
 quantity int null 
);
insert into products (name,des,price,quantity) 
values ('Ban Phim','Full Layout',750000,1),('Tai nghe','Tai nghe 7.1',500000,1),('Man hinh','Full HD',1250000,1);

select * from products;
select name,des from products ;
update products 
set price = 800000
where id = 1 ;

update products 
set name = 'Ban phim co', price = 850000, quantity=5
where id =2;

delete from products where id =1;
truncate table products; 