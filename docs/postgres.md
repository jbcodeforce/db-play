# PostgreSQL

[Postgresql](https://www.postgresql.org/) is open source object-relational database system with over 30 years of active development that has earned it a strong reputation for reliability, feature robustness, and performance.

## Value propositions


## Project using postgresql

* [Vaccine order mgr](https://github.com/ibm-cloud-architecture/vaccine-order-mgr-pg)
* In this project there is a copy of Quarkus - panache - postgresql quickstart with settings to access remote postgresql on IBM Cloud and kubernetes template for a secret to get URL, user and password to access the DB.  

## Create Postgres databases

### Create an instance of Postgresql on IBM Cloud

No need to reinvent the [product documentation](https://cloud.ibm.com/services/databases-for-postgresql) to create one instance. A summary of what needs to be done

* Set user admin password:

```
ibmcloud cdb user-password <instance name> admin alongpassw0rd
```

* Get URL to connect to the service: URL, Port number

* Get SSL certificate for client using ibm cloud CLI

```shell
ibmcloud cdb deployment-cacert Green-DB-PostgreSQL > postgres.crt
```

* Use `pgAdmin4` to administer postgres: add a server and complete the ULR, port, admin as user and the password set in previous step.

```shell

docker run -p 8080:80 -d -e PGADMIN_DEFAULT_EMAIL=admin -e PGADMIN_DEFAULT_PASSWORD=alongpassw0rd dpage/pgadmin4
# http://localhost:8080/browser/

```

### Run Postgres locally

Set the environment variables `POSTGRESQL_USER,POSTGRESQL_HOST, POSTGRESQL_PWD` in the .env script and then use the command: `source .env`.

Under the postgresql folder:

* start the docker image for the database: `./startPostgresqlLocal.sh`
* Start bash in a postgres image to access psql: `./startPsql.sh LOCAL`

another way is with docker compose:

```yaml
 postgresql:
    container_name: postgres
    hostname: postgres
    image: postgres
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: pgpwd
      POSTGRES_DB: ordersdb
    ports:
      - "5432:5432"
    volumes:
      - ./data:/var/lib/postgresql/data/
```

### Some psql commands

```shell
# switch to another DB
\c dbname
# list existing DBs
\l
# list available tables
\dt 
# describe table
\d table_name
# list schemas
\dn
# list available funtions
\df
# views
\dv
# list users
\du
# command history
\s
# execute previoud commmand
\g
```

### Connect to remote Postgres on IBM Cloud

```shell
./startPsql.sh IBMCLOUD

psql postgres://$POSTGRES_USER:$POSTGRES_PWD@$POSTGRES_HOST/$POSTGRES_DB
```

### Deploy postgresql on OpenShift

#### Using deployment

See the script deployPostgresOnOpenShift.sh.

#### Using Operator

In the 'developer perspective` of OpenShift console, use the database and a postgresql without persistence, or ephemeral. Set the DB name, user and password. See [this OpenShift tutorial for more info](https://docs.openshift.com/enterprise/3.1/using_images/db_images/postgresql.html#configuration-and-usage).

The environment variables are defined as secrets under the postgresql namespace: `oc describe secret postgresql`

Remote connect to the postgresql pod: `oc rsh podid`

Then start `psql` using the following command: 

```shell
PGPASSWORD=$POSTGRESQL_PASSWORD psql -h postgresql -d $POSTGRESQL_DATABASE -U $POSTGRESQL_USER
psql (10.12)
Type "help" for help.

vaccinedb=>
```

To access the database with pgadmin running locally, to the remote DB, we need to do port forwarding as:

```shell
oc get pods
oc port-forward postgres-5f449ccd95-tclb6 15432:5432
```

Then in the quarkus app or in env file define properties like:

```shell
export QUARKUS_DATASOURCE_USERNAME=postgres
export QUARKUS_DATASOURCE_PASSWORD=postgres1234
export POSTGRESQL_DBNAME=postgres
export QUARKUS_DATASOURCE_JDBC_URL=jdbc:postgresql://localhost:15432/postgres

```

## Some SQL examples

### Create customers

Here is the complete SQL you can run in psql

```sql
CREATE TABLE customers (customer_id varchar(8) PRIMARY KEY, lastname varchar(40) NOT NULL, firstname varchar(40) NOT NULL, zipcode varchar(5), country varchar(40), status integer);
INSERT INTO customers (customer_id,lastname,firstname,zipcode,country,status) VALUES
('C01','Builder','Bob','95050','USA',1),
('C02','Destroyer','Bill','95050','USA',1),
('C03','Climber','Jack','95052','USA',1),
('C04','Messenger','John','95052','USA',1);
```

or use the command

```shell
psql postgres://$POSTGRES_USER:$POSTGRES_PWD@$POSTGRES_HOST/$POSTGRES_DB -a -f /home/dll/customer.sql
``` 

### Create products

Products define fresh product with controlled temperature and humidity to control for the travel.

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

```shell
psql postgres://$POSTGRES_USER:$POSTGRES_PWD@$POSTGRES_HOST/$POSTGRES_DB -a -f /home/dll/product.sql
```

### Create containers

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

### Create orders

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

## Hibernate ORM

See code for [order management](https://github.com/ibm-cloud-architecture/vaccine-order-mgr-pg)
