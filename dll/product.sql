CREATE TABLE products (
    product_id varchar(64) NOT NULL PRIMARY KEY,
    description varchar(100),
    target_temperature REAL,
    target_humidity_level REAL,
    content_type integrer
);

INSERT INTO products(product_id,description,target_temperature,target_humidity_level,content_type) VALUES
('P01','Carrots',4,0.4,1),
('P02','Banana',6,0.6,2),
('P03','Salad',4,0.4,1),
('P04','Avocado',6,0.4,1),
('P05','Tomato',4,0.4,2);