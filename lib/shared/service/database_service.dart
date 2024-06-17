import 'dart:convert';

import 'package:logger/logger.dart';
import'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter()
);

class DatabaseService {

  static Database? _db;
  static DatabaseService instance = DatabaseService._constructor();

  DatabaseService._constructor();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  String databaseBlueprint = '''

  CREATE TABLE user (

  )

  CREATE TABLE token (
    accessToken TEXT NOT NULL,
    refreshToken TEXT NOT NULL,
  )
  
  ''';
  
  Future<Database> getDatabase() async {
    final databaseDir = await getDatabasesPath();
    final databasePath = path.join(databaseDir, "db_local.db");
    
    final database = await openDatabase(
      databasePath,
      onCreate: (db, version) {
        db.execute(
          '''
          CREATE TABLE user (
            id INTEGER PRIMARY KEY,
            email TEXT NOT NULL,
            password TEXT NOT NULL,
            username TEXT NOT NULL,
          )
          '''
        );
      }
    );

    return database;
  }

  void addClaims(String claims) async {
    // final db = await database;

    Map<String, dynamic> json = jsonDecode(claims);
    logger.log(Level.trace, "db insert");
    // logger.i(json);

    int userId = json['user']['id'];
    String firstName = json['user']['firstName'];
    // String lastName = json['user']['lastName'];
    String email = json['user']['email'];
    // String password = json['user']['password'];
    // String role = json['user']['role'];
    String accessToken = json['tokens']['accessToken'];
    String refreshToken = json['tokens']['refreshToken'];

    print('$userId, $firstName, $email, $accessToken, $refreshToken');

    // await db.insert('user', obj);
  }

  Future<void> saveUser(String username, String email) async {

    
  }

}