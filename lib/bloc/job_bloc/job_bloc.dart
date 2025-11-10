import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'job_event.dart';
import 'job_state.dart';
import '../../models/job_model.dart';

class JobBloc extends Bloc<JobEvent, JobState> {
  JobBloc() : super(JobInitial()) {
    on<LoadJobs>(_onLoadJobs);
  }

  Future<void> _onLoadJobs(LoadJobs event, Emitter<JobState> emit) async {
    emit(JobLoading());
    try {
      final response = await http.get(Uri.parse('https://remoteok.com/api'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<Job> jobs = data.skip(1).map((e) => Job.fromJson(e)).toList();
        emit(JobLoaded(jobs));
      } else {
        emit(JobError('Failed to load jobs (code: ${response.statusCode})'));
      }
    } catch (e) {
      emit(JobError('Error: $e'));
    }
  }
}
