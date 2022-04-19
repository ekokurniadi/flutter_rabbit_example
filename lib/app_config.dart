import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_flipperkit/flutter_flipperkit.dart';
import 'package:rabbitmq_flutter/core/config/database/database_connection.dart';
import 'package:rabbitmq_flutter/core/helper/constant_helper.dart';
import 'package:rabbitmq_flutter/core/helper/dio_helper.dart';
import 'package:sqflite/sqflite.dart';

import 'injection_container.dart';
import 'core/services/background_service.dart';
import 'core/services/rabbit_message_service.dart';

class AppConfig {
  Database? database;

  Future<void> rabbitInitial() async {
    await sl<RabbitMessageService>().startService();
  }

  Future<void> backgroundServiceInitial() async {
    await sl<BackgroundServices>().onStart();
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
