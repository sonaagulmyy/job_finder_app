// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/app_fonts.dart';
import 'package:job_finder/constants/app_colors.dart';
import 'package:job_finder/job_card.dart';
import 'package:job_finder/notifications_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int selectedIndex = 0;
  int currentIndex = 0;
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
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: jobs.length,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => NotificationsPage()),
                );
              },
              icon: Icon(CupertinoIcons.bell),
            ),
          ],
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
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
                        padding: const EdgeInsets.only(left: 19, top: 19),
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
                        padding: const EdgeInsets.only(top: 7, right: 135),
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
                            style: TextStyle(fontFamily: AppFonts.primaryFont),
                            padding: EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 12,
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(4),
                              child: Icon(Icons.search),
                            ),
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
                    SizedBox(width: 150),
                    Text(
                      "See all",
                      style: TextStyle(
                        fontFamily: AppFonts.primaryFont,
                        color: AppColors.buttonColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: JobCard(
                        height: 45,
                        logo: "G",
                        logoColor: Colors.red,
                        firstPrice: 100.00,
                        company: "Google Llc",
                        job: "UI & UX designer",
                        width: 50,
                        secondPrice: 250.00,
                      ),
                    ),
                    JobCard(
                      height: 45,
                      logo: "G",
                      logoColor: Colors.red,
                      firstPrice: 100.00,
                      company: "Google Llc",
                      job: "UI & UX designer",
                      width: 50,
                      secondPrice: 250.00,
                    ),
                    JobCard(
                      height: 45,
                      logo: "G",
                      logoColor: Colors.red,
                      firstPrice: 100.00,
                      company: "Google Llc",
                      job: "UI & UX designer",
                      width: 50,
                      secondPrice: 250.00,
                    ),
                  ],
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
                    SizedBox(width: 230),
                    Text(
                      "See all",
                      style: TextStyle(
                        fontFamily: AppFonts.primaryFont,
                        color: AppColors.buttonColor,
                        fontSize: 16,
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
                              color: isSelected ? Colors.white : Colors.black,
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
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
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
                                "F",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: AppFonts.poppinsBold,
                                  color: AppColors.buttonColor,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            "HR manager",
                            style: TextStyle(
                              fontFamily: AppFonts.poppinsBold,
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Text(
                            "Meta Llc",
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: AppFonts.primaryFont,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          contentPadding: EdgeInsets.only(right: 0),
                          trailing: Icon(
                            CupertinoIcons.bookmark,
                            color: AppColors.textColor,
                          ),
                        ),
                        Divider(thickness: 1.5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'California,US',
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: AppFonts.primaryFont,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "\$100.00-\$250.00/ month",
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
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
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
                                "T",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: AppFonts.poppinsBold,
                                  color: AppColors.textColor,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            "Content creator",
                            style: TextStyle(
                              fontFamily: AppFonts.poppinsBold,
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Text(
                            "Twitter Llc",
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: AppFonts.primaryFont,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          contentPadding: EdgeInsets.only(right: 0),
                          trailing: Icon(
                            CupertinoIcons.bookmark,
                            color: AppColors.textColor,
                          ),
                        ),
                        Divider(thickness: 1.5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Chicago,US',
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: AppFonts.primaryFont,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "\$90.00-\$250.00/ month",
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
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
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
                            "UI & UX Designer",
                            style: TextStyle(
                              fontFamily: AppFonts.poppinsBold,
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Text(
                            "Google Llc",
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: AppFonts.primaryFont,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          contentPadding: EdgeInsets.only(right: 0),
                          trailing: Icon(
                            CupertinoIcons.bookmark,
                            color: AppColors.textColor,
                          ),
                        ),
                        Divider(thickness: 1.5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'California,US',
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: AppFonts.primaryFont,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "\$100.00-\$250.00/ month",
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          selectedItemColor: AppColors.buttonColor,
          selectedLabelStyle: TextStyle(fontSize: 15),
          unselectedLabelStyle: TextStyle(fontSize: 12),
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bookmark),
              label: "Saved",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}







  // Text(
  //             "https://www.behance.net/gallery/235162381/Jobby-Job-Finder-App-UI?tracking_source=search_projects|job+finder+mobile+app&l=5",
  //           ),