import 'package:job_finder/bloc/saved_jobs_bloc/saved_jobs_event.dart';

class DeleteSavedJobs extends SavedJobsEvent{
  final int id;
  DeleteSavedJobs({required this.id});
}
