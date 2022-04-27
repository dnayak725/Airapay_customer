// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heroicons/heroicons.dart';

import '../../Shop/Widgets/tabs.dart';

class Emailverification extends StatefulWidget {
  const Emailverification({Key? key}) : super(key: key);

  @override
  State<Emailverification> createState() => _RegisterState();
}

class _RegisterState extends State<Emailverification> {
  get toggleSwitch => null;

  get isSwitched => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Tabs(0),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: AppBar(
            backgroundColor: Colors.white,
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
              'Verify Email Address',
              style: TextStyle(
                  color: Color(primary_text),
                  fontSize: app_tittle,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 34),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Check your inbox. An email verification link has been sent to this emaill address:',
                style: TextStyle(
                    fontSize: sub_title,
                    color: Color(regular_text),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: spacing_extra_small,
              ),
              Text(
                'paulakhalid@example.com',
                style: TextStyle(
                    fontSize: heading_title,
                    color: Color(primary_text),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: spacing_extra_small,
              ),
              Row(
                children: [
                  HeroIcon(
                    HeroIcons.pencil,
                    solid: true,
                    color: Color(primary_color),
                    size: 18,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Change Email Address',
                    style: TextStyle(
                        fontSize: sub_title,
                        color: Color(primary_color),
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              SizedBox(
                height: button_height,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // ignore: prefer_const_constructors
                      primary: Colors.white,
                      side: BorderSide(
                        width: 2.0,
                        color: Color(border_color_black),
                      ),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                    ),
                    onPressed: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Password()));
                    },
                    child: Text(
                      "Resend Verification Email",
                      style: TextStyle(
                          fontSize: button_text,
                          fontWeight: FontWeight.w700,
                          color: Color(primary_text)),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
