docker exec -it kafka-kraft \
  kafka-storage.sh format \
  --config /etc/kafka/kafka.properties \
  --cluster-id $(kafka-storage.sh random-uuid) \
  --ignore-formatted

