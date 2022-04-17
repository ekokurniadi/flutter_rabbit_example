import '../base/migration_base.dart';
import 'package:sqflite_common/sqlite_api.dart';

class MigrationUsers extends MigrationBase {
  @override
  Future<void> import(Database database) async {
    await database.execute("CREATE TABLE users ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "name TEXT, "
        "email TEXT, "
        "password TEXT "
        ")");
  }
}
