CREATE TABLE containers (
    container_id varchar(64) NOT NULL PRIMARY KEY,
    model varchar(5),
    brand varchar(20),
    status varchar(20),
    last_maintenance_date TIMESTAMP,
    capacity integer,
    latitude REAL,
    longitude REAL
);
INSERT INTO containers(container_id,model,brand,status,capacity) VALUES
('C01','20RF','Brand01',1,20),
('C02','45RW','Brand01',1,45),
('C03','20RF','Brand01',1,20),
('C04','40RH','Brand02',1,40),
('C05','40RH','Brand01',1,40);
