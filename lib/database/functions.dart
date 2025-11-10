import 'package:job_finder/database/database_helper.dart';
import 'package:job_finder/models/saved_job_model.dart';
import 'package:sqflite/sqflite.dart';

Future<int> insertJob(Map<String, dynamic> jobData) async {
  final db = await DatabaseHelper.instance.database;
  final id = await db.insert(
    'savedJobs',
    jobData,
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  return id; 
}



Future<void> deleteJob(String position) async {
  final db = await DatabaseHelper.instance.database;

  await db.delete(
    'savedJobs',
    where: 'position = ?',
    whereArgs: [position],
  );
}


Future<List<SavedJobModel>> getSavedJobs() async {
  final db = await DatabaseHelper.instance.database;
  final res = await db.query('savedJobs');
  return res.map((e) => SavedJobModel.fromMap(e)).toList();
}






