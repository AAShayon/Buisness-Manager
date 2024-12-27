import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:convert';

class DynamicSQLiteService {
  static final DynamicSQLiteService _instance = DynamicSQLiteService._internal();
  Database? _database;

  DynamicSQLiteService._internal();

  factory DynamicSQLiteService() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'dynamic_features.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Single table for all models
        await db.execute('''
          CREATE TABLE IF NOT EXISTS feature_data (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            feature_name TEXT NOT NULL,
            data TEXT NOT NULL,
            is_synced INTEGER DEFAULT 0
          )
        ''');
      },
    );
  }

  /// Insert Data
  Future<int> insert(String featureName, Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert(
      'feature_data',
      {
        'feature_name': featureName,
        'data': json.encode(data),
        'is_synced': 0,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Fetch Data
  Future<List<Map<String, dynamic>>> fetch(String featureName) async {
    final db = await database;
    final result = await db.query(
      'feature_data',
      where: 'feature_name = ?',
      whereArgs: [featureName],
    );
    return result.map<Map<String, dynamic>>((item) {
      return {
        ...Map<String, dynamic>.from(json.decode(item['data'] as String)),
        'id': item['id'] as int,
        'is_synced': item['is_synced'] as int,
      };
    }).toList();
  }

  /// Update Data
  Future<int> update(int id, Map<String, dynamic> data) async {
    final db = await database;
    return await db.update(
      'feature_data',
      {'data': json.encode(data)},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Delete Data
  Future<int> delete(int id) async {
    final db = await database;
    return await db.delete(
      'feature_data',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Update Sync Status
  Future<int> updateSyncStatus(int id, int status) async {
    final db = await database;
    return await db.update(
      'feature_data',
      {'is_synced': status},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
