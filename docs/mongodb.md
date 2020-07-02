# MongoDB

Database for MongoDB Product [doc on cloud](https://cloud.ibm.com/docs/databases-for-mongodb)
See [this quarkus tutorial for orm mongo with panache](https://quarkus.io/guides/mongodb-panache)


## Connect to database for mongo

* [Connecting with mongo shell](https://cloud.ibm.com/docs/databases-for-mongodb?topic=databases-for-mongodb-mongo-shell)
* [mongo shell interface to MongoDB](https://docs.mongodb.com/v4.2/reference/program/mongo/#bin.mongo). Downloadable from [ MongoDB Database Tools](https://www.mongodb.com/try/download/database-tools). 07/01/2020 put them in my `~/bin`

* Get the TLS certificate

```shell
ibmcloud cdb deployment-cacert gse-eda-mongo
```


