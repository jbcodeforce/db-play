# PostgreSQL

## Create Postgres databases

### Create an instance of Postgresql on IBM Cloud

No need to reinvent the [product documentation](https://cloud.ibm.com/docs/services/databases-for-postgresql) to create one instance.

Get SSL certificate for client using ibm cloud CLI

```shell
ibmcloud cdb deployment-cacert Green-DB-PostgreSQL > postgres.crt
```

### Run Postgres locally

Set the environment variables: `source setenv.sh LOCAL`.

Under the postgresql folder:

* start the docker image for the database: `./startPostgresqlLocal.sh`
* Start bash in a postgres image to access psql: `./startPsql.sh LOCAL`

### Connect to remote Postgres on IBM Cloud

```shell
./startPsql.sh IBMCLOUD

psql postgres://$POSTGRES_USER:$POSTGRES_PWD@$POSTGRES_HOST/$POSTGRES_DB
```

## Create customers

```sql
CREATE TABLE customers (customer_id varchar(8) PRIMARY KEY, lastname varchar(40) NOT NULL, firstname varchar(40) NOT NULL, zipcode varchar(5), country varchar(40), status integer);
INSERT INTO customers (customer_id,lastname,firstname,zipcode,country,status) VALUES
('C01','Builder','Bob','95050','USA',1),
('C02','Destroyer','Bill','95050','USA',1),
('C03','Climber','Jack','95052','USA',1),
('C04','Messenger','John','95052','USA',1);
```

## Create products

```sql
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
```

## Create containers

```sql
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
```

## Create orders

```sql
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
```
