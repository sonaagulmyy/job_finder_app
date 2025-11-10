import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/constants/app_colors.dart';
import 'package:job_finder/home_page.dart';
import 'package:job_finder/profile_page.dart';
import 'package:job_finder/saved_jobs.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex=0;

  List<Widget>pages=[
    HomePage(),
    SavedJobs(),
    ProfilePage()
  ];

  void onItemTapped(int index){
  setState(() {
    selectedIndex=index;
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
       bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
            landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
            selectedItemColor: AppColors.textColor,
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
    );
  }
}