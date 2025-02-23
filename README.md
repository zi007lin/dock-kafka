# dock-kafka

# Verify Container Status
docker ps | grep kafka

# List Topics (Verify Kafka is Running)
docker exec -it kafka-alerts kafka-topics --list --bootstrap-server localhost:9092

# Create Test Topic (Optional)
docker exec -it kafka-alerts kafka-topics \
  --create --topic alerts \
  --bootstrap-server localhost:9092 \
  --partitions 1 \
  --replication-factor 1

# Send Messages to Test Topic
docker exec -it kafka-alerts kafka-console-producer \
  --topic alerts --bootstrap-server localhost:9092

# Consume Messages from Test Topic
docker exec -it kafka-alerts kafka-console-consumer \
  --topic alerts --bootstrap-server localhost:9092 \
  --from-beginning
