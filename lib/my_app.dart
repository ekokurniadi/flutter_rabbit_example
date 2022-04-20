import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabbitmq_flutter/features/home/presentation/cubit/message_cubit.dart';

import 'features/screen_builder/presentation/pages/screen_builder.dart';
import 'injection_container.dart';
import 'core/cubit/rabbit_messaging/rabbit_messaging_cubit.dart';
import 'core/cubit/router/router_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
            create: (_) => sl<RouterCubit>(),
          ),
          BlocProvider(
            create: (_) => sl<RabbitMessagingCubit>(),
          ),
          BlocProvider(
            create: (_) => sl<MessageCubit>(),
          ),
        ],
        child: const ScreenBuilder(),
      ),
    );
  }
}
