import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder/app_fonts.dart';
import 'package:job_finder/bloc/saved_jobs_bloc/delete_saved_jobs_event.dart';
import 'package:job_finder/bloc/saved_jobs_bloc/saved_jobs_bloc.dart';
import 'package:job_finder/bloc/saved_jobs_bloc/saved_jobs_event.dart';
import 'package:job_finder/bloc/saved_jobs_bloc/saved_jobs_state.dart';
import 'package:job_finder/constants/app_colors.dart';
import 'package:job_finder/database/database_helper.dart';
import 'package:job_finder/l10n/app_localizations.dart';

class SavedJobs extends StatelessWidget {
  const SavedJobs({super.key});

  @override
  Widget build(BuildContext context) {
    var lang=AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) =>
          SavedJobsBloc(DatabaseHelper.instance)..add(LoadSavedJobs()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            lang.saved,
            style: TextStyle(
              fontFamily: AppFonts.primaryFont,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: BlocBuilder<SavedJobsBloc, SavedJobsState>(
          builder: (context, state) {
            if (state is SavedJobsLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is SavedJobsLoaded) {
              if (state.jobs.isEmpty) {
                return Center(child: Text(lang.noSavedJobs,style: TextStyle(fontFamily: AppFonts.primaryFont,fontSize: 20),));
              }
              return ListView.builder(
                itemCount: state.jobs.length,
                itemBuilder: (context, index) {
                  final job = state.jobs[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 10,
                      right: 10,
                    ),
                    child: Container(
                      width: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: Container(
                                height: 45,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Center(
                                  child: Text(
                                    "G",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: AppFonts.poppinsBold,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                              title: Text(
                                job.position,
                                style: TextStyle(
                                  fontFamily: AppFonts.poppinsBold,
                                  fontSize: 18,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(
                                job.company,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: AppFonts.primaryFont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              contentPadding: EdgeInsets.only(right: 0),
                              trailing: GestureDetector(
                                onTap: () async {
                                  context.read<SavedJobsBloc>().add(DeleteSavedJobs(id: job.id!));
                                },
                                child: Icon(
                                  CupertinoIcons.bookmark_fill,
                                  color: AppColors.textColor,
                                ),
                              ),
                            ),
                            Divider(thickness: 1.5),
                            Text(
                              job.location,
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 15,
                                fontFamily: AppFonts.primaryFont,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "\$${job.salaryMin}-\$${job.salaryMax}/month",
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 15,
                                fontFamily: AppFonts.primaryFont,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 20,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Full time",
                                      style: TextStyle(
                                        fontFamily: AppFonts.primaryFont,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Container(
                                  height: 20,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "On-site",
                                      style: TextStyle(
                                        fontFamily: AppFonts.primaryFont,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
