import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'router_state.dart';

class RouterCubit extends Cubit<RouterState> {
  RouterCubit() : super(RouterInitial());

  void onMessagePage() async => emit(RouterOnMessagePage());

  void onSplashPage() async {
    emit(RouterInitial());
    Future.delayed(const Duration(seconds: 3), () {
      emit(RouterOnMessagePage());
    });
  }

  void onLoginPage() async => emit(RouterOnLoginPage());

  void onRegisterPage() async => emit(RouterOnRegisterPage());
}
