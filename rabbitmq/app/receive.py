import pika

connection = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
channel = connection.channel()

channel.queue_declare(queue='message_queue')
channel.basic_consume(
    queue='message_queue', on_message_callback=callback, auto_ack=True)
print("Waiting for messages. Press Ctrl+C to exit.")
channel.start_consuming()
start = time.perf_counter()


def callback(ch, method, properties, body):
    checkpoint = time.perf_counter()
    print("Received message: {}".format(body))
    print(f"Completed in {checkpoint - start:0.4f} seconds")


if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print('Interrupted')
        try:
            sys.exit(0)
        except SystemExit:
            os._exit(0)
