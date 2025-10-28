// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:job_finder/app_fonts.dart';
import 'package:job_finder/constants/app_colors.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: TextStyle(
            fontFamily: AppFonts.primaryFont,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Job has been updated",
                      style: TextStyle(
                        fontFamily: AppFonts.poppinsBold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 120),
                    Expanded(
                      child: Container(
                        height: 25,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: AppColors.buttonColor,
                        ),
                        child: Center(
                          child: Text(
                            "New",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: AppFonts.primaryFont,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "20 December 2025 | 20:12",
                  style: TextStyle(
                    fontFamily: AppFonts.primaryFont,
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Lorem ipsum dolor sit amet oidhsoha dsajhioia adsjhoisaho dsjhaoijhsodda asoipo q daspoPOMNWQ JDSOIJS ioewd djoiwj dwojepdjw ",
                  style: TextStyle(
                    fontFamily: AppFonts.primaryFont,
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(color: Colors.grey.withOpacity(0.5), thickness: 1.5),
              ],
            ),
          );
        },
      ),
    );
  }
}
