import 'package:flutter/material.dart';
import 'package:job_finder/app_fonts.dart';
import 'package:job_finder/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider=Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
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
            ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text(
              "Dark mode",
              style: TextStyle(
                fontFamily: AppFonts.primaryFont,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            trailing:Switch(
                activeColor: Colors.white,
                value: themeProvider.isDarkMode,
                onChanged: (value) {
                  themeProvider.toggleTheme(value);
                },
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


