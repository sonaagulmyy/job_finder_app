// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/app_fonts.dart';
import 'package:job_finder/constants/app_colors.dart';
import 'package:job_finder/job_details.dart';
import 'package:job_finder/models/job_model.dart';
import 'package:lottie/lottie.dart';

class JobApplyPage extends StatefulWidget {
  final Job job;
  const JobApplyPage({super.key, required this.job});

  @override
  State<JobApplyPage> createState() => _JobApplyPageState();
}

class _JobApplyPageState extends State<JobApplyPage> {
  final name = TextEditingController();
  final portfolio = TextEditingController();
  final coverLetter = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Apply job",
          style: TextStyle(
            fontFamily: AppFonts.primaryFont,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 15,
            bottom: 10,
          ),
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[100],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Full name *",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFonts.primaryFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(
                            color: Colors.red.withOpacity(0.5),
                            width: 2,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(
                            color: Colors.red.withOpacity(0.5),
                            width: 2,
                          ),
                        ),
                      ),

                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Full name is required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Portfolio *",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFonts.primaryFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: portfolio,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Upload Resume *",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFonts.primaryFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    DottedBorder(
                      options: RoundedRectDottedBorderOptions(
                        radius: Radius.circular(20),
                        dashPattern: [10, 5],
                        strokeWidth: 2,
                        color: Colors.grey,
                        padding: EdgeInsets.all(50),
                      ),
                      child: Container(padding: EdgeInsets.all(20)),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Cover letter *",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFonts.primaryFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      maxLines: 5,
                      controller: coverLetter,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(
                            color: Colors.red.withOpacity(0.5),
                            width: 2,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(
                            color: Colors.red.withOpacity(0.5),
                            width: 2,
                          ),
                        ),
                      ),

                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Needs to be filled";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            barrierColor: Colors.transparent.withOpacity(0.5),
                            builder: (context) {
                              Future.delayed(Duration(seconds: 2), () {
                                Navigator.of(context).pop();
                                Navigator.pushReplacement(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) =>
                                        JobDetails(job: widget.job),
                                  ),
                                );
                              });
                              return BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 10,
                                  sigmaY: 10,
                                ),
                                child: AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  title: Column(
                                    children: [
                                      SizedBox(
                                        height: 120,
                                        width: 120,
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: Lottie.asset(
                                            'lib/assets/animations/Done.json',
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "You have applied",
                                        style: TextStyle(
                                          fontFamily: AppFonts.poppinsBold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: AppColors.appGradient,
                        ),
                        child: Center(
                          child: Text(
                            "Apply",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: AppFonts.primaryFont,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}