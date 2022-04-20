import 'package:rabbitmq_flutter/features/home/data/models/list_message_model.dart';
import 'package:rabbitmq_flutter/features/home/data/models/message_model.dart';
import 'package:rabbitmq_flutter/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:rabbitmq_flutter/features/home/data/resources/local_datasource.dart';
import 'package:rabbitmq_flutter/features/home/data/resources/remote_datasource.dart';
import 'package:rabbitmq_flutter/features/home/domain/repository/message_repository.dart';

class MessageRepositoryImpl extends MessageRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  MessageRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failures, MessageModel>> sendMessage({
    String? message,
    String? receiver,
    String? sender,
    String? messageID,
    bool? isSender,
    String? recevierName,
  }) async {
    var result = await remoteDataSource.sendMessage(
      message: message,
      receiver: receiver,
      sender: sender,
      messageID: messageID,
      isSender: isSender,
      recevierName: recevierName,
    );
    return result;
  }

  @override
  Future<Either<Failures, List<ListMessageModel>>> getMessageFromLocal() async {
    return await localDataSource.getMessageFromLocal();
  }

  @override
  Future<Either<Failures, int>> insertMessageToLocal(
      MessageModel message) async {
    return await localDataSource.insertMessageToLocal(message);
  }
}
