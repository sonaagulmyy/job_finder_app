// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/app_fonts.dart';
import 'package:job_finder/bloc/saved_jobs_bloc/delete_saved_jobs_event.dart';
import 'package:job_finder/bloc/saved_jobs_bloc/saved_jobs_bloc.dart';
import 'package:job_finder/constants/app_colors.dart';
import 'package:job_finder/database/database_helper.dart';
import 'package:job_finder/database/functions.dart';
import 'package:job_finder/models/job_model.dart';
import 'package:provider/provider.dart';

class JobCard extends StatefulWidget {
  final Job job;
  final Color logoColor;
  const JobCard({super.key, required this.logoColor, required this.job});

  @override
  State<JobCard> createState() => _JobCardState();
  final bool isAdded = false;
}

class _JobCardState extends State<JobCard> {
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
    return Container(
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
                      color: widget.logoColor,
                    ),
                  ),
                ),
              ),
              title: Text(
                widget.job.position,
                style: TextStyle(
                  fontFamily: AppFonts.poppinsBold,
                  fontSize: 18,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                widget.job.company,
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
                  if (isSaved) {
                    context.read<SavedJobsBloc>().add(
                      DeleteSavedJobs(id: int.parse(widget.job.id)),
                    );
                    setState(() => isSaved = false);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Removed from saved")),
                    );
                  } else {
                    await insertJob(widget.job.toMap());
                    setState(() => isSaved = true);
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Job saved")));
                  }
                },
                child: Icon(
                  isSaved
                      ? CupertinoIcons.bookmark_fill
                      : CupertinoIcons.bookmark,
                  color: isSaved ? Colors.blue : AppColors.textColor,
                ),
              ),
            ),
            Divider(thickness: 1.5),
            Text(
              widget.job.location,
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 15,
                fontFamily: AppFonts.primaryFont,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "\$${widget.job.salaryMin}-\$${widget.job.salaryMax}/month",
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
    );
  }
}
