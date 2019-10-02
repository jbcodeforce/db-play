export POSTGRESQL_USER=postgres
export POSTGRESQL_PWD=postgres

PGPASSWORD=$POSTGRESQL_PWD psql --host=localhost --port=5432 --username=$POSTGRESQL_USER  -d postgres