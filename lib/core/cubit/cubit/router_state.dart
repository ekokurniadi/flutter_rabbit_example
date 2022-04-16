part of 'router_cubit.dart';

abstract class RouterState extends Equatable {
  const RouterState();

  @override
  List<Object> get props => [];
}

class RouterInitial extends RouterState {}

class RouterSecondPage extends RouterState {}
