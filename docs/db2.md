# DB2

## Docker

See [instructions here](https://hub.docker.com/r/ibmcom/db2)

```shell
# start
docker run -itd --name mydb2 --privileged=true -p 50000:50000 -e LICENSE=accept -e DB2INST1_PASSWORD=<choose an instance password> -e DBNAME=testdb -v $(pwd)/db2data:/database ibmcom/db2

# Log on the container
docker exec -ti db2 bash -c "su - db2inst1"

# Start db2 CLI
db2

(c) Copyright IBM Corporation 1993,2007
Command Line Processor for DB2 Client 11.5.0.0

You can issue database manager commands and SQL statements from the command 
prompt.

db2 connect reset 
```

## Useful commands



```shell
# Create the sample DB; creating tables and data in schema "DB2INST1".
db2sampl -force -sql
# Connect to it
db2 connect to sample

```
