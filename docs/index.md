# Database playground and CDC to kafka studies

!!!- "info"
    Updated 8/20/2022 - postgres content

This repository supports simple studies for data base play (SQL, JPA) like db2, postgresql and mysql and change data capture to move data to kafka for example.

## SQL basic

![](./images/sql-cheat-cheet.png)

Examples of some basic commands applied to customers table.

```sql
select * from customers;
select distinct(name) from customers;
select count(distinct(rate)) from films;

# how many customer has the name bob and older that 18
select count(*) from customer where name = 'bob' and age >= 18;
# order on a column name
select name, salary from customers order by salary DESC;

# limit the number of records returned
SELECT name, salary FROM customers ORDER BY salary DESC LIMIT 10;

# BETWEEN
select count(*) from payment where amount between 8 and 9;
select * from payment where payment_date between '2007-02-01' and '2007-2-15';

# IN to test value in a list of options
select count(*) from payment where amount in(0.99, 1.98, 1.99);

# LIKE and ILIKE (case incensitive) to do pattern matching on string
select * from customer where first_name ilike 'J%';

# Modify the table
alter table customers add column email varchar(100);

update customers  set email='max@email.com' where id = 4;

# Aggregate min, nax, abg, cont,...
select round(avg(replacement_code),3) from film;

# GROUP BY combined with aggregate. Who is the customer spending the most
select customer_id, sum(amount) from  payment group by customer_id order by sum(amount) DESC;

# get the day with the most transactions
select DATE(payment_date), sum(amount) from  payment group by  DATE(payment_date) order by sum(amount) DESC;

# HAVING to allow us to use the aggregate result to filter the result along with group by

```

See also [postgres study](./postgres.md)

### Exercises on the dvdrental database

See [postgres](./postgres.md) to restore the database schema and data from the tar file.

* How many payment transactions were greater than $5.00?

    ```sql
    select count(*) from payment where amount > 5
    ```

* How many actors have a first name that starts with the letter P?


    ```sql
    select count(first_name) from actor where first_name like 'P%';
    ```
* How many unique districts are our customers from?

    ```sql
    select count(distinct(district)) from address;
    # Retrieve the list of names for those distinct districts 
    select distinct(district) from address where district is not null and district != '' order by district asc;
    ```

* How many films have a rating of R and a replacement cost between $5 and $15?

    ```sql
    select count(*) from film where  rating = 'R' and replacement_cost between 5 and 15;
    ```
* How many films have the word Truman somewhere in the title?

    ```sql
    select count(*) from film where title ilike '%truman%';
    ```
* which staff member processes the biggest number of transaction

    ```sql
    select staff_id, count(amount) from  payment group by  staff_id;
    ```
* what is the avg replacement cost per film rating

    ```sql
    select rating, round(avg(replacement_cost),2) from  film group by  rating;
    ```
* Customer elligible for platinium status having more than 40 transactions

    ```sql
    ```
    
## Common queries to clean data
## Quarkus with panache and DB2

The project is [inventory app](https://github.com/jbcodeforce/eda-kconnect-lab/tree/master/inventory-app) and the interesting part is the property file

```properties
quarkus.datasource.username=cbm39816
quarkus.datasource.password=
quarkus.datasource.url=jdbc:db2://dashdb-txn-sbox-yp-dal09-03.services.dal.bluemix.net:50001/BLUDB:sslConnection=true;
quarkus.datasource.max-size=8
quarkus.datasource.min-size=2
quarkus.datasource.driver=com.ibm.db2.jcc.DB2Driver
quarkus.hibernate-orm.dialect=org.hibernate.dialect.DB2Dialect
quarkus.hibernate-orm.database.generation=drop-and-create
quarkus.hibernate-orm.database.default-schema=CBM39816
quarkus.hibernate-orm.log.sql=true
quarkus.hibernate-orm.sql-load-script=import.sql
quarkus.smallrye-openapi.path=/inventory/swagger
quarkus.swagger-ui.always-include=true
```

## Postgresql

See [dedicated note](./postgres.md).

### Setting CDC on those table

The Kafka connector is deployed as part of Strimzi. 

TBC