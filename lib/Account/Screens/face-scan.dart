// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/Account/Screens/review-details.dart';
import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heroicons/heroicons.dart';

import '../../Shop/Widgets/tabs.dart';

class Facescan extends StatefulWidget {
  const Facescan({Key? key}) : super(key: key);

  @override
  State<Facescan> createState() => _RegisterState();
}

class _RegisterState extends State<Facescan> {
  get toggleSwitch => null;

  get isSwitched => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70,
          decoration: BoxDecoration(
           boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.18),
        spreadRadius: 10,
        blurRadius: 3,
        offset: Offset(0, 8), // changes position of shadow
      ),
    ],),
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            child: Tabs(0)),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: AppBar(
            backgroundColor: Color(page_color),
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: HeroIcon(
                HeroIcons.arrowNarrowLeft,
                color: Color(primary_color),
              ),
            ),
            title: Text(
              'Scan Face',
              style: TextStyle(
                  color: Color(primary_text),
                  fontSize: app_tittle,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
      backgroundColor: Color(page_color),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'This is used to verify your identity and protect your account.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: sub_title,
                    color: Color(regular_text),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: spacing_small,
              ),
              Center(
                  child: Image.asset('assets/images/face-scan.png',
                      fit: BoxFit.cover)),
              SizedBox(
                height: spacing_small,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text("• "),
                      Expanded(
                        child: Text(
                          'Position your face within the frame.',
                          style: TextStyle(
                            fontSize: sub_title,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("• "),
                      Expanded(
                        child: Text(
                          'Make sure you are in a bright environment.',
                          style: TextStyle(
                            fontSize: sub_title,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: spacing_medium,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Your face will be detected automatically within 3s',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: sub_title, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: spacing_large,
              ),
              SizedBox(
                height: button_height,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(primary_color),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      )),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Reviewdetails()));
                  },
                  child: Text(
                    "Let’s Do It",
                    style: TextStyle(fontSize: button_text),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
