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
import 'package:job_finder/l10n/app_localizations.dart';
import 'package:job_finder/models/job_model.dart';
import 'package:job_finder/notifications_page.dart';
import 'package:job_finder/providers/selected_region_provider.dart';
import 'package:job_finder/see_all_jobs_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<Job> filteredJobs = [];
  List<Job> allJobs = [];
  bool _isSearching = false;
  int selectedIndex = 0;
  String? selectedvalue = 'Ashgabat';

  @override
  void initState() {
    super.initState();
    DatabaseHelper.instance.database;
  }

  void filterJobs(String query) {
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
    var lang = AppLocalizations.of(context)!;
    List<String> jobs = [
      lang.all,
      lang.accountingAndFinance,
      lang.graphicDesign,
      lang.mediaDesignCreative,
      lang.salesAndMarketing,
      lang.programming,
      lang.writingAndContent,
      lang.tailor,
      lang.smmManager,
      lang.hairdresser,
      lang.driver,
    ];
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
                if (allJobs.isEmpty) {
                  allJobs = List.from(state.jobs);
                  filteredJobs = List.from(allJobs);
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
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text(
                                    "Location",
                                    style: TextStyle(
                                      fontFamily: AppFonts.primaryFont,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.location_pin,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      DropdownButtonHideUnderline(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          height: 40,

                                          // child: DropdownButton<String>(
                                          //   value: selectedvalue,
                                          //   dropdownColor: Colors.white,
                                          //   alignment: Alignment.centerLeft,

                                          //   icon: Icon(
                                          //     Icons.keyboard_arrow_down_sharp,
                                          //     color: Colors.white,
                                          //   ),
                                          //   selectedItemBuilder: (context) {
                                          //     return [
                                          //       lang.ashgabat,
                                          //       lang.balkan,
                                          //       lang.ahal,
                                          //       lang.mary,
                                          //       lang.dashoguz,
                                          //       lang.lebap,
                                          //     ].map((e) {
                                          //       return Align(
                                          //         alignment:
                                          //             Alignment.centerLeft,
                                          //         child: Text(
                                          //           e,
                                          //           style: TextStyle(
                                          //             color: Colors.white,
                                          //             fontFamily:
                                          //                 AppFonts.primaryFont,
                                          //             fontWeight:
                                          //                 FontWeight.bold,
                                          //             fontSize: 24,
                                          //           ),
                                          //         ),
                                          //       );
                                          //     }).toList();
                                          //   },

                                          //   items: [
                                          //     DropdownMenuItem(
                                          //       value: 'Ashgabat',
                                          //       child: Text(lang.ashgabat),
                                          //     ),
                                          //     DropdownMenuItem(
                                          //       value: 'Balkan',
                                          //       child: Text(lang.balkan),
                                          //     ),
                                          //     DropdownMenuItem(
                                          //       value: 'Ahal',
                                          //       child: Text(lang.ahal),
                                          //     ),
                                          //     DropdownMenuItem(
                                          //       value: 'Mary',
                                          //       child: Text(lang.mary),
                                          //     ),
                                          //     DropdownMenuItem(
                                          //       value: 'Dashoguz',
                                          //       child: Text(lang.dashoguz),
                                          //     ),
                                          //     DropdownMenuItem(
                                          //       value: 'Lebap',
                                          //       child: Text(lang.lebap),
                                          //     ),
                                          //   ],

                                          //   onChanged: (value) => setState(
                                          //     () => selectedvalue = value,
                                          //   ),
                                          // ),
                                          child: Consumer<SelectedRegionProvider>(
                                            builder: (context, regionprovider, child) {
                                              return DropdownButton<String>(
                                                value: regionprovider.selected,
                                                dropdownColor: Colors.white,
                                                alignment: Alignment.centerLeft,

                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_sharp,
                                                  color: Colors.white,
                                                ),
                                                selectedItemBuilder: (context) {
                                                  return [
                                                    lang.ashgabat,
                                                    lang.balkan,
                                                    lang.ahal,
                                                    lang.mary,
                                                    lang.dashoguz,
                                                    lang.lebap,
                                                  ].map((e) {
                                                    return Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        e,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: AppFonts
                                                              .primaryFont,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 24,
                                                        ),
                                                      ),
                                                    );
                                                  }).toList();
                                                },

                                                items: [
                                                  DropdownMenuItem(
                                                    value: 'Ashgabat',
                                                    child: Text(lang.ashgabat),
                                                  ),
                                                  DropdownMenuItem(
                                                    value: 'Balkan',
                                                    child: Text(lang.balkan),
                                                  ),
                                                  DropdownMenuItem(
                                                    value: 'Ahal',
                                                    child: Text(lang.ahal),
                                                  ),
                                                  DropdownMenuItem(
                                                    value: 'Mary',
                                                    child: Text(lang.mary),
                                                  ),
                                                  DropdownMenuItem(
                                                    value: 'Dashoguz',
                                                    child: Text(lang.dashoguz),
                                                  ),
                                                  DropdownMenuItem(
                                                    value: 'Lebap',
                                                    child: Text(lang.lebap),
                                                  ),
                                                ],
                                                onChanged: (value) {
                                                  if (value != null) {
                                                    regionprovider.setRegion(
                                                      value,
                                                    );
                                                  }
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 240,
                                        height: 50,
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 0,
                                        ),
                                        child: CupertinoSearchTextField(
                                          borderRadius: BorderRadius.circular(
                                            14,
                                          ),
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
                                            _isSearching = value
                                                .trim()
                                                .isNotEmpty;
                                            if (_isSearching) {
                                              filterJobs(value);
                                            } else {
                                              setState(() {
                                                filteredJobs = List.from(
                                                  allJobs,
                                                );
                                              });
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: Colors.white,
                                      ),
                                      child: Icon(
                                        Icons.tune_rounded,
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            Text(
                              lang.recommendations,
                              style: TextStyle(
                                fontFamily: AppFonts.primaryFont,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
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
                                lang.seeAll,
                                style: TextStyle(
                                  fontFamily: AppFonts.primaryFont,
                                  color: AppColors.buttonColor,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      if (_isSearching && filteredJobs.isEmpty)
                        Center(
                          child: Text(
                            lang.nothingFound,
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: AppFonts.primaryFont,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      else
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: filteredJobs
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
                              lang.recentJob,
                              style: TextStyle(
                                fontFamily: AppFonts.primaryFont,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
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
                                lang.seeAll,
                                style: TextStyle(
                                  fontFamily: AppFonts.primaryFont,
                                  color: AppColors.buttonColor,
                                  fontSize: 16,
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
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
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
                      if (_isSearching && filteredJobs.isEmpty)
                        Container(
                          height: 300,
                          alignment: Alignment.center,
                          child: Text(
                            lang.nothingFound,
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: AppFonts.primaryFont,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      else
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
                                  child: JobCard(
                                    job: job,
                                    logoColor: Colors.red,
                                  ),
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