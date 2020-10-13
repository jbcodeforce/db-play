# Apache Couchdb

## Getting started

 [Docker image](https://hub.docker.com/_/couchdb)

* Start with

```shell
docker run -p 5984:5984 --rm -v $(pwd)/database:/opt/couchdb/data -e COUCHDB_USER=admin -e COUCHDB_PASSWORD=myc0uch --name couchdb couchdb
```

* Access to the user interface: [Futon](http://localhost:5984/_utils/#)
* Verify the installation: http://localhost:5984/_utils/#/verifyinstall
* See a simple [tour guide](http://guide.couchdb.org/draft/tour.html)

## Some concepts

* To query documents, CouchDB uses predefined map and reduce functions, called view. Map functions are called once with each document as the argument. The function can choose to skip the document altogether or emit one or more view rows as key/value pairs.
* When writing CouchDB map functions, your primary goal is to build an index that stores related data under nearby keys

## Tools

Code to create records into couchdb from json file in python.