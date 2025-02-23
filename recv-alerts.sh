docker exec -it kafka-alerts kafka-console-consumer \
  --topic alerts --bootstrap-server localhost:9092 \
  --from-beginning

