import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'router_state.dart';

class RouterCubit extends Cubit<RouterState> {
  RouterCubit() : super(RouterInitial());

  void onSecondPage() {
    emit(RouterSecondPage());
  }

  void onSplashPage() {
    emit(RouterInitial());
    Future.delayed(const Duration(seconds: 3), () {
      emit(RouterSecondPage());
    });
  }
}
