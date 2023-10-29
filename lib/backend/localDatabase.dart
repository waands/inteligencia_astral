import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class LocalDatabaseHelper {
  static final _dbName = 'chatDatabase.db';
  static final _dbVersion = 1;
  static final _tableName = 'messages';

  static final columnId = 'id';
  static final columnRole = 'role';
  static final columnContent = 'content';
  static final columnDate = 'date';

  // Singleton class
  LocalDatabaseHelper._privateConstructor();
  static final LocalDatabaseHelper instance =
      LocalDatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = documentsDirectory.path + _dbName;
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        $columnId INTEGER PRIMARY KEY,
        $columnRole TEXT NOT NULL,
        $columnContent TEXT NOT NULL,
        $columnDate TEXT NOT NULL
      )
    ''');
  }

  // Insert a message
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_tableName, row);
  }

  // Retrieve all messages
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(_tableName);
  }
}
