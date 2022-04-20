import 'package:rabbitmq_flutter/core/helper/shared_preferences_helper.dart';
import 'package:rabbitmq_flutter/core/object_relational_mapping/object_entity.dart';
import 'package:rabbitmq_flutter/features/home/data/models/message_model.dart';

import '../models/list_message_model.dart';
import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'local_datasource.dart';

class LocalDataSourceImpl extends LocalDataSource {
  @override
  String get tableName => "messages";

  @override
  void ormBehaviorRelation() {}

  @override
  ObjectEntity responseToEntity(Map<String, dynamic>? map) {
    throw UnimplementedError();
  }

  @override
  ObjectEntity responseToListEntity(Map<String, dynamic>? map) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, List<ListMessageModel>>> getMessageFromLocal() async {
    SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();
    try {
      List<dynamic> listMessageModel = await query(
        where: "sender_id =? or receiver_id =?",
        whereArgs: [
          sharedPreferencesHelper.getUserID().toString(),
          sharedPreferencesHelper.getUserID().toString(),
        ],
      );
      return Right(listMessageModel.cast<ListMessageModel>());
    } catch (e) {
      return Left(ServerFailures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, int>> insertMessageToLocal(
      MessageModel message) async {
    SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();
    try {
      message.sender = sharedPreferencesHelper.getUserID().toString();
      message.senderName = sharedPreferencesHelper.getUserID().toString();
      var result = await insert(message as ObjectEntity);
      return Right(result);
    } catch (e) {
      return Left(ServerFailures(errorMessage: e.toString()));
    }
  }
}
