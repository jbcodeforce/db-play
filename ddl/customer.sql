create table customers (
    customer_id varchar(8) PRIMARY KEY, 
    lastname varchar(40) NOT NULL, 
    firstname varchar(40) NOT NULL, 
    zipcode varchar(5), 
    country varchar(40), 
    status integer);
INSERT INTO customers (customer_id,lastname,firstname,zipcode,country,status) VALUES
('C01','Builder','Bob','95050','USA',1),
('C02','Destroyer','Bill','95050','USA',1),
('C03','Climber','Jack','95052','USA',1),
('C04','Messenger','John','95052','USA',1);