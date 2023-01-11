from kafka import KafkaProducer

# Connect to the Kafka broker
producer = KafkaProducer(bootstrap_servers='localhost:9092')

# Send the messages
for i in range(10000):
    producer.send('conter_topic', b'Message {}'.format(i))

print("Sent 10 messages to the topic.")

# Flush and close the producer
producer.flush()
producer.close()
