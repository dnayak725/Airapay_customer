// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/Auth/Screens/register.dart';
import 'package:aira_pay/Shop/Screens/home.dart';

import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

var finalStatus;

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    print("finalStatus");

    getValidate();
    print(finalStatus.runtimeType);
  }

  getValidate() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obtainStatus = sharedPreferences.getString("AuthToken");
    setState(() {
      finalStatus = obtainStatus;
    });
    Timer(
      Duration(seconds: 3),
      finalStatus != null
          ? () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home(false)))
          : () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Register())),
    );
  }

  // Future getValidationData() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Color(0xFF86198f),
        // ignore: prefer_const_constructors
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Image(
              image: AssetImage(
                'assets/images/logo.png',
              ),
            ),
            Text(
              "Shop Confidently, Pay it Later",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
