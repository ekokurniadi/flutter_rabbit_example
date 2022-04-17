import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ServerFailures extends Failures {
  final String? errorMessage;
  ServerFailures({this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}

class LocalFailures extends Failures {
  @override
  List<Object?> get props => throw UnimplementedError();
}
