#!/bin/bash
read -p "Dame la ip del señor yofrank: " ip
echo "Dumpeando la bd"
# echo "get database Dump"
docker exec -i postgre pg_dump --no-owner --no-acl -U postgres --verbose  -h $ip line_execution > line_execution.sql
echo "Drop schema public"
docker exec -i postgre psql -h localhost -U postgres -w line_execution < sequence-sql/drop-public-schema.sql
echo "Restoring Database"
docker exec -i postgre psql -h localhost -U postgres -w line_execution < line_execution.sql
