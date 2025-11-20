// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/app_fonts.dart';
import 'package:job_finder/constants/app_colors.dart';
import 'package:job_finder/database/database_helper.dart';
import 'package:job_finder/functions/crypto.dart';
import 'package:job_finder/l10n/app_localizations.dart';
import 'package:job_finder/otp_code_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with SingleTickerProviderStateMixin {
  TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  bool _isVisible = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  lang.signUp,
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontFamily: AppFonts.poppinsBold,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(right: 25, left: 25),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                  ),
                  child: TabBar(
                    physics: BouncingScrollPhysics(),
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                      gradient: AppColors.appGradient,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    labelStyle: TextStyle(
                      fontFamily: AppFonts.primaryFont,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    tabs: [
                      Tab(
                        child: Text(
                          lang.phone,
                          style: TextStyle(letterSpacing: 0.5),
                        ),
                      ),
                      Tab(
                        child: Text(
                          lang.email,
                          style: TextStyle(letterSpacing: 0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 60,
                              left: 10,
                              right: 10,
                            ),
                            child: TextField(
                              controller: number,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: "+993 (00) 000000",
                                hintStyle: TextStyle(
                                  color: Colors.grey[700],
                                  fontFamily: AppFonts.primaryFont,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: AppColors.buttonColor,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: AppColors.buttonColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
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
                                  borderSide: BorderSide(
                                    color: AppColors.buttonColor,
                                  ),
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
                                  borderSide: BorderSide(
                                    color: AppColors.buttonColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 60,
                              left: 10,
                              right: 10,
                            ),
                            child: TextField(
                              controller: email,
                              decoration: InputDecoration(
                                label: Text(lang.email),
                                labelStyle: TextStyle(
                                  color: Colors.grey[700],
                                  fontFamily: AppFonts.primaryFont,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: AppColors.buttonColor,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: AppColors.buttonColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
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
                                  borderSide: BorderSide(
                                    color: AppColors.buttonColor,
                                  ),
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
                                  borderSide: BorderSide(
                                    color: AppColors.buttonColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 70, right: 70, top: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => OtpCodePage(number: number.text),
                      ),
                    );
                  },
                  child: GestureDetector(
                    onTap: () async {
                      final phone = number.text.trim();
                      final pass = password.text.trim();

                      if (phone.isEmpty || pass.isEmpty) return;

                      final hash = hashPassword(pass);
                      await DatabaseHelper.insertUser(phone, hash);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor:AppColors.backgroundColor.withOpacity(0.5),
                          content: Text("User registered successfully")),
                      );
                      Navigator.pop(context);
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
                          lang.signUp,
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
            ],
          ),
        ),
      ),
    );
  }
}
