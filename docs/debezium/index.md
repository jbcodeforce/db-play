# CDC with Debezium studies

## Tutorial summary

The [Debezium tutorial is here](https://debezium.io/documentation/reference/3.2/tutorial.html) and summarized in this note.

### Things to remember:

* Debezium is a Kafka connect connector, one dedicated per database: Postgresql, MySQL. 


### Tutorial steps

The commands are provided in the Makefile under code/debezium-tutorial.

1. The labs setup:
    ```sh
    make start_zookeeper
    make start_kafka
    make start_mysql
    make start_mysql_client
    ```
???- warning "Potential issues to address"
    When trying to connect to mysql server with the client, the root user is denied access. One way is to ensure the 'root' user (or the specific user you're using for Debezium) has privileges granted for the correct host.
        ```sh
        # remote connect via
        docker exec -ti mysql bash
        # start local mysql, using debezium as password
        mysql -u root -p
        # Modify privilege with the SQL:
        CREATE USER 'root'@'%' IDENTIFIED BY 'debezium'
        GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
        FLUSH PRIVILEGES;
        ```

1. Registrer debezium connector to start monitoring the database server's binlog.
    ```sh
    curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d@config.json
    ```

    When you register a connector, it generates a large amount of log output in the Kafka Connect container.

* The connector performs a snapshot, looking at the table schema, reading all the rows, then it may create kafka topics, and then it transitions to continuously reading the binlog.
* The topics created match the tables in the database:

| topic name | role |
| --- | --- |
| **dbserver1** | The schema change topic to which all of the DDL statements are written.| 
| **dbserver1.inventory.products** |Captures change events for the products table in the inventory database.|
| **dbserver1.inventory.products_on_hand** | Captures change events for the products_on_hand table in the inventory database.|
| **dbserver1.inventory.customers** | Captures change events for the customers table in the inventory database. |
| **dbserver1.inventory.orders** | Captures change events for the orders table in the inventory database. |

1. View events created
    ```sh
    docker run -it --rm --name watcher --link zookeeper:zookeeper --link kafka:kafka quay.io/debezium/kafka:3.2 watch-topic -a -k dbserver1.inventory.customers
    # or
    make view_customers
    ```

    We should see two records, one for the key and one for the payload.

    The event has two parts: a schema and a payload. The schema contains a Kafka Connect schema describing what is in the payload

* The envelop provides metadata about what the event represents:
    * **op**: A required field that contains a string value describing the type of operation
    * **before**: An optional field that, if present, contains the state of the row before the event occurred.
    * **after**: An optional field that, if present, contains the state of the row after the event occurred. 
    * **source**: A required field that contains a structure describing the source metadata for the event, which in the case of MySQL, contains several fields: the connector name, the name of the binlog file where the event was recorded, the position in that binlog file where the event appeared, the row within the event (if there is more than one), the names of the affected database and table, the MySQL thread ID that made the change, whether this event was part of a snapshot, and, if available, the MySQL server ID, and the timestamp in seconds.
    * **ts_ms**: An optional field that, if present, contains the time (using the system clock in the JVM running the Kafka Connect task) at which the connector processed the event.

* The JSON converter includes the key and value schemas in every message, so it does produce very verbose events. While with Avro, it will persist the schema in a remote schema registry, and send the binary unique identifier of the schema.

* Update table records in the mySQL client
    ```sql
    UPDATE customers SET first_name='Anne Marie' WHERE id=1004;
    ```

* Deleting a record:
    ```sql
    delete from addresses where customer_id=1004;
    delete from customers WHERE id=1004;
    ```

    The key records is the same, while the payload has an after that is null.
    ```json
      "payload": {
        "before": {
            "id": 1004,
            "first_name": "Anne Marie",
            "last_name": "Kretchmar",
            "email": "annek@noanswer.org"
        },
        "after": null,
        "source": 
    ```

* Stop the kafka connector, 
    ```sh
    docker stop connect
    ```
    
    add new records
    ```sql
    INSERT INTO customers VALUES (default, "Sarah", "Thompson", "kitt@acme.com");
    INSERT INTO customers VALUES (default, "Kenneth", "Anderson", "kander@acme.com");
    ```

* Clean up
    ```sh
    ```
    
## to keep in mind


If Kafka is set up to be log compacted, it will remove older messages from the topic if there is at least one message later in the topic with same key. This last event is called a tombstone event, because it has a key and an empty value. This means that Kafka will remove all prior messages with the same key. Even though the prior messages will be removed, the tombstone event means that consumers can still read the topic from the beginning and not miss any events.

The Kafka Connect service automatically manages tasks for its registered connectors. Therefore, if it goes offline, when it restarts, it will start any non-running tasks. This means that even if Debezium is not running, it can still report changes in a database.

