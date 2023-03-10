import json
import os
from time import sleep

from kafka import KafkaConsumer

if __name__ == '__main__':
    consumer = KafkaConsumer(
        'conter_topic',
        auto_offset_reset='earliest',
        bootstrap_servers=['localhost:9092'],
        api_version=(0, 10),
        consumer_timeout_ms=1000
    )
    for msg in consumer:
        record = json.loads(msg.value)
        print(f"This employee is not Karen. It's actually {name}")

    if consumer is not None:
        consumer.close()
