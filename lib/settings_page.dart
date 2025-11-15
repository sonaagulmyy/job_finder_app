import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/app_fonts.dart';
import 'package:job_finder/l10n/app_localizations.dart';
import 'package:job_finder/language_selection_page.dart';
import 'package:job_finder/log_in_page.dart';
import 'package:job_finder/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider=Provider.of<ThemeProvider>(context);
    var lang=AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          lang.settings,
          style: TextStyle(
            fontFamily: AppFonts.primaryFont,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>LanguageSelectionPage()));
            },
            child: ListTile(
              leading: Icon(Icons.language),
              title: Text(
                lang.languages,
                style: TextStyle(
                  fontFamily: AppFonts.primaryFont,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.security_outlined),
            title: Text(
              lang.privacy,
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
              lang.darkMode,
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
          GestureDetector(
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>LogInPage()));
            },
            child: ListTile(
              leading: Icon(Icons.logout,color: Colors.red,),
              title: Text(lang.logOut,style: TextStyle(fontFamily: AppFonts.primaryFont,fontWeight: FontWeight.bold,fontSize: 18,color: Colors.red),),
            ),
          )
        ],
      ),
    );
  }
}


