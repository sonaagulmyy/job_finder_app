import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/app_fonts.dart';
import 'package:job_finder/constants/app_colors.dart';

class JobCard extends StatelessWidget {
  final int height;
  final double width;
  final String logo;
  final String job;
  final String company;
  final double firstPrice;
  final double secondPrice;
  final Color logoColor;
  const JobCard({
    super.key,
    required this.height,
    required this.width,
    required this.logo,
    required this.job,
    required this.company,
    required this.firstPrice,
    required this.secondPrice,
    required this.logoColor
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        height: 180,
        width: 320,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              ListTile(
                leading: Container(
                  height: height.toDouble(),
                  width: width.toDouble(),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: Text(
                      logo,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: AppFonts.poppinsBold,
                        color: logoColor,
                      ),
                    ),
                  ),
                ),
                title: Text(
                  job,
                  style: TextStyle(
                    fontFamily: AppFonts.poppinsBold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  company,
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: AppFonts.primaryFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                contentPadding: EdgeInsets.only(right: 0),
                trailing: Icon(
                  CupertinoIcons.bookmark,
                  color: AppColors.textColor,
                ),
              ),
              Divider(thickness: 1.5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'California,US',
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: AppFonts.primaryFont,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "\$$firstPrice-\$$secondPrice/month",
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 15,
                      fontFamily: AppFonts.primaryFont,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 20,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Center(
                          child: Text(
                            "Full time",
                            style: TextStyle(
                              fontFamily: AppFonts.primaryFont,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        height: 20,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Center(
                          child: Text(
                            "On-site",
                            style: TextStyle(
                              fontFamily: AppFonts.primaryFont,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
