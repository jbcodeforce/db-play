# Postgresql with Python

Integrate Postgresql with [Psycopg](https://www.psycopg.org/docs/index.html) is the most popular PostgreSQL database adapter for the Python.

* Install [psycopg2](https://pypi.org/project/psycopg2-binary/)
    ```sh
    uv add psycopg2-binary
    ```

* Defining connection in a .ini file
    ```yaml
    [postgresql]
    host=localhost
    database=app
    user=app
    password=apppwd
    ```

* Using Postgrsql running in k8s, use port forward:
    ```sh
    kubectl port-forward svc/pg-cluster-rw 5432:5432 -n pgdb
    ```

* Read configuration and connect:
    ```python
    ```

## Read employees database

```python
``` 
