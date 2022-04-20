import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class MessageEntity extends Equatable {
  final bool isSender;
  final String message;
  final String messageID;
  final String receiver;
  final String receiverName;
  String sender;
  String senderName;
  MessageEntity({
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
