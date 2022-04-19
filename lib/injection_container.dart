import 'package:get_it/get_it.dart';

import 'core/config/database/database_connection.dart';
import 'core/cubit/rabbit_messaging/rabbit_messaging_cubit.dart';
import 'core/cubit/router/router_cubit.dart';
import 'core/helper/constant_helper.dart';
import 'core/helper/toast_helper.dart';
import 'core/migrations/migration.config.dart';
import 'core/services/background_service.dart';
import 'core/services/rabbit_message_service.dart';

final sl = GetIt.instance;

Future<void> initial() async {
  DatabaseConnection databaseConnection =
      DatabaseConnection(ConstantHelper.DATABASE_NAME, migrationList);

  sl.registerSingleton<DatabaseConnection>(databaseConnection);

  // cubit
  sl.registerFactory(() => RouterCubit());
  sl.registerFactory(() => RabbitMessagingCubit());

  // helper
  sl.registerLazySingleton(() => ToastHelper());

  // core services
  sl.registerLazySingleton(() => RabbitMessageService());
  sl.registerLazySingleton(() => BackgroundServices());
}
