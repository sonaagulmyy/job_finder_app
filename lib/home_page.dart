// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder/app_fonts.dart';
import 'package:job_finder/bloc/job_bloc/job_bloc.dart';
import 'package:job_finder/bloc/job_bloc/job_event.dart';
import 'package:job_finder/bloc/job_bloc/job_state.dart';
import 'package:job_finder/constants/app_colors.dart';
import 'package:job_finder/database/database_helper.dart';
import 'package:job_finder/job_card.dart';
import 'package:job_finder/job_card_skeleton.dart';
import 'package:job_finder/job_details.dart';
import 'package:job_finder/models/job_model.dart';
import 'package:job_finder/notifications_page.dart';
import 'package:job_finder/see_all_jobs_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<Job> filteredJobs = [];
  int selectedIndex = 0;
  List<String> jobs = [
    "All",
    "Accounting and Finance",
    "Graphic design",
    "Media,Design,Creative",
    "Sales and Marketing",
    "Programming",
    "Writing and Content",
    "Tailor",
    "SMM manager",
    "Hairdresser",
    "Driver",
  ];
  @override
  void initState() {
    super.initState();
    DatabaseHelper.instance.database;
  }

  void filterJobs(String query, List<Job> allJobs) {
    final filtered = allJobs.where((job) {
      final title = job.position.toLowerCase();
      final company = job.company.toLowerCase();
      final location = job.location.toLowerCase();
      final searchLower = query.toLowerCase();

      return title.contains(searchLower) ||
          company.contains(searchLower) ||
          location.contains(searchLower);
    }).toList();

    setState(() {
      filteredJobs = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: jobs.length,
      child: BlocProvider(
        create: (context) => JobBloc()..add(LoadJobs()),
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => NotificationsPage(),
                    ),
                  );
                },
                icon: Icon(CupertinoIcons.bell),
              ),
            ],
            automaticallyImplyLeading: false,
          ),
          body: BlocBuilder<JobBloc, JobState>(
            builder: (context, state) {
              if (state is JobLoading) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: JobCardSkeleton(width: 400),
                      ),
                      SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            5,
                            (index) => Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: JobCardSkeleton(width: 320),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: List.generate(
                          5,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: JobCardSkeleton(width: 400),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is JobLoaded) {
                if (filteredJobs.isEmpty) {
                  filteredJobs = state.jobs;
                }
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          height: 170,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: AppColors.appGradient,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 19,
                                  top: 19,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Welcome',
                                      style: TextStyle(
                                        fontFamily: AppFonts.primaryFont,
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Maria!",
                                      style: TextStyle(
                                        fontFamily: AppFonts.primaryFont,
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 7,
                                  right: 135,
                                ),
                                child: Text(
                                  "Let's find your dream job",
                                  style: TextStyle(
                                    fontFamily: AppFonts.primaryFont,
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 12,
                                  right: 12,
                                  top: 20,
                                ),
                                child: Container(
                                  width: 450,
                                  height: 50,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 0,
                                  ),
                                  child: CupertinoSearchTextField(
                                    borderRadius: BorderRadius.circular(20),
                                    backgroundColor: Colors.white,
                                    style: TextStyle(
                                      fontFamily: AppFonts.primaryFont,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 6,
                                      horizontal: 12,
                                    ),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(Icons.search),
                                    ),
                                    onChanged: (value) {
                                      filterJobs(value, state.jobs);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            Text(
                              "Recommendations",
                              style: TextStyle(
                                fontFamily: AppFonts.primaryFont,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(width: 130),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => BlocProvider(
                                        create: (context) =>
                                            JobBloc()..add(LoadJobs()),
                                        child: SeeAllJobsPage(),
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  "See all",
                                  style: TextStyle(
                                    fontFamily: AppFonts.primaryFont,
                                    color: AppColors.buttonColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: state.jobs
                              .take(5)
                              .map(
                                (job) => Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) =>
                                              JobDetails(job: job),
                                        ),
                                      );
                                    },
                                    child: JobCard(
                                      job: job,
                                      logoColor: Colors.red,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            Text(
                              "Recent job",
                              style: TextStyle(
                                fontFamily: AppFonts.primaryFont,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(width: 210),
                            Flexible(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => BlocProvider(
                                        create: (context) => JobBloc(),
                                        child: SeeAllJobsPage(),
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  "See all",
                                  style: TextStyle(
                                    fontFamily: AppFonts.primaryFont,
                                    color: AppColors.buttonColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: SizedBox(
                          height: 45,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: jobs.length,
                            itemBuilder: (context, index) {
                              final isSelected = selectedIndex == index;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.all(2),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    gradient: isSelected
                                        ? AppColors.appGradient
                                        : AppColors.transparentGradient,
                                    border: Border.all(
                                      color: isSelected
                                          ? Colors.transparent
                                          : AppColors.textColor,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Text(
                                    jobs[index],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: AppFonts.primaryFont,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: filteredJobs.length,
                          itemBuilder: (context, index) {
                            final job = filteredJobs[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) =>
                                          JobDetails(job: job),
                                    ),
                                  );
                                },
                                child: JobCard(job: job, logoColor: Colors.red),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is JobError) {
                return Center(child: Text(state.message));
              } else {
                return SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}







  // Text(
  //             "https://www.behance.net/gallery/235162381/Jobby-Job-Finder-App-UI?tracking_source=search_projects|job+finder+mobile+app&l=5",
  //           ),