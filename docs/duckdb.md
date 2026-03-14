# Duckdb quick summary

## Why

* embedded analytics database for querying of few hundred gigabytes of data
* diverse data formats such as CSV, JSON, Parquet, and Apache Arrow,
* integration with mysql, postgresql
* SQL-based approach and columnar data processing engine
* Integrate with Pandas and Polars DataFrames
* not designed for applications requiring concurrent write access or transactional integrity due to its focus on analytical workloads.
* optimized for datasets fitting primarily in RAM
* In data science, DuckDB streamlines data preparation, exploration, and feature engineering, offering a performance boost over traditional DataFrame libraries.
* support for lists, maps, structs, and enums
* Allow exporting query results to different formats, including CSV, JSON, and Parquet,


## From Getting Started[](https://motherduck.com/duckdb-book-summary-chapter2/)

[duckdb CLI](https://duckdb.org/docs/stable/clients/cli/overview.html)

```sh
# start cli
duckdb
# open a database
duckdb dbname.duckdb
# or inside duckdb shell
```

## Basic Commands

In addition to SQL, the CLI supports "Dot Commands"

```sql
.open data/airbnd.duckdb
show databases;
.read FILENAME	Read and execute SQL from an external file
select * from raw.raw_hosts;
.exit
```

## SQL extension

