import 'package:flutter/widgets.dart';

class AppColors {
  static Color backgroundColor = Color(0xFF868484);
  static Color buttonColor = Color(0xFF3062D5);
  static Color textColor=Color(0xFF3599EA);

  static  LinearGradient appGradient=LinearGradient(colors: [
 Color(0xFF3062D5),
 Color.fromARGB(255, 102, 145, 247),
 Color(0xFF3599EA)
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter
  
  );

}
