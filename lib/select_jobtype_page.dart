// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/constants/app_colors.dart';
import 'package:job_finder/app_fonts.dart';
import 'package:job_finder/l10n/app_localizations.dart';
import 'package:job_finder/select_experience_page.dart';

class SelectJobtypePage extends StatefulWidget {
  const SelectJobtypePage({super.key});

  @override
  State<SelectJobtypePage> createState() => _SelectJobtypePageState();
}

class _SelectJobtypePageState extends State<SelectJobtypePage> {
  int? _selectedIndex;
  @override
  Widget build(BuildContext context) {
    var lang=AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          lang.selectJobType,
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
              lang.chooseYourJobType,
              style: TextStyle(fontSize: 24, fontFamily: AppFonts.poppinsBold),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Text(
              lang.chooseJobExplanation,
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
                      label: lang.findAjobForYou,
                      icon: CupertinoIcons.briefcase,
                      subTitle: lang.wannaFindjob,
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
                      label: lang.findAnEmployee,
                      icon: CupertinoIcons.person,
                      subTitle: lang.wannaFindEmployee,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.only(left: 70, right: 70,top: 40),
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
                  gradient: AppColors.appGradient
                ),
                child: Center(
                  child: Text(
                    lang.continuee,
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
    height: 160,
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
