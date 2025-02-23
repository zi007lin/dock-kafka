#!/bin/bash

docker exec -it kafka-alerts kafka-topics \
  --create --topic alerts \
  --bootstrap-server localhost:9092 \
  --partitions 1 \
  --replication-factor 1

