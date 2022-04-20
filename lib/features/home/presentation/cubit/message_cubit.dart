import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rabbitmq_flutter/features/home/data/models/list_message_model.dart';
import 'package:rabbitmq_flutter/features/home/data/models/message_model.dart';
import 'package:rabbitmq_flutter/features/home/domain/usecases/send_message_usecases.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  final SendMessageUsecases sendMessageUsecases;
  MessageCubit({required this.sendMessageUsecases}) : super(MessageInitial());

  Future<void> sendMessage({
    bool? isSender,
    String? message,
    String? messageID,
    String? receiver,
    String? sender,
  }) async {
    emit(MessageLoading());

    var result = await sendMessageUsecases.call(
      isSender: isSender,
      message: message,
      messageID: messageID,
      receiver: receiver,
      sender: sender,
    );
    result.fold((error) => emit(MessageSendError()), (response) {
      emit(MessageSendSuccess(message: response));
    });
  }

  Future<void> createMessage() async {}
}
