CREATE TABLE orders (
    order_id varchar(26) NOT NULL PRIMARY KEY,
    quantity integer, 
    creation_date TIMESTAMP,
    status integer,
    pickup_zipcode varchar(6),
    destination_zipcode varchar(6),
    container_id varchar(64) NULL,
    product_id varchar(64),
    customer_id varchar(8),
    foreign key (container_id) references containers(container_id),
    foreign key (product_id) references products(product_id),
    foreign key (customer_id) references customers(customer_id));

INSERT INTO ORDERS (order_id,quantity,status,creation_date,pickup_zipcode,destination_zipcode,container_id,product_id,customer_id) VALUES 
('O01',20,1,'2019-04-09 09:25:38.336','95050','34000','C01','P01','C01'),
('O02',40,1,'2019-04-09 09:25:38.336','95050','34000',NULL,'P03','C02'),
('O03',40,1,'2019-04-09 09:25:38.336','95050','34000','C02','P04','C03'),
('O04',40,1,'2019-04-09 09:25:38.336','95050','34000',NULL,'P04','C04')
;