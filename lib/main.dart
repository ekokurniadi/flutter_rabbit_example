import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'my_app.dart';
import 'core/helper/bloc_observer.dart';
import 'injection_container.dart' as di;
import 'app_config.dart';

StreamController<String> controller = StreamController<String>.broadcast();
Stream<String> get output => controller.stream;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initial();
  await AppConfig().configure();
  await AppConfig().rabbitInitial();
  FlutterBackgroundService.initialize(onStart);

  /// BLOC OBSERVER
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

Future<void> onStart() async {
  await AppConfig().backgroundServiceInitial();
}

void dispose() async {
  controller.sink.close();
}
