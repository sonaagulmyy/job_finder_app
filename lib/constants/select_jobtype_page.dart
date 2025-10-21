// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/constants/app_colors.dart';
import 'package:job_finder/constants/app_fonts.dart';
import 'package:job_finder/constants/select_experience_page.dart';

class SelectJobtypePage extends StatefulWidget {
  const SelectJobtypePage({super.key});

  @override
  State<SelectJobtypePage> createState() => _SelectJobtypePageState();
}

class _SelectJobtypePageState extends State<SelectJobtypePage> {
  int? _selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Select job type",
          style: TextStyle(
            fontFamily: AppFonts.primaryFont,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200, right: 15),
            child: Text(
              'Choose your job type',
              style: TextStyle(fontSize: 24, fontFamily: AppFonts.poppinsBold),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Text(
              'Choose whether you are looking for a job or you are company needs employee',
              style: TextStyle(fontFamily: AppFonts.primaryFont, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                    child: _buildSelectableBox(
                      isSelected: _selectedIndex == 0,
                      label: "Find a job for you",
                      icon: CupertinoIcons.briefcase,
                      subTitle: "I want to find a job for me",
                    ),
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                    child: _buildSelectableBox(
                      isSelected: _selectedIndex == 1,
                      label: "Find an employee",
                      icon: CupertinoIcons.person,
                      subTitle: "I want to find an employee",
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 240),
          Padding(
            padding: EdgeInsetsGeometry.only(left: 18, right: 18),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => SelectExperiencePage(),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.buttonColor,
                ),
                child: Center(
                  child: Text(
                    "continue",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: AppFonts.primaryFont,
                    ),
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

Widget _buildSelectableBox({
  required bool isSelected,
  required String label,
  required IconData icon,
  required String subTitle,
}) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 200),
    height: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18),
      border: Border.all(
        color: isSelected
            ? AppColors.buttonColor
            : AppColors.backgroundColor.withOpacity(0.5),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: AppColors.textColor),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(fontFamily: AppFonts.poppinsBold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5),
        Text(
          subTitle,
          style: TextStyle(
            fontFamily: AppFonts.primaryFont,
            color: Colors.grey,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
