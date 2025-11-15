import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/constants/app_colors.dart';
import 'package:job_finder/app_fonts.dart';
import 'package:job_finder/fill_profile_info_page.dart';
import 'package:job_finder/l10n/app_localizations.dart';

class SelectExperiencePage extends StatefulWidget {
  const SelectExperiencePage({super.key});

  @override
  State<SelectExperiencePage> createState() => _SelectExperiencePageState();
}

class _SelectExperiencePageState extends State<SelectExperiencePage> {
  List<String> jobs = [
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
  List<String> selectedJobs = [];
  @override
  Widget build(BuildContext context) {
    var lang=AppLocalizations.of(context)!;
     List<String> jobs = [
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          lang.selectYourExperience,
          style: TextStyle(
            fontFamily: AppFonts.primaryFont,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              itemCount: jobs.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final job = jobs[index];
                final isSelected = selectedJobs.contains(job);
                return CheckboxListTile(
                  title: Text(
                    job,
                    style: TextStyle(fontFamily: AppFonts.primaryFont),
                  ),
                  value: isSelected,
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
                        selectedJobs.add(job);
                      } else {
                        selectedJobs.remove(job);
                      }
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: AppColors.buttonColor,
                );
              },
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(left: 70, right: 70,top: 40),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => FillProfileInfoPage(),
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
      ),
    );
  }
}
