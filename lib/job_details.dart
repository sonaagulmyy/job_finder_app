// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/app_fonts.dart';
import 'package:job_finder/bloc/saved_jobs_bloc/delete_saved_jobs_event.dart';
import 'package:job_finder/bloc/saved_jobs_bloc/saved_jobs_bloc.dart';
import 'package:job_finder/constants/app_colors.dart';
import 'package:job_finder/database/database_helper.dart';
import 'package:job_finder/database/functions.dart';
import 'package:job_finder/l10n/app_localizations.dart';
import 'package:job_finder/models/job_model.dart';
import 'package:provider/provider.dart';

class JobDetails extends StatefulWidget {
  final Job job;
  const JobDetails({super.key, required this.job});

  @override
  State<JobDetails> createState() => _JobDetailsState();
  final bool isAdded = false;
}

class _JobDetailsState extends State<JobDetails> {
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    checkIfSaved();
  }

  void checkIfSaved() async {
    bool saved = await DatabaseHelper.instance.isJobSaved(widget.job.id);

    setState(() {
      isSaved = saved;
    });
  }

  void toggleSave() async {
    if (isSaved) {
      await deleteJob(widget.job.id);
    } else {
      await insertJob(widget.job.toMap());
    }
    setState(() {
      isSaved = !isSaved;
    });
  }

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () async {
                if (isSaved) {
                  context.read<SavedJobsBloc>().add(
                    DeleteSavedJobs(id: int.parse(widget.job.id)),
                  );
                  setState(() {
                    isSaved = false;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppColors.backgroundColor.withOpacity(
                          0.5,
                        ),
                        content: Text(lang.removedFromSaved),
                      ),
                    );
                  });
                } else {
                  await insertJob(widget.job.toMap());
                  setState(() {
                    isSaved = true;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppColors.backgroundColor.withOpacity(
                          0.5,
                        ),
                        content: Text(lang.jobSaved),
                      ),
                    );
                  });
                }
              },
              child: Icon(
                isSaved
                    ? CupertinoIcons.bookmark_fill
                    : CupertinoIcons.bookmark,
                color: isSaved ? Colors.blue : AppColors.textColor,
                size: 22,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
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
                            SizedBox(height: 10),
                            Text(
                              widget.job.position,
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: AppFonts.poppinsBold,
                              ),
                            ),
                            Text(
                              widget.job.company,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                                fontFamily: AppFonts.primaryFont,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10, left: 10),
                              child: Divider(thickness: 1.5),
                            ),
                            Text(
                              widget.job.location,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: AppFonts.primaryFont,
                                color: Colors.grey,
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              "\$${widget.job.salaryMin}-\$${widget.job.salaryMax} / months",
                              style: TextStyle(
                                fontSize: 17,
                                color: AppColors.textColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppFonts.primaryFont,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 30,
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
                                  height: 30,
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
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Posted ",
                                  style: TextStyle(
                                    fontFamily: AppFonts.primaryFont,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  widget.job.date.split('T').first,
                                  style: TextStyle(
                                    fontFamily: AppFonts.primaryFont,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.all(10),
                    child: Text(
                      "Description",
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 24,
                        fontFamily: AppFonts.poppinsBold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: Text(
                      widget.job.description,
                      style: TextStyle(
                        fontFamily: AppFonts.primaryFont,
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      maxLines: 15,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: AppColors.appGradient,
              ),
              child: Center(
                child: Text(
                  "Apply",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: AppFonts.primaryFont,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
