part of 'rabbit_messaging_cubit.dart';

abstract class RabbitMessagingState extends Equatable {
  const RabbitMessagingState();

  @override
  List<Object> get props => [];
}

class RabbitMessagingInitial extends RabbitMessagingState {}

class RabbitMessagingStartStreamOnLoading extends RabbitMessagingState {}

class RabbitMessagingStreamComplete extends RabbitMessagingState {
  final MessageModel amqpData;
  const RabbitMessagingStreamComplete({required this.amqpData});

  @override
  List<Object> get props => [amqpData];
}
