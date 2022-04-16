import 'dart:async';
import 'package:rabbitmq_flutter/core/services/background_service.dart';
import 'package:rabbitmq_flutter/core/services/rabbit_message_service.dart';

class App {
  Future<void> init() async {
    await RabbitMessageService().startService();
  }

  Future<void> onStart() async {
    await BackgroundServices().onStart();
  }
}
