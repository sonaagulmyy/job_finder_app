import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:job_finder/app_fonts.dart';
import 'package:job_finder/constants/app_colors.dart';
import 'package:job_finder/settings_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Account",
          style: TextStyle(fontSize: 30, fontFamily: AppFonts.poppinsBold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => SettingsPage()),
                );
              },
              child: Icon(IconlyLight.setting, size: 34),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(radius: 60.r, backgroundColor: Colors.grey[200]),
              SizedBox(height: 5.h),
              Column(
                children: [
                  Text(
                    "Viktor Kamov",
                    style: TextStyle(
                      fontFamily: AppFonts.poppinsBold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Developer | UI/UX designer",
                    style: TextStyle(fontFamily: AppFonts.primaryFont),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.grey.shade300),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "Open to work",
                          style: TextStyle(
                            fontFamily: AppFonts.primaryFont,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.grey.shade300),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Experience",
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: AppFonts.primaryFont,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "3 years",
                              style: TextStyle(
                                fontFamily: AppFonts.primaryFont,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.grey.shade300),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Price",
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: AppFonts.primaryFont,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "10K TMT",
                              style: TextStyle(
                                fontFamily: AppFonts.primaryFont,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "About",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: AppFonts.poppinsBold,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Hello! My name is Viktor, and I'm a Frontend developer with 3 years of experience in Mobile applications, I specialize in creating useful apps.And also I'm working with FIgma for designing UI/UX",
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: AppFonts.primaryFont,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 5.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("View all", style: TextStyle(color: Colors.blue))),
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  spacing: -14.w,
                  runSpacing: 8,
                  children: [
                    Chip(
                      label: Text("Developer"),
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: StadiumBorder(),
                    ),
                    Chip(
                      label: Text("UI/UX designer"),
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: StadiumBorder(),
                    ),
                    Chip(
                      label: Text("Figma"),
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: StadiumBorder(),
                    ),
                    Chip(
                      label: Text("Graphic designing"),
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: StadiumBorder(),
                    ),
                     Chip(
                      label: Text("Prototyping"),
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: StadiumBorder(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.only(),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                  ),
                  child: TabBar(
                    physics: BouncingScrollPhysics(),
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      border: Border.all(color: Colors.grey.shade200, width: 2),
                    ),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.black,
                    labelStyle: TextStyle(
                      fontFamily: AppFonts.primaryFont,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    tabs: [
                      Tab(
                        child: Text(
                          "Bio",
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontFamily: AppFonts.primaryFont,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Experience",
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontFamily: AppFonts.primaryFont,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 300.h,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Education:",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: AppFonts.poppinsBold,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: 5.h),
                                  _circleDot(),
                                  Container(
                                    width: 2,
                                    height: 65.h,
                                    color: AppColors.textColor,
                                  ),
                                  _circleDot(),
                                ],
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "University:",
                                      style: TextStyle(
                                        fontFamily: AppFonts.primaryFont,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      "St. Petersburg University of Information Technologies, Mechanics, and Optics",
                                      style: TextStyle(
                                        fontFamily: AppFonts.primaryFont,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                      softWrap: true,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Additional courses:",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: AppFonts.primaryFont,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 3),
                                        Text(
                                          "Visualizer designer",
                                          style: TextStyle(
                                            fontFamily: AppFonts.primaryFont,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "Skills:",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: AppFonts.poppinsBold,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(height: 7.h),
                                  _circleDot(),
                                  Container(
                                    height: 30.h,
                                    width: 2,
                                    color: AppColors.textColor,
                                  ),
                                  _circleDot(),
                                  Container(
                                    height: 30.h,
                                    width: 2,
                                    color: AppColors.textColor,
                                  ),
                                  _circleDot(),
                                ],
                              ),
                              SizedBox(width: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Teamwork",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: AppFonts.primaryFont,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 15.h),
                                  Text(
                                    "Time management",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: AppFonts.primaryFont,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 17.h),
                                  Text(
                                    "Attention to details",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: AppFonts.primaryFont,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Experience:",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: AppFonts.poppinsBold,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(height: 7.h),
                                  _circleDot(),
                                  Container(
                                    height: 60.h,
                                    width: 2,
                                    color: AppColors.textColor,
                                  ),
                                  _circleDot(),
                                  Container(
                                    height: 60.h,
                                    width: 2,
                                    color: AppColors.textColor,
                                  ),
                                  _circleDot(),
                                  Container(
                                    height: 60.h,
                                    width: 2,
                                    color: AppColors.textColor,
                                  ),
                                  _circleDot(),
                                ],
                              ),
                              SizedBox(width: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "2020-2021: ",
                                        style: TextStyle(
                                          fontFamily: AppFonts.primaryFont,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        "Freelance",
                                        style: TextStyle(
                                          fontFamily: AppFonts.primaryFont,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 40.h),
                                  Row(
                                    children: [
                                      Text(
                                        "2021-2022: ",
                                        style: TextStyle(
                                          fontFamily: AppFonts.primaryFont,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        "Milli san",
                                        style: TextStyle(
                                          fontFamily: AppFonts.primaryFont,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 40.h),
                                  Row(
                                    children: [
                                      Text(
                                        "2022-2024: ",
                                        style: TextStyle(
                                          fontFamily: AppFonts.primaryFont,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        "Turkmen Portal",
                                        style: TextStyle(
                                          fontFamily: AppFonts.primaryFont,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 40.h),
                                  Row(
                                    children: [
                                      Text(
                                        "2025- : ",
                                        style: TextStyle(
                                          fontFamily: AppFonts.primaryFont,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        "Milli san",
                                        style: TextStyle(
                                          fontFamily: AppFonts.primaryFont,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _circleDot() {
    return Container(
      width: 10,
      height: 10.h,
      decoration: BoxDecoration(
        color: AppColors.textColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
