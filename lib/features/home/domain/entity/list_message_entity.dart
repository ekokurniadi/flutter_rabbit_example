import 'package:equatable/equatable.dart';
import 'package:rabbitmq_flutter/features/home/data/models/message_model.dart';

class ListMessageEntity extends Equatable {
  final bool isSender;
  final List<MessageModel> message;
  final String messageID;
  final String receiver;
  final String receiverName;
  final String sender;
  final String senderName;
  const ListMessageEntity({
    required this.isSender,
    required this.message,
    required this.messageID,
    required this.receiver,
    required this.receiverName,
    required this.sender,
    required this.senderName,
  });
  @override
  List<Object?> get props => [
        isSender,
        message,
        messageID,
        receiver,
        sender,
        senderName,
        receiverName
      ];
}
