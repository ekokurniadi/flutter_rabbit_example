import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/router/router_cubit.dart';
import '../../features/home/presentation/pages/message_screen.dart';
import '../../features/home/presentation/pages/splash_screen.dart';

class Screens extends StatelessWidget {
  const Screens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RouterCubit>(context).onSplashPage();
    return BlocBuilder<RouterCubit, RouterState>(
      builder: (context, state) {
        if (state is RouterInitial) {
          return const SplashScreen();
        } else if (state is RouterSecondPage) {
          return const MessageScreen();
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
