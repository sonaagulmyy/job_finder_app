import 'package:flutter/widgets.dart';
import 'package:job_finder/database/sqlquerylist.dart';
import 'package:job_finder/models/saved_job_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
      debugPrint("DB PATH: $dbPath ");

      final path = join(dbPath, filePath);
      debugPrint("FULL PATH: $path ");

      return await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          debugPrint("CREATING DB ");
          await db.execute(createSavedJobsTable);
          debugPrint("TABLE CREATED ");
        },
      );
    } catch (e) {
      debugPrint("DB ERROR : $e");
      rethrow;
    }
  }

  Future<List<SavedJobModel>> getSavedJobs() async {
    final db = await DatabaseHelper.instance.database;
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


  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
