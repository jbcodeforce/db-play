# MongoDB

Open source document oriented database designed to scale. It stores parsed json doc or bson.
For production deployments mongodb uses distributed servers with replication and automatic master failover

It supports:

* complex queries express as json document
* evantual consistency
* malleable schema: can easily change at runtime
* both large and small scale
* Automatic sharding (partition data sets over multiple machines) distributes collection data across machines.

Some key concepts
- A database holds a set of collections. 
- A collection holds a set of documents. 
- A document is a set of key-value pairs. 
- Documents have dynamic schema.
- mongo is the interactive shell to access the DB
- application uses driver to access the DB

Database for MongoDB [Product documentation on IBM cloud](https://cloud.ibm.com/docs/databases-for-mongodb)
See [this quarkus tutorial for orm mongo with panache](https://quarkus.io/guides/mongodb-panache)

## Docker compose

```yaml
mongo:
    container_name: mongo
    image: mongo
    restart: always
    environment:
      MONGO_INITDB_ROOT_USERNAME: root
      MONGO_INITDB_ROOT_PASSWORD: example
    volumes:
      - ./data:/data/db
    ports:
      - 27017:27017
```

## Mongo CLI

```sh
mongo --username root --password example
MongoDB shell version v4.4.5

> show dbs
 local   0.078125GB
 > use mydb
 switched to db mydb
 > db
 mydb
 > db.createCollection('items')
 >  show collections
items
```

A collection is a group of related documents that have a set of shared common indexes. Collections are analogous to a table in relational databases. You do not need to create a collection before inserting data. When you insert the first document using the command like db.testdata.insert(ajson)  the mongod will create both the database instance and the collection

All MongoDB documents must have an `_id` field with has a unique value and is considered as primary key. The `find` method is used to get the content of a collection. The results are grouped by 20, and the command `it` gives the next page for the result set. 

## Connect to database for mongo

* [Connecting with mongo shell](https://cloud.ibm.com/docs/databases-for-mongodb?topic=databases-for-mongodb-mongo-shell)
* [mongo shell interface to MongoDB](https://docs.mongodb.com/v4.2/reference/program/mongo/#bin.mongo). Downloadable from [ MongoDB Database Tools](https://www.mongodb.com/try/download/database-tools). 07/01/2020 put them in my `~/bin`

* Get the TLS certificate

```shell
ibmcloud cdb deployment-cacert gse-eda-mongo
```


