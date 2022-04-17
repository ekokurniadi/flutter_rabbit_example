// ignore_for_file: avoid_print

import 'package:path/path.dart';
import 'package:rabbitmq_flutter/core/migrations/base/migration_base.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection {
  final String dbName;
  final List<MigrationBase> migrations;

  Database? _database;

  DatabaseConnection(this.dbName, this.migrations);

  Future<Database> get database async {
    if (_database == null) {
      String databasePath = await getDatabasesPath();
      String path = join(databasePath, dbName);

      _database = await openDatabase(
        path,
        version: migrations.length,
        onUpgrade: (Database db, int oldVersion, int newVersion) async {
          print(oldVersion.toString() + ' to ' + newVersion.toString());
          for (int i = oldVersion; i < newVersion; i++) {
            print(
              i.toString() + migrations[i].toString() + ' ON MIGRATION PROCESS',
            );
            await migrations[i].import(db);
          }
        },
      );
    }

    return _database!;
  }
}
