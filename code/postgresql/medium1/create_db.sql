create table customers(id integer not null primary key, name varchar);
create table orders(id integer not null primary key, customer_id integer, foreign key (customer_id) references customers(id));
create table employes(id integer not null primary key, salary integer);