import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/app_fonts.dart';
import 'package:job_finder/constants/app_colors.dart';
import 'package:job_finder/models/job_model.dart';

class JobCard extends StatelessWidget {
  final Job jobdata;
  final Color logoColor;
  const JobCard({
    super.key,
    required this.jobdata,
    required this.logoColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Container(
                height: 45,
                width:50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey),
                ),
                child: Center(
                  child: Text(
                    "G",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: AppFonts.poppinsBold,
                      color: logoColor,
                    ),
                  ),
                ), 
              ),
              title: Text(
                jobdata.position,
                style: TextStyle(
                  fontFamily: AppFonts.poppinsBold,
                  fontSize: 18,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                jobdata.company,
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
            Text(
              jobdata.location,
               style: TextStyle(
                 color: AppColors.textColor,
                 fontSize: 15,
                 fontFamily: AppFonts.primaryFont,
                 fontWeight: FontWeight.bold,
               ),
             ),
             Text(
               "\$${jobdata.salaryMin}-\$${jobdata.salaryMax}/month",
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
      ),
    );
  }
}
