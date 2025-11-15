import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/constants/app_colors.dart';
import 'package:job_finder/app_fonts.dart';
import 'package:job_finder/l10n/app_localizations.dart';
import 'package:job_finder/select_jobtype_page.dart';

class SelectRegionPage extends StatefulWidget {
  const SelectRegionPage({super.key});

  @override
  State<SelectRegionPage> createState() => _SelectRegionPageState();
}

class _SelectRegionPageState extends State<SelectRegionPage> {
  String? selectedRegion;

  @override
  Widget build(BuildContext context) {
    var lang=AppLocalizations.of(context)!;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          centerTitle: true,
          title: Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              lang.selectYourRegion,
              maxLines: 2,
              softWrap: true,
              style: TextStyle(
                fontSize: 18,
                fontFamily: AppFonts.primaryFont,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: Container(
              width: 450,
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              child: CupertinoSearchTextField(
                style: TextStyle(fontFamily: AppFonts.primaryFont),
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                prefixIcon: Padding(
                  padding: EdgeInsets.all(4),
                  child: Icon(Icons.search),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Column(
            children: [
              ListTile(
                title: Text(
                  lang.ashgabat,
                  style: TextStyle(
                    fontFamily: AppFonts.primaryFont,
                    fontSize: 18,
                  ),
                ),
                leading: Radio(
                  activeColor: AppColors.textColor,
                  focusColor: AppColors.buttonColor,
                  value: 'Ashgabat',
                  groupValue: selectedRegion,
                  onChanged: (value) {
                    setState(() {
                      selectedRegion = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text(
                  lang.balkan,
                  style: TextStyle(
                    fontFamily: AppFonts.primaryFont,
                    fontSize: 18,
                  ),
                ),
                leading: Radio(
                  activeColor: AppColors.textColor,
                  focusColor: AppColors.buttonColor,
                  value: 'Balkan',
                  groupValue: selectedRegion,
                  onChanged: (value) {
                    setState(() {
                      selectedRegion = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text(
                  lang.ahal,
                  style: TextStyle(
                    fontFamily: AppFonts.primaryFont,
                    fontSize: 18,
                  ),
                ),
                leading: Radio(
                  activeColor: AppColors.textColor,
                  focusColor: AppColors.buttonColor,
                  value: 'Ahal',
                  groupValue: selectedRegion,
                  onChanged: (value) {
                    setState(() {
                      selectedRegion = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text(
                  lang.mary,
                  style: TextStyle(
                    fontFamily: AppFonts.primaryFont,
                    fontSize: 18,
                  ),
                ),
                leading: Radio(
                  activeColor: AppColors.textColor,
                  focusColor: AppColors.buttonColor,
                  value: 'Mary',
                  groupValue: selectedRegion,
                  onChanged: (value) {
                    setState(() {
                      selectedRegion = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text(
                  lang.dashoguz,
                  style: TextStyle(
                    fontFamily: AppFonts.primaryFont,
                    fontSize: 18,
                  ),
                ),
                leading: Radio(
                  activeColor: AppColors.textColor,
                  focusColor: AppColors.buttonColor,
                  value: 'Dashoguz',
                  groupValue: selectedRegion,
                  onChanged: (value) {
                    setState(() {
                      selectedRegion = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text(
                  lang.lebap,
                  style: TextStyle(
                    fontFamily: AppFonts.primaryFont,
                    fontSize: 18,
                  ),
                ),
                leading: Radio(
                  activeColor: AppColors.textColor,
                  value: 'Lebap',
                  groupValue: selectedRegion,
                  onChanged: (value) {
                    setState(() {
                      selectedRegion = value;
                    });
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsGeometry.only(left: 70, right: 70,top: 40),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => SelectJobtypePage(),
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
