// import 'dart:async';


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:job_finder/app_fonts.dart';
// import 'package:job_finder/constants/app_colors.dart';
// import 'package:job_finder/home_page.dart';
// import 'package:job_finder/l10n/app_localizations.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

// class GetCodePage extends StatefulWidget {
//   final String number;
//   const GetCodePage({super.key, required this.number});

//   @override
//   State<GetCodePage> createState() => _GetCodePageState();
// }

// class _GetCodePageState extends State<GetCodePage> {
//   Timer? _timer;
//   int remainingSeconds = 30;

//   @override
//   void initState() {
//     super.initState();
//     startTime();
//   }

//   void startTime() {
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       if (remainingSeconds == 0) {
//         timer.cancel();
//       } else {
//         setState(() {
//           remainingSeconds--;
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var lang=AppLocalizations.of(context)!;
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       appBar: AppBar(
//         backgroundColor: AppColors.backgroundColor,
//         leading: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: CircleAvatar(
//               radius: 10,
//               backgroundColor: Colors.white,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 8),
//                 child: Icon(
//                   Icons.arrow_back_ios,
//                   // ignore: deprecated_member_use
//                   color: Colors.black.withOpacity(0.6),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(top: 20, left: 30, right: 30),
//           child: Column(
//             children: [
//               Text(
//                 lang.typeTheCode,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 24,
//                   fontFamily: AppFonts.primaryFont,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 "${lang.codeSent} ${widget.number}",
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontFamily: AppFonts.primaryFont,
//                   color: Colors.grey[600],
//                 ),
//               ),
//               SizedBox(height: 50),
//               PinCodeTextField(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 appContext: context,
//                 length: 4,
//                 keyboardType: TextInputType.number,
//                 enableActiveFill: true,
//                 pinTheme: PinTheme(
//                   shape: PinCodeFieldShape.box,
//                   borderRadius: BorderRadius.circular(8),
//                   fieldHeight: 60,
//                   fieldWidth: 50,
//                   selectedColor: AppColors.mainColor,
//                   activeColor: Colors.white,
//                   inactiveColor: Colors.white,
//                   inactiveFillColor: Colors.white,
//                   activeFillColor: Colors.white,
//                   selectedFillColor: Colors.white,
//                 ),
//               ),
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     lang.resendTheCode,
//                     style: TextStyle(fontFamily: AppFonts.primaryFont),
//                   ),
//                   SizedBox(width: 3),
//                   Text(
//                     "00:$remainingSeconds",
//                     style: TextStyle(fontFamily: AppFonts.primaryFont),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 470),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(context, CupertinoPageRoute(builder: (context)=>HomePage()));
//                 },
//                 child: Container(
//                   height: 50,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     color: AppColors.mainColor,
//                   ),
//                   child: Center(
//                     child: Text(
//                      lang.logIn,
//                       style: TextStyle(
//                         fontFamily: AppFonts.primaryFont,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
