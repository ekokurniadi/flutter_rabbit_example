part of 'message_cubit.dart';

abstract class MessageState extends Equatable {
  const MessageState();

  @override
  List<Object> get props => [];
}

class MessageInitial extends MessageState {}

class MessageSendSuccess extends MessageState {
  final MessageModel? message;
  const MessageSendSuccess({this.message});

  @override
  List<Object> get props => [message!];
}

class MessageFetchSuccess extends MessageState {
  final ListMessageModel? message;
  const MessageFetchSuccess({this.message});

  @override
  List<Object> get props => [message!];
}

class MessageSendError extends MessageState {}

class MessageLoading extends MessageState {}
