import 'package:get_it/get_it.dart';
import 'package:rabbitmq_flutter/core/cubit/rabbit_messaging/rabbit_messaging_cubit.dart';
import 'package:rabbitmq_flutter/core/cubit/router/router_cubit.dart';
import 'package:rabbitmq_flutter/core/helper/toast_helper.dart';
import 'core/config/database/database_connection.dart';
import 'core/helper/constant_helper.dart';
import 'core/migrations/migration.config.dart';

final sl = GetIt.instance;

Future<void> initials() async {
  DatabaseConnection databaseConnection =
      DatabaseConnection(ConstantHelper.DATABASE_NAME, migrationList);

  sl.registerSingleton<DatabaseConnection>(databaseConnection);

  // cubit
  sl.registerFactory(() => RouterCubit());
  sl.registerFactory(() => RabbitMessagingCubit());

  // helper
  sl.registerLazySingleton(() => ToastHelper());
}
