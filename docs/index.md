# Database playground and CDC to kafka studies

!!!- "info"
    Updated 8/20/2022 - postgres content

This repository supports simple studies for data base play (SQL, JPA) like db2, postgresql and mysql and change data capture to move data to kafka for example.

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

See [this note](postgres.md) for creating the tables.

### Setting CDC on those table

The Kafka connector is deployed as part of Strimzi. 