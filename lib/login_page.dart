import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/app_fonts.dart';
import 'package:job_finder/constants/app_colors.dart';
import 'package:job_finder/database/functions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controller = TextEditingController();
  bool _isValid = false;
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isValid = _controller.text.replaceAll(RegExp(r'\D'), '').length == 11;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() async {
    String phone = _controller.text.trim();
    if (phone.isEmpty) {
      bool exists = await userExists(phone);

      if (!exists) {
        _showMessage("You need to sign up first");
      } else {
        _showMessage("Please fill the blank spaces");
      }

      return;
    }

    bool exists = await userExists(phone.replaceAll(RegExp(r'\D'), ''));

    if (!exists) {
      _showMessage("You need to sign up first");
      return;
    }

    if (!_isValid) {
      _showMessage("Please fill the blank spaces");
      return;
    }

    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "+993 (00) 000000",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontFamily: AppFonts.primaryFont,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: _isValid ? _onTap : null,
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: _isValid ? Colors.grey[800] : Colors.grey[500],
                ),
                child: Center(
                  child: Text(
                    "Get code",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: AppFonts.primaryFont,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Get code",
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
              SizedBox(width: 2),
              Text(
                "Privacy policy",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
