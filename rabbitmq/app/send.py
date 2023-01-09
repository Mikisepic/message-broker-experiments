import pika

NUMBER_OF_MESSAGES = 10000

connection = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
channel = connection.channel()

channel.queue_declare(queue='message_queue')
start = time.perf_counter()

for i in range(NUMBER_OF_MESSAGES):
    channel.basic_publish(
        exchange='', routing_key='message_queue', body='Message {}'.format(i))

end = time.perf_counter()
print(f"Sent 10000 messages to the queue. Completed in {end - start:0.4f} seconds")

connection.close()
