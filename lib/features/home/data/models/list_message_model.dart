import 'package:rabbitmq_flutter/features/home/domain/entity/list_message_entity.dart';

import 'message_model.dart';

class ListMessageModel extends ListMessageEntity {
  const ListMessageModel({
    required bool isSender,
    required List<MessageModel> message,
    required String messageID,
    required String receiver,
    required String receiverName,
    required String sender,
    required String senderName,
  }) : super(
          isSender: isSender,
          message: message,
          messageID: messageID,
          receiver: receiver,
          receiverName: receiverName,
          sender: sender,
          senderName: senderName,
        );

  factory ListMessageModel.fromJSON(Map<String, dynamic> json) {
    return ListMessageModel(
      isSender: json['is_sender'],
      message: json['message'],
      messageID: json['message_id'],
      receiver: json['receiver'],
      sender: json['sender_id'],
      senderName: json['sender_name'],
      receiverName: json['receiver_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'is_sender': isSender,
      'message': message,
      'message_id': messageID,
      'receiver': receiver,
      'sender_id': sender,
      'sender_name': senderName,
      'receiver_name': receiverName,
    };
  }
}
