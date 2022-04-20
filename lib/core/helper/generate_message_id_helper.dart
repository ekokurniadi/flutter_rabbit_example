import 'package:uuid/uuid.dart';

class GenerateMessageIDHelper {
  static String generateMessageID() {
    Uuid uuid = const Uuid();
    return uuid.v1();
  }
}
