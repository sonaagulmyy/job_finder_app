import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/app_fonts.dart';
import 'package:job_finder/constants/app_colors.dart';
import 'package:job_finder/models/job_model.dart';

class JobDetails extends StatefulWidget {
  final Job job;
  const JobDetails({super.key, required this.job});

  @override
  State<JobDetails> createState() => _JobDetailsState();
  
}

class _JobDetailsState extends State<JobDetails> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {},
              child: Icon(CupertinoIcons.bookmark, size: 22),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 45,
                        width: 50,
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
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.job.position,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: AppFonts.poppinsBold,
                        ),
                      ),
                      Text(
                        widget.job.company,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontFamily: AppFonts.primaryFont,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: Divider(thickness: 1.5),
                      ),
                      Text(
                        widget.job.location,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: AppFonts.primaryFont,
                          color: Colors.grey,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        "\$${widget.job.salaryMin}-\$${widget.job.salaryMax} / months",
                        style: TextStyle(
                          fontSize: 17,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppFonts.primaryFont,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
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
                            height: 30,
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
                      SizedBox(height: 5,),
                      Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Posted ",style: TextStyle(fontFamily: AppFonts.primaryFont,color: Colors.grey,fontWeight: FontWeight.bold),),
                          Text(widget.job.date.split('T').first,style: TextStyle(fontFamily: AppFonts.primaryFont,fontWeight: FontWeight.bold,color: Colors.grey),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: Text("Description",style: TextStyle(color: AppColors.textColor,fontSize: 24,fontFamily: AppFonts.poppinsBold),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Text(
                widget.job.description,
                style: TextStyle(
                  fontFamily: AppFonts.primaryFont,
                  fontSize: 16,
                  color: Colors.grey,
                ),
                maxLines: 15,
              ),
            ),
            SizedBox(height: 40,),
            Padding(padding: EdgeInsets.only(bottom: 10,left: 10,right: 10),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
              gradient: AppColors.appGradient),
            child: Center(child: Text("Apply",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: AppFonts.primaryFont),),),
            ),)
          ],
        ),
      ),
    );
  }
}
