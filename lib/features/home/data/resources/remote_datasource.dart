import 'package:dartz/dartz.dart';
import 'package:rabbitmq_flutter/core/error/failures.dart';
import 'package:rabbitmq_flutter/features/home/data/models/message_model.dart';

abstract class RemoteDataSource {
  Future<Either<Failures, MessageModel>> sendMessage({
    String? message,
    String? receiver,
    String? sender,
    String? messageID,
    String? isSender,
  });
}
