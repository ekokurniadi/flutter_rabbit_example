import 'package:dio/dio.dart';
import 'package:rabbitmq_flutter/core/helper/constant_helper.dart';
import 'package:rabbitmq_flutter/core/helper/dio_helper.dart';
import 'package:rabbitmq_flutter/features/home/data/models/message_model.dart';
import 'package:rabbitmq_flutter/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:rabbitmq_flutter/features/home/data/resources/remote_datasource.dart';

class RemoteDataSourceImpl extends RemoteDataSource {
  @override
  Future<Either<Failures, MessageModel>> sendMessage({
    String? message,
    String? receiver,
    String? sender,
    String? messageID,
    String? isSender,
  }) async {
    MessageModel messageModel;

    try {
      Response response = await DioHelper.dio!
          .post(ConstantHelper.BASE_URL + "/send_message", data: {
        "message": message,
        "receiver": receiver,
        "sender": sender,
        "messageID": messageID,
        "isSender": isSender
      });
      messageModel = MessageModel.fromJSON(response.data["data"]);
      return Right(messageModel);
    } on DioError catch (e) {
      return Left(ServerFailures(errorMessage: e.message));
    }
  }
}
