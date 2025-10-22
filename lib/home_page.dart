// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.only(left: 10,right: 10,top: 30),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(backgroundColor: Colors.grey.withOpacity(0.5),
            child: Text("U"),),
            trailing: Icon(CupertinoIcons.bell),
          ),
          
        ],
      ),),
    );
  }
}