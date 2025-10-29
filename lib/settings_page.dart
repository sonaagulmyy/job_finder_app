import 'package:flutter/material.dart';
import 'package:job_finder/app_fonts.dart';
import 'package:job_finder/constants/app_colors.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: AppColors.textColor),
        ),
        title: Text(
          "Settings",
          style: TextStyle(
            fontFamily: AppFonts.primaryFont,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.language),
            title: Text(
              "Languages",
              style: TextStyle(
                fontFamily: AppFonts.primaryFont,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.security_outlined),
            title: Text(
              "Privacy",
              style: TextStyle(
                fontFamily: AppFonts.primaryFont,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 100),
          ListTile(
            leading: Icon(Icons.logout,color: Colors.red,),
            title: Text("Log Out",style: TextStyle(fontFamily: AppFonts.primaryFont,fontWeight: FontWeight.bold,fontSize: 18,color: Colors.red),),
          )
        ],
      ),
    );
  }
}
