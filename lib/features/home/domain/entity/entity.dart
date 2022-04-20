import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final bool isSender;
  final String message;
  final String messageID;
  final String receiver;
  final String receiverName;
  final String sender;
  final String senderName;
  const MessageEntity({
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
