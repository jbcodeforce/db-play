#!/bin/bash
DOCKER_IMAGE=docker.io/postgres:11.6-alpine
PROJECT_NAME=jbsandbox
SERVICE_ACCOUNT_NAME=jbsandbox
DEPLOYMENT_NAME=postgres
SERVICE_NAME=postgres
POSTGRES_PASSWORD=postgres123
#Once per project...
oc new-project ${PROJECT_NAME}
oc create serviceaccount ${SERVICE_ACCOUNT_NAME}
oc adm policy add-scc-to-user anyuid -n ${PROJECT_NAME} -z ${SERVICE_ACCOUNT_NAME}
#Once per deployment...
oc create deployment ${DEPLOYMENT_NAME} --image=${DOCKER_IMAGE}
oc set serviceaccount deployment/${DEPLOYMENT_NAME} ${SERVICE_ACCOUNT_NAME}

## This adds the correct runtime switches to the pg container command
## ```
## args:
## - -c
## - wal_level_logical
## ```
oc patch deployment ${DEPLOYMENT_NAME} --type="json" -p='[{"op":"add", "path":"/spec/template/spec/containers/0/args", "value":[]},{"op":"add", "path":"/spec/template/spec/containers/0/args/-", "value":"-c"},{"op":"add", "path":"/spec/template/spec/containers/0/args/-", "value":"wal_level=logical"} ]'
oc set env deployment ${DEPLOYMENT_NAME} POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
oc expose deployment ${DEPLOYMENT_NAME} --port 5432 --name ${SERVICE_NAME}