// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/constants/app_colors.dart';
import 'package:job_finder/app_fonts.dart';
import 'package:job_finder/database/database_helper.dart';
import 'package:job_finder/functions/crypto.dart';
import 'package:job_finder/l10n/app_localizations.dart';
import 'package:job_finder/select_region_page.dart';
import 'package:job_finder/sign_up_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 250, right: 10),
              child: Text(
                lang.letsJumpIn,
                style: TextStyle(
                  color: AppColors.textColor,
                  fontFamily: AppFonts.poppinsBold,
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: TextField(
                controller: number,
                decoration: InputDecoration(
                  hintText: "+993 (00) 000000",
                  hintStyle: TextStyle(
                    color: Colors.grey[700],
                    fontFamily: AppFonts.primaryFont,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: AppColors.buttonColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: AppColors.buttonColor),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: password,
                obscureText: !_isVisible,
                decoration: InputDecoration(
                  label: Text(lang.password),
                  labelStyle: TextStyle(
                    fontFamily: AppFonts.primaryFont,
                    color: Colors.grey[700],
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: AppColors.buttonColor),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isVisible
                          ? Icons.visibility_rounded
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: AppColors.buttonColor),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => SelectRegionPage(),
                    ),
                  );
                },
                child: GestureDetector(
                  onTap: () async {
                    final phone = number.text.trim();
                    final pass = password.text.trim();

                    if (phone.isEmpty || pass.isEmpty) return;

                    final user = await DatabaseHelper.getUser(phone);

                    if (user == null) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(
                        backgroundColor: AppColors.backgroundColor.withOpacity(0.5),
                        content: Text("User not found, sign up first")));
                      return;
                    }

                    final inputHash = hashPassword(pass);

                    if (inputHash == user['passwordHash']) {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => SelectRegionPage(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(
                        backgroundColor: AppColors.backgroundColor.withOpacity(0.5),
                        content: Text("Wrong password")));
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: AppColors.appGradient,
                    ),
                    child: Center(
                      child: Text(
                        lang.signIn,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: AppFonts.primaryFont,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  lang.dontHaveAnAccount,
                  style: TextStyle(
                    fontFamily: AppFonts.primaryFont,
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text(
                    lang.signUp,
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontFamily: AppFonts.primaryFont,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
