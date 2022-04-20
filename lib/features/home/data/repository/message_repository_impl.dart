import 'package:rabbitmq_flutter/features/home/data/models/message_model.dart';
import 'package:rabbitmq_flutter/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:rabbitmq_flutter/features/home/data/resources/remote_datasource.dart';
import 'package:rabbitmq_flutter/features/home/domain/repository/message_repository.dart';

class MessageRepositoryImpl extends MessageRepository {
  final RemoteDataSource remoteDataSource;
  MessageRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, MessageModel>> sendMessage({
    String? message,
    String? receiver,
    String? sender,
    String? messageID,
    String? isSender,
  }) async {
    var result = await remoteDataSource.sendMessage(
      message: message,
      receiver: receiver,
      sender: sender,
      messageID: messageID,
      isSender: isSender,
    );
    return result;
  }
}
