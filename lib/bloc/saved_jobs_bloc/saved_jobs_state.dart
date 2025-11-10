import 'package:job_finder/models/saved_job_model.dart';

abstract class SavedJobsState {}

class SavedJobsLoading extends SavedJobsState {}

class SavedJobsLoaded extends SavedJobsState {
 final  List<SavedJobModel> jobs;

  SavedJobsLoaded({required this.jobs});
}
