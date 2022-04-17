import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'main_app.dart';
import 'core/helper/bloc_observer.dart';
import 'injection_container.dart' as di;
import 'app.dart';

StreamController<String> controller = StreamController<String>.broadcast();
Stream<String> get output => controller.stream;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initials();
  await App().init();
  FlutterBackgroundService.initialize(onStart);

  /// BLOC OBSERVER
  BlocOverrides.runZoned(
    () {
      runApp(const MainApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

Future<void> onStart() async {
  await App().onStart();
}

void dispose() async {
  controller.sink.close();
}
