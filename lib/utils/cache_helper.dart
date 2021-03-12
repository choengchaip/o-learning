// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class IUserCache {
  final int id;
  final String email;
  final String access_token;

  IUserCache({
    @required this.id,
    @required this.email,
    @required this.access_token,
  });

  factory IUserCache.fromJson(Map<String, dynamic> rawJson) {
    return IUserCache(
      id: rawJson['id'],
      email: rawJson['email'],
      access_token: rawJson['access_token'],
    );
  }
}

class CacheHelper {
  Database database;
  String userDB = 'User';

  Future initial() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'cache.db');

    this.database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await this.userInitial(db);
    });
  }

  Future userInitial(Database db) async {
    await db.execute(
        'CREATE TABLE $userDB (id INTEGER PRIMARY KEY, email TEXT, access_token TEXT)');
  }

  Future<IUserCache> getUser() async {
    List<Map> list =
        await database.rawQuery('SELECT * FROM $userDB WHERE id = 1');
    if (list.length == 0) {
      return null;
    }

    return IUserCache.fromJson(list[0]);
  }

  Future setUser(String emailData, String accessTokenData) async {
    IUserCache user = await this.getUser();
    String email = emailData == '' ? 'No email' : emailData;
    String accessToken = accessTokenData == '' ? 'No token' : accessTokenData;

    if (user == null) {
      await database.transaction((txn) async {
        await txn.rawInsert(
            'INSERT INTO $userDB(id, email, access_token) VALUES(1, "$email", $accessToken)');
      });
    } else {
      await database.rawUpdate(
          'UPDATE $userDB SET email = ?, access_token = ? WHERE id = 1',
          ['$email', '$accessToken']);
    }
  }

  Future removeUser() async {
    await database.rawDelete('DELETE FROM $userDB WHERE id = ?', [1]);
  }
}
