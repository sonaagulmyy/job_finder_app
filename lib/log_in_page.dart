// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/constants/app_colors.dart';
import 'package:job_finder/constants/app_fonts.dart';
import 'package:job_finder/constants/select_region_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 250, right: 10),
            child: Text(
              "Let's jump in",
              style: TextStyle(
                color: AppColors.textColor,
                fontFamily: AppFonts.poppinsBold,
                fontSize: 25,
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                  width: 1.5,
                ),
              ),
              child: Center(
                child: Text(
                  "Sign-in with google",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: AppFonts.primaryFont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                  width: 1.5,
                ),
              ),
              child: Center(
                child: Text(
                  "Sign-in with Apple",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: AppFonts.primaryFont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 90),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey.withOpacity(0.5),
                    thickness: 1.5,
                    endIndent: 10,
                  ),
                ),
                Text(
                  "or",
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: AppFonts.primaryFont,
                    fontSize: 18,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Divider(
                    color: Colors.grey.withOpacity(0.5),
                    thickness: 1.5,
                    endIndent: 10,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context)=>SelectRegionPage()));
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.buttonColor,
                ),
                child: Center(
                  child: Text(
                    "Sign in with Email",
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
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.only(left: 70),
            child: Row(
              children: [
                Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                    fontFamily: AppFonts.primaryFont,
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  'Sign up',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontFamily: AppFonts.primaryFont,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
