import 'package:dartz/dartz.dart';
import 'package:rabbitmq_flutter/core/error/failures.dart';
import 'package:rabbitmq_flutter/core/object_relational_mapping/query_builder.dart';
import 'package:rabbitmq_flutter/features/home/data/models/list_message_model.dart';
import 'package:rabbitmq_flutter/features/home/data/models/message_model.dart';

abstract class LocalDataSource extends QueryBuilder {
  Future<Either<Failures, List<ListMessageModel>>> getMessageFromLocal();
  Future<Either<Failures, int>> insertMessageToLocal(MessageModel message);
}
