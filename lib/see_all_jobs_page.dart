import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder/app_fonts.dart';
import 'package:job_finder/bloc/job_bloc.dart';
import 'package:job_finder/bloc/job_event.dart';
import 'package:job_finder/bloc/job_state.dart';
import 'package:job_finder/constants/app_colors.dart';
import 'package:job_finder/job_card.dart';
import 'package:job_finder/models/job_model.dart';

class SeeAllJobsPage extends StatefulWidget {
  const SeeAllJobsPage({super.key});

  @override
  State<SeeAllJobsPage> createState() => _SeeAllJobsPageState();
}

class _SeeAllJobsPageState extends State<SeeAllJobsPage> {
  List<Job> filterJobs = [];

  void filtereJobs(String query, List<Job> allJobs) {
    final filtered = allJobs.where((job) {
      final title = job.position.toLowerCase();
      final company = job.company.toLowerCase();
      final location = job.location.toLowerCase();
      String searchLower = query.toLowerCase();

      return title.contains(searchLower) ||
          company.contains(searchLower) ||
          location.contains(searchLower);
    }).toList();

    setState(() {
      filterJobs = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobBloc()..add(LoadJobs()),
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(Icons.arrow_back, color: AppColors.textColor),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: CupertinoSearchTextField(
            onChanged: (value) {
              final jobs = context.read<JobBloc>().state;
              if (jobs is JobLoaded) {
                filtereJobs(value, jobs.jobs);
              }
            },
          ),
        ),
        body: BlocBuilder<JobBloc, JobState>(
          builder: (context, state) {
            if (state is JobLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is JobLoaded) {
              if (filterJobs.isEmpty && filterJobs != state.jobs) {
                filterJobs = List.from(state.jobs);
              }

              if (filterJobs.isEmpty) {
                return Center(child: Text("Nothing found"));
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text(
                          filterJobs.length.toString(),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontFamily: AppFonts.primaryFont,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          " Found",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppFonts.primaryFont,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filterJobs.length,
                      itemBuilder: (context, index) {
                        final job = filterJobs[index];
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: 10,
                            left: 10,
                            right: 10,
                          ),
                          child: JobCard(jobdata: job, logoColor: Colors.red),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (state is JobError) {
              return Center(child: Text(state.message));
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
