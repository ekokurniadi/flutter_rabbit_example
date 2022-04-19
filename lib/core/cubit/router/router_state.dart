part of 'router_cubit.dart';

abstract class RouterState extends Equatable {
  const RouterState();

  @override
  List<Object> get props => [];
}

class RouterInitial extends RouterState {}

class RouterOnMessagePage extends RouterState {}

class RouterOnLoginPage extends RouterState {}

class RouterOnRegisterPage extends RouterState {}
