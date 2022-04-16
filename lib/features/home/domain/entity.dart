import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final bool isSender;
  final String message;
  const MessageEntity({
    required this.isSender,
    required this.message,
  });
  @override
  List<Object?> get props => [isSender, message];
}
