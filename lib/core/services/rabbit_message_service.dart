// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';

import 'package:dart_amqp/dart_amqp.dart';
import '../helper/constant_helper.dart';
import '../../main.dart';

class RabbitMessageService {
  Future<void> startService() async {
    print("rabbit messaging is starting");
    ConnectionSettings settings = ConnectionSettings(
        host: ConstantHelper.RABBITMQ_HOST,
        port: ConstantHelper.RABBITMQ_PORT,
        reconnectWaitTime: const Duration(milliseconds: 1500),
        authProvider: const PlainAuthenticator("guest", "guest"));

    Client client = Client(settings: settings);

    try {
      Channel channel = await client.channel().then((value) {
        print("try to create channel instance");
        return value;
      });

      Queue queue =
          await channel.queue("QueueService1", durable: true).then((value) {
        print("get queue name => ${value.name}");
        return value;
      });

      Consumer consumer = await queue.consume().then((value) {
        print("get consumer tag => ${value.tag}");
        return value;
      });

      consumer.listen((event) {
        print(
          "[*]Receive message from queue as json: ${event.payloadAsJson}",
        );
        controller.sink.add(jsonEncode(event.payloadAsJson['data']));
      });
    } on ConnectionException catch (e) {
      print(e.toString());
    }
  }
}
