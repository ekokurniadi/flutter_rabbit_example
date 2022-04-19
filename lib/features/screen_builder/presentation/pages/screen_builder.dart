import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/cubit/router/router_cubit.dart';
import '../../../auth/presentation/pages/login.dart';
import '../../../auth/presentation/pages/register.dart';
import '../../../home/presentation/pages/message_screen.dart';
import '../../../splashscreen/presentation/pages/splash_screen.dart';

class ScreenBuilder extends StatelessWidget {
  const ScreenBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RouterCubit>(context).onSplashPage();
    return BlocBuilder<RouterCubit, RouterState>(
      builder: (context, state) {
        if (state is RouterInitial) {
          return const SplashScreen();
        } else if (state is RouterOnLoginPage) {
          return const LoginPage();
        } else if (state is RouterOnRegisterPage) {
          return const RegisterPage();
        } else if (state is RouterOnMessagePage) {
          return const MessageScreen();
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
