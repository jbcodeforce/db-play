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
db2 sample -force -sql
# list current DB
db2 list database directory 
# Connect to it
db2 connect to sample user db2inst1
# list tables
 db2 list tables
# Look at the structure of a table
db2 describe table DB2INST1.ORDEREVENTS
```

## DB2 on cloud

Once the service is created get the credential, user, jdbc url and password. Then to access it from a pod on OpenShift, define a secret with those variable encoded with base64

## DB2 in OpenShift with operator

* Install the DB2 operator from IBM Catalog: [Operator Catalog product documentation](https://www.ibm.com/support/knowledgecenter/SSEPGG_11.5.0/com.ibm.db2.luw.db2u_openshift.doc/doc/t_db2u_install_op_catalog.html)
* create a namespace: eda-dba
* install the operator from the operator hub
* Be sure to add `ibm-registry` secret with the ibm entitled key for the given user.

```shell
oc create secret docker-registry ibm-registry   \
    --docker-server=cp.icr.io                   \
    --docker-username=cp                        \
    --docker-password=${ENTITLEDKEY}            \
    --docker-email=${USER}                      \
    --namespace=${NAMESPACE}
```

* Create an instance using the good storage class and modifying the account as:

```yaml
  license:
    accept: true
  account:
    privileged: true
    imagePullSecrets:
      - ibm-registry    
  version: "11.5.5.0"
  size: 1
```

Once the instance is created there are 4 pods running for each instance and one for the operator.

```shell
c-db2ucluster-sample-db2u-0                   1/1       Running     0          34m
c-db2ucluster-sample-etcd-0                   1/1       Running     0          35m
c-db2ucluster-sample-ldap-54b75695d5-dr8xr    1/1       Running     0          37m
c-db2ucluster-sample-tools-79c8f7659c-znpkw   1/1       Running     0          37m
```

* When remote connected to the db2u pod, we can see the mounted volume from the PVC
[Instruction for lab to prepare a VM for OpenShift and DB2](https://www.ibm.com/cloud/blog/how-to-build-a-db2-for-openshift-environment-for-your-desktop) but may be relevant.

[IBM DB@ github](https://github.com/IBM/charts/tree/master/stable/ibm-db2)