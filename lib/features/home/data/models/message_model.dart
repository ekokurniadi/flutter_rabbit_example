import '../../domain/entity/entity.dart';

class MessageModel extends MessageEntity {
  const MessageModel({
    required bool isSender,
    required String message,
    required String messageID,
    required String receiver,
    required String sender,
    required String senderName,
    required String receiverName,
  }) : super(
          isSender: isSender,
          message: message,
          messageID: messageID,
          receiver: receiver,
          sender: sender,
          senderName: senderName,
          receiverName: receiverName,
        );

  factory MessageModel.fromJSON(Map<String, dynamic> json) {
    return MessageModel(
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
