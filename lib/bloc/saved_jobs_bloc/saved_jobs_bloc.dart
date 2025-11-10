import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder/bloc/saved_jobs_bloc/delete_saved_jobs_event.dart';
import 'package:job_finder/bloc/saved_jobs_bloc/saved_jobs_event.dart';
import 'package:job_finder/bloc/saved_jobs_bloc/saved_jobs_state.dart';
import 'package:job_finder/database/database_helper.dart';

class SavedJobsBloc extends Bloc<SavedJobsEvent, SavedJobsState> {
  final DatabaseHelper dbHelper;

  SavedJobsBloc(this.dbHelper) : super(SavedJobsLoading()) {
    on<LoadSavedJobs>((event, emit) async {
      emit(SavedJobsLoading());

      final jobs = await dbHelper.getSavedJobs();
      emit(SavedJobsLoaded(jobs: jobs));
    });

    on<DeleteSavedJobs>((event, emit) async{
      await dbHelper.deleteSavedJobs(event.id);
      final jobs=await dbHelper.getSavedJobs();
      emit (SavedJobsLoaded(jobs: jobs));
    },);
  }
}
