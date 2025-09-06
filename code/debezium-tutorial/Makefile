CFNT_NS=confluent
FLCK_NS=flink
CMF_URL=http://localhost:8084

start_zookeeper:
	@osascript -e 'tell app "Terminal" to do script "docker run -it --rm --name zookeeper -p 2181:2181 -p 2888:2888 -p 3888:3888 quay.io/debezium/zookeeper:3.2"'


start_kafka:
	@osascript -e 'tell app "Terminal" to do script "docker run -it --rm --name kafka -p 9092:9092 --link zookeeper:zookeeper quay.io/debezium/kafka:3.2"'

start_mysql:
	@osascript -e 'tell app "Terminal" to do script "docker run -it --rm --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=debezium -e MYSQL_USER=mysqluser -e MYSQL_PASSWORD=mysqlpw quay.io/debezium/example-mysql:3.2"'

start_mysql_client:
	@docker run -it --rm --name mysqlterm --link mysql mysql:8.2 sh -c 'exec mysql -h mysql -P 3306 -u root -pdebezium'

check_mysql_status:
	@echo "Checking if MySQL container is running..."
	@docker ps | grep mysql || echo "MySQL container not found or not running"

check_mysql_logs:
	@echo "Checking MySQL container logs..."
	@docker logs mysql

test_mysql_connection:
	@echo "Testing basic connectivity to MySQL container..."
	@docker run --rm --link mysql mysql:8.2 sh -c 'mysql -h mysql -u root -pdebezium -e "SELECT 1 as test;" 2>/dev/null && echo "✓ Connection successful" || echo "✗ Connection failed"'

start_kafka_connect:
	@osascript -e 'tell app "Terminal" to do script "docker run -it --rm --name connect -p 8083:8083 -e GROUP_ID=1 -e CONFIG_STORAGE_TOPIC=my_connect_configs -e OFFSET_STORAGE_TOPIC=my_connect_offsets -e STATUS_STORAGE_TOPIC=my_connect_statuses --link kafka:kafka --link mysql:mysql quay.io/debezium/connect:3.2"' -e 'tell application "Terminal" to set current settings of window 1 to settings set "Ocean"'

deploy_debezium_connector:
	@curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d@config.json

test_kafka_connect:
	@echo "Testing basic connectivity to Kafka Connect container..."
	@curl -H "Accept:application/json" localhost:8083/connectors/

view_customers:
	@osascript -e 'tell app "Terminal" to do script "docker run -it --rm --name watcher --link zookeeper:zookeeper --link kafka:kafka quay.io/debezium/kafka:3.2 watch-topic -a -k dbserver1.inventory.customers"' -e 'tell application "Terminal" to set current settings of window 1 to settings set "Grass"'


clean_up:
	@echo "Cleaning up containers..."
	@docker stop watcher || true
	@docker stop mysqlterm || true
	@docker stop connect || true
	@docker stop mysql || true
	@docker stop kafka || true
	@docker stop zookeeper || true
	@echo "Closing terminal windows..."
	@osascript -e 'tell application "Terminal" to close (every window whose name contains "zookeeper" or name contains "kafka" or name contains "mysql" or name contains "connect" or name contains "watcher")' || echo "Some terminal windows may still be open"

close_all_debezium_terminals:
	@echo "Forcefully closing all Debezium-related terminals..."
	@osascript -e 'tell application "Terminal" to close (every window whose name contains "debezium" or name contains "quay.io")' || true
