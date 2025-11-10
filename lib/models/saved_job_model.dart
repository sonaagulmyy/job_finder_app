import 'package:job_finder/models/job_model.dart';

class SavedJobModel {
  final int? id;
  final String position;
  final String location;
  final String company;
  final int salaryMin;
  final int salaryMax;

  SavedJobModel({
    this.id,
    required this.position,
    required this.location,
    required this.company,
    required this.salaryMin,
    required this.salaryMax,
  });

  factory SavedJobModel.fromMap(Map<String, dynamic> map) {
    return SavedJobModel(
      id: map['id'],
      position: map['position'],
      location: map['location'],
      company: map['company'],
      salaryMin: map['salaryMin'],
      salaryMax: map['salaryMax'],
    );
  }
    factory SavedJobModel.fromJob(Job job) {
    return SavedJobModel(
      position: job.position,
      company: job.company,
      location: job.location,
      salaryMin: job.salaryMin!,
      salaryMax: job.salaryMax!,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'position': position,
      'location': location,
      'company': company,
      'salaryMin': salaryMin,
      'salaryMax': salaryMax,
    };
  }
}
