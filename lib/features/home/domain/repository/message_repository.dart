import 'package:dartz/dartz.dart';
import 'package:rabbitmq_flutter/core/error/failures.dart';
import 'package:rabbitmq_flutter/features/home/data/models/list_message_model.dart';
import 'package:rabbitmq_flutter/features/home/data/models/message_model.dart';

abstract class MessageRepository {
  Future<Either<Failures, MessageModel>> sendMessage({
    String? message,
    String? receiver,
    String? sender,
    String? messageID,
    bool? isSender,
    String? recevierName,
  });

  Future<Either<Failures, List<ListMessageModel>>> getMessageFromLocal();

  Future<Either<Failures, int>> insertMessageToLocal(MessageModel message);
}
