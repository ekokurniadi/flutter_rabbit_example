import 'package:dartz/dartz.dart';
import 'package:rabbitmq_flutter/core/error/failures.dart';
import 'package:rabbitmq_flutter/features/home/data/models/message_model.dart';
import 'package:rabbitmq_flutter/features/home/data/repository/message_repository_impl.dart';

class SendMessageUsecases {
  final MessageRepositoryImpl messageRepositoryImpl;
  SendMessageUsecases({required this.messageRepositoryImpl});

  Future<Either<Failures, MessageModel>> call({
    bool? isSender,
    String? message,
    String? messageID,
    String? receiver,
    String? sender,
    String? recevierName,
  }) async {
    var result = await messageRepositoryImpl.sendMessage(
        message: message,
        receiver: receiver,
        sender: sender,
        messageID: messageID,
        isSender: isSender,
        recevierName: recevierName);

    await messageRepositoryImpl.insertMessageToLocal(MessageModel(
      isSender: isSender!,
      message: message!,
      messageID: messageID!,
      receiver: receiver!,
      sender: "",
      senderName: "",
      receiverName: recevierName!,
    ));
    return result;
  }
}
