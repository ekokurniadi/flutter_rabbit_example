// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:rabbitmq_flutter/core/config/database/database_connection.dart';
import 'package:rabbitmq_flutter/core/helper/constant_helper.dart';
import 'package:rabbitmq_flutter/injection_container.dart';
import 'package:sqflite/sqflite.dart';

import 'object_entity.dart';

abstract class ORM<T extends ObjectEntity> {
  /// set table name for used on many repository
  String get tableName;

  ORM() {
    ormBehaviorRelation();
  }

  void ormBehaviorRelation();

  //default method that will convert raw response to data
  T responseToEntity(Map<String, dynamic>? map);

  //default method that will convert raw response to list data
  T responseToListEntity(Map<String, dynamic>? map);

  /// INFO : Basic Query Database
  /// Simple method to override the query
  Future<List<T>> query({
    String dbConnection = ConstantHelper.DATABASE,
    bool? distinct,
    List<String>? columns,
    String? where,
    List<dynamic>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    // get the database
    final Database db = await sl<DatabaseConnection>().database;

    // query the result
    List<Map<String, dynamic>> rawResults = await db.query(
      tableName,
      distinct: distinct,
      columns: columns,
      where: where,
      whereArgs: whereArgs,
      groupBy: groupBy,
      having: having,
      orderBy: orderBy,
      limit: limit,
      offset: offset,
    );

    /// temporarily result
    List<T> results = [];

    /// change result to the correct object

    rawResults.forEach((Map<String, dynamic> res) {
      results.add(responseToEntity(res));
    });

    return results;
  }

  /// Custom database batch actions
  ///
  /// [actions] are closure which have batch instance as parameter
  ///
  /// [exclusive], [noResult], and [continueOnError] (optional) are parameters to be passed to batch commit
  /// see https://pub.dartlang.org/documentation/sqflite/latest/sqflite/Batch/commit.html
  Future<List<dynamic>> batch(
    Function? Function(Batch batch) actions, {
    String dbConnection = ConstantHelper.DATABASE,
    bool? exclusive,
    bool? noResult,
    bool? continueOnError,
  }) async {
    // get the database
    final Database db = await sl<DatabaseConnection>().database;

    //
    Batch dbBatch = db.batch();

    actions(dbBatch);

    return await dbBatch.commit(
      exclusive: exclusive,
      noResult: noResult,
      continueOnError: continueOnError,
    );
  }

  /// Custom database update helper for sqflite.
  /// see https://pub.dartlang.org/documentation/sqflite/latest/sqflite/DatabaseExecutor/update.html
  Future<int> update(
    ObjectEntity entity, {
    String dbConnection = ConstantHelper.DATABASE,
    String primaryKey = 'id',
    ConflictAlgorithm? conflictAlgorithm,
  }) async {
    // get the database
    final Database db = await sl<DatabaseConnection>().database;

    Map<String, dynamic> entityMap = entity.objectToMap();

    // do the update
    return db.update(
      tableName,
      entityMap,
      where: '$primaryKey = ?',
      whereArgs: [entityMap[primaryKey]],
      conflictAlgorithm: conflictAlgorithm,
    );
  }

  /// Custom database insert helper for sqflite.
  /// see https://pub.dartlang.org/documentation/sqflite/latest/sqflite/DatabaseExecutor/insert.html
  Future<int> insert(ObjectEntity entity,
      {String dbConnection = ConstantHelper.DATABASE,
      String? nullColumnHack,
      ConflictAlgorithm? conflictAlgorithm}) async {
    final Database db = await sl<DatabaseConnection>().database;
    return await db.insert(tableName, entity.objectToMap());
  }

  /// Custom database delete helper for sqflite.
  /// see https://pub.dartlang.org/documentation/sqflite/latest/sqlite_api/DatabaseExecutor/delete.html
  Future<int> delete(String? id,
      {String primaryKey = 'id',
      String dbConnection = ConstantHelper.DATABASE}) async {
    final Database db = await sl<DatabaseConnection>().database;

    return await db
        .delete(tableName, where: '$primaryKey = ?', whereArgs: [id]);
  }

  Future<int> deleteWhere(String where, List<String?>? whereArgs,
      {String dbConnection = ConstantHelper.DATABASE}) async {
    final Database db = await sl<DatabaseConnection>().database;

    return await db.delete(tableName, where: where, whereArgs: whereArgs);
  }

  Future<T?> findOne(String? id, {String pkField = 'id'}) async {
    List<T> results = await query(where: '$pkField = ?', whereArgs: [id]);
    if (results.isEmpty) return results.first;

    return null;
  }

  Future<int> deleteAllRecords(
      {String dbConnection = ConstantHelper.DATABASE}) async {
    final Database db = await sl<DatabaseConnection>().database;

    return await db.rawDelete('DELETE FROM $tableName');
  }

  Future<List<T>> rawQuery(String query) async {
    final Database db = await sl<DatabaseConnection>().database;

    List<Map<String, dynamic>> rawResults = await db.rawQuery(query);

    /// temporarily result
    List<T> results = [];

    /// change result to the correct object
    rawResults.forEach((Map<String, dynamic> res) {
      results.add(responseToEntity(res));
    });

    return results;
  }

  Future<List<Map<String, dynamic>>> rawData(String query) async {
    final Database db = await sl<DatabaseConnection>().database;
    return await db.rawQuery(query);
  }
}
