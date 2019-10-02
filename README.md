# Database studies

This repository supports simple studies for data base like db2, postgresql and mysql.

## Order and Customer database MySQL

* Run [mysql in docker](https://hub.docker.com/_/mysql):

```
docker run -it --rm --name mysql -v ../datadir/mysql:/var/lib/mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=jb -e MYSQL_USER=admin -e MYSQL_PASSWORD=admin -e MYSQL_DATABSE=jbdb mysql:latest
```

Or use the `docker-compose.yml` under the mysql folder.

```
docker-compose -f docker-compose.yml up &
```

Product [documentation](https://dev.mysql.com/doc/refman/8.0/en/mysql.html).
The default configuration for MySQL can be found in `/etc/mysql/my.cnf`.


## Postgresql play

Under the postgresql folder:

* start the docker image for the database: `./startPostgresqlLocal.sh`
* Connect the psql CLI to postgresql: `/startPsql.sh`

### psql

```
CREATE DATABASE suppliers;

CREATE TABLE suppliers (supplier_id char(8) PRIMARY KEY, name varchar(40) NOT NULL, status integer);
```

### python

Use the module: psycopg2
See commented code in [playwithdb.py]()

See some examples [here](http://www.postgresqltutorial.com/postgresql-python/query/)

