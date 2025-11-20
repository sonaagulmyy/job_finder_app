import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:job_finder/database/sqlquerylist.dart';
import 'package:job_finder/models/saved_job_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('job_finder.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    try {
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, filePath);

      debugPrint("DB PATH: $path");

      return await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          debugPrint("CREATING TABLES...");
          await db.execute(createSavedJobsTable);
          await db.execute(createUsersTable);
          debugPrint("TABLES CREATED");
        },
      );

    } catch (e) {
      debugPrint("DB ERROR: $e");
      rethrow;
    }
  }

  Future<List<SavedJobModel>> getSavedJobs() async {
    final db = await database;
    final res = await db.query('savedJobs');
    return res.map((e) => SavedJobModel.fromMap(e)).toList();
  }

  Future<int> deleteSavedJobs(int id) async {
    final db = await database;
    return await db.delete('savedJobs', where: 'id=?', whereArgs: [id]);
  }

  Future<bool> isJobSaved(String jobId) async {
    final db = await database;

    final result = await db.query(
      'savedJobs',
      where: 'id = ?',      
      whereArgs: [jobId],
    );

    return result.isNotEmpty;
  }

  static Future<int> insertUser(String phone, String hash) async {
    final db = await instance.database;

    return await db.insert('users', {
      'phone': phone,
      'passwordHash': hash,
    });
  }

  static Future<Map<String, dynamic>?> getUser(String phone) async {
    final db = await instance.database;

    final result = await db.query(
      'users',
      where: 'phone = ?',
      whereArgs: [phone],
    );

    if (result.isNotEmpty) return result.first;

    return null;
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
