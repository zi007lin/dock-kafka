#!/bin/bash

docker rm kafka-alerts
docker run -d --name kafka-alerts \
  -p 9092:9092 -p 9093:9093 \
  -e KAFKA_PROCESS_ROLES=broker,controller \
  -e KAFKA_NODE_ID=1 \
  -e KAFKA_LISTENER_SECURITY_PROTOCOL_MAP=PLAINTEXT:PLAINTEXT,CONTROLLER:PLAINTEXT \
  -e KAFKA_LISTENERS=PLAINTEXT://localhost:9092,CONTROLLER://localhost:9093 \
  -e KAFKA_INTER_BROKER_LISTENER_NAME=PLAINTEXT \
  -e KAFKA_CONTROLLER_LISTENER_NAMES=CONTROLLER \
  -e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://localhost:9092 \
  -e KAFKA_LOG_DIRS=/var/lib/kafka/data \
  -e KAFKA_METADATA_LOG_DIR=/var/lib/kafka/metadata \
  -e KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1 \
  -e KAFKA_TRANSACTION_STATE_LOG_REPLICATION_FACTOR=1 \
  -e KAFKA_TRANSACTION_STATE_LOG_MIN_ISR=1 \
  -e KAFKA_AUTO_CREATE_TOPICS_ENABLE=true \
  -e CLUSTER_ID=249bc7a8-fb46-4a8f-8d24-14ffaa2ecdb1 \
  -e KAFKA_CONTROLLER_QUORUM_VOTERS=1@localhost:9093 \
  -v kafka-data:/var/lib/kafka/data \
  -v kafka-logs:/var/lib/kafka/metadata \
  --network 5277f0ffb171fb299f7cc7ec269fa35609e02c8f69ae09bb692b5f2c557a3e85 \
  confluentinc/cp-kafka:7.9.0

