# MySQL

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

