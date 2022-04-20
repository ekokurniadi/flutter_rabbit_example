import '../base/migration_base.dart';
import 'package:sqflite_common/sqlite_api.dart';

class MigrationMessages extends MigrationBase {
  @override
  Future<void> import(Database database) async {
    await database.execute("CREATE TABLE messages ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "message_id TEXT, "
        "sender_id TEXT, "
        "sender_name TEXT, "
        "receiver_id TEXT, "
        "receiver_name TEXT, "
        "time TEXT, "
        ")");
  }
}
