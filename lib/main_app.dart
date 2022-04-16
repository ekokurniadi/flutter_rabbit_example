import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabbitmq_flutter/core/cubit/rabbit_messaging/rabbit_messaging_cubit.dart';
import 'package:rabbitmq_flutter/core/screens/screens.dart';

import 'core/cubit/router/router_cubit.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => RouterCubit(),
          ),
          BlocProvider(
            create: (_) => RabbitMessagingCubit(),
          ),
        ],
        child: const Screens(),
      ),
    );
  }
}
