// ignore_for_file: deprecated_member_use, use_build_context_synchronously
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/constants/app_colors.dart';
import 'package:job_finder/app_fonts.dart';
import 'package:job_finder/l10n/app_localizations.dart';
import 'package:job_finder/main_screen.dart';

class FillProfileInfoPage extends StatefulWidget {
  const FillProfileInfoPage({super.key});

  @override
  State<FillProfileInfoPage> createState() => _FillProfileInfoPageState();
}

class _FillProfileInfoPageState extends State<FillProfileInfoPage> {
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController birthday = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    var lang=AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          lang.fillProfile,
          style: TextStyle(
            fontFamily: AppFonts.primaryFont,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey.withOpacity(0.5),
                      child: Text(
                        "U",
                        style: TextStyle(fontSize: 35, color: Colors.white),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColors.buttonColor,
                        child: Icon(Icons.edit_outlined, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: name,
                decoration: InputDecoration(
                  labelText: lang.name,
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: AppFonts.primaryFont,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                  ),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: surname,
                decoration: InputDecoration(
                  labelText: lang.surname,
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: AppFonts.primaryFont,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                  ),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: birthday,
                decoration: InputDecoration(
                  label: Text(lang.birthday),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: AppFonts.primaryFont,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                  ),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  label: Text(lang.email),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: AppFonts.primaryFont,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                  ),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: phone,
                decoration: InputDecoration(
                  labelText: "+993",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: AppFonts.primaryFont,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Container(
                height: 55,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.withOpacity(0.5)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: Text(lang.gender),
                    value: selectedGender,
                    items: [
                      DropdownMenuItem(
                        value: "Female",
                        child: Text(
                          lang.female,
                          style: TextStyle(fontFamily: AppFonts.primaryFont),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Male",
                        child: Text(
                          lang.male,
                          style: TextStyle(fontFamily: AppFonts.primaryFont),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70, right: 70,top: 40),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false, 
                      barrierColor: Colors.transparent.withOpacity(0.5),
                      builder: (context) {
                        Future.delayed(Duration(seconds: 2), () {
                          Navigator.of(context).pop(); 
                          Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(builder: (context) => MainScreen()),
                          ); 
                        });
                        return BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                          child: AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            title: Column(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: AppColors.buttonColor,
                                  child: Icon(CupertinoIcons.person,color: Colors.white,size: 40,),),
                                  SizedBox(height: 10,),
                                Text(lang.congratulations,style: TextStyle(
                                  fontFamily: AppFonts.poppinsBold
                                ),),
                              ],
                            ),
                            content: Text(lang.accountReady,style: TextStyle(fontFamily: AppFonts.primaryFont),textAlign: TextAlign.center,),
                          ),
                        );
                      },
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
      ),
    );
  }
}
