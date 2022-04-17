import 'package:sqflite/sqflite.dart';

abstract class MigrationBase {
  Future<void> import(Database database);
}
