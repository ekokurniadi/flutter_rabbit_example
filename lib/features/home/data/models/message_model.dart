import 'package:rabbitmq_flutter/features/home/domain/entity.dart';

class MessageModel extends MessageEntity {
  const MessageModel({required bool isSender, required String message})
      : super(isSender: isSender, message: message);

  factory MessageModel.fromJSON(Map<String, dynamic> json) {
    return MessageModel(
      isSender: json['is_sender'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "is_sender": isSender,
      "message": message,
    };
  }
}
