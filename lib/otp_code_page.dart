import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/app_fonts.dart';
import 'package:job_finder/constants/app_colors.dart';
import 'package:job_finder/select_region_page.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpCodePage extends StatefulWidget {
  final String number;
  const OtpCodePage({super.key, required this.number});

  @override
  State<OtpCodePage> createState() => _OtpCodePageState();
}

class _OtpCodePageState extends State<OtpCodePage> {
  Timer? _timer;
  int remainingSeconds = 30;

  @override
  void initState() {
    super.initState();
    startTime();
  }

  void startTime() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          remainingSeconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 20, left: 30, right: 30),
        child: Column(
          children: [
            Text(
              "Type the code",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: AppFonts.primaryFont,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Send the code ${widget.number} ",
              style: TextStyle(
                fontSize: 16,
                fontFamily: AppFonts.primaryFont,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 50),
            PinCodeTextField(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              appContext: context,
              length: 4,
              keyboardType: TextInputType.number,
              enableActiveFill: true,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(8),
                fieldHeight: 60,
                fieldWidth: 50,
                selectedColor: AppColors.textColor,
                activeColor: Colors.grey[300],
                inactiveColor: Colors.grey[300],
                inactiveFillColor: Colors.white,
                activeFillColor: Colors.white,
                selectedFillColor: Colors.white,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Resend the code",
                  style: TextStyle(fontFamily: AppFonts.primaryFont),
                ),
                SizedBox(width: 3),
                Text(
                  "00:$remainingSeconds",
                  style: TextStyle(fontFamily: AppFonts.primaryFont),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 70,left: 70,top: 60),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => SelectRegionPage(),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: AppColors.appGradient,
                  ),
                  child: Center(
                    child: Text(
                      "Log in",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: AppFonts.primaryFont,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
