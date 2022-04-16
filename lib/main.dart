import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:rabbitmq_flutter/main_app.dart';

import 'app.dart';

StreamController<String> controller = StreamController<String>.broadcast();
Stream<String> get output => controller.stream;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await App().init();
  FlutterBackgroundService.initialize(onStart);
  runApp(const MainApp());
}

Future<void> onStart() async {
  await App().onStart();
}

void dispose() async {
  controller.sink.close();
}
