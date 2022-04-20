import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_flipperkit/flutter_flipperkit.dart';
import 'core/config/database/database_connection.dart';
import 'core/helper/constant_helper.dart';
import 'core/helper/dio_helper.dart';
import 'package:sqflite/sqflite.dart';

import 'injection_container.dart';
import 'core/services/background_service.dart';
import 'core/services/rabbit_message_service.dart';

class AppConfig {
  Database? database;

  Future<void> rabbitInitial() async {
    RabbitMessageService rabbitMessageService = sl<RabbitMessageService>();
    await rabbitMessageService.startService();
  }

  Future<void> backgroundServiceInitial() async {
    BackgroundServices backgroundServices = BackgroundServices();
    await backgroundServices.onStart();
  }

  Future<void> configure() async {
    DioHelper.initDio(ConstantHelper.BASE_URL);
    DioHelper.setDioInterceptor(ConstantHelper.BASE_URL);

    if (!kReleaseMode) {
      FlipperClient flipperClient = FlipperClient.getDefault();
      flipperClient.addPlugin(FlipperNetworkPlugin());
      flipperClient.addPlugin(FlipperSharedPreferencesPlugin());
      flipperClient.start();
    }

    database = await sl<DatabaseConnection>().database;
    if (kDebugMode) {
      print("local database: ${database.toString()}");
    }
  }
}
