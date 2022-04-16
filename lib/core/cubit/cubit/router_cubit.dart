import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'router_state.dart';

class RouterCubit extends Cubit<RouterState> {
  RouterCubit() : super(RouterInitial());

  void onSecondPage() {
    emit(RouterSecondPage());
  }

  void onHomePage() {
    emit(RouterInitial());
  }
}
