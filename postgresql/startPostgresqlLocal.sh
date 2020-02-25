source ../setenv.sh LOCAL
docker run --rm -p 5432:5432 --network="bridge" -v $(pwd)/database:/var/lib/postgresql/data --name local-postgres -e POSTGRES_PASSWORD=$POSTGRESQL_PWD -d postgres