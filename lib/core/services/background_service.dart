import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

import '../../app_config.dart';

class BackgroundServices {
  Future<void> onStart() async {
    WidgetsFlutterBinding.ensureInitialized();
    final service = FlutterBackgroundService();
    service.onDataReceived.listen((event) {
      if (event!["action"] == "setAsForeground") {
        service.setForegroundMode(true);
        return;
      }

      if (event["action"] == "setAsBackground") {
        service.setForegroundMode(false);
      }

      if (event["action"] == "stopService") {
        service.stopBackgroundService();
      }
    });

    await AppConfig().rabbitInitial();

    // bring to foreground
    service.setForegroundMode(true);

    Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (!(await service.isServiceRunning())) timer.cancel();
      service.setNotificationInfo(
        title: "App Name",
        content: "Background service is running at ${DateTime.now()}",
      );

      service.sendData(
        {"current_date": DateTime.now().toIso8601String()},
      );
    });
  }

  void dispose(FlutterBackgroundService service) {
    service.dispose();
  }
}
