// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/Shop/Screens/home.dart';
import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heroicons/heroicons.dart';

class Firstnotification extends StatefulWidget {
  const Firstnotification({Key? key}) : super(key: key);

  @override
  State<Firstnotification> createState() => _FirstnotificationState();
}

class _FirstnotificationState extends State<Firstnotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'Notification',
              style: TextStyle(
                  color: Color(primary_text),
                  fontSize: app_tittle,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
      backgroundColor: Color(page_color),
      body: Column(
        children: [
          Divider(
            color: Color(label_grey),
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Column(
              children: [
                Text(
                  'No notifications yet.',
                  style: TextStyle(
                      fontSize: sub_title,
                      color: Color(text_grey),
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: spacing_medium,
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
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                              padding: EdgeInsets.only(
                                  top: 30, left: 20, right: 20, bottom: 10),
                              child: Column(
                                children: [
                                  Text(
                                    'Stay in the loop!',
                                    style: TextStyle(
                                        fontSize: heading_title,
                                        color: Color(primary_text),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: spacing_small,
                                  ),
                                  Text(
                                    'Turn this on to receive notifications on due payments, deals, and more!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: sub_title,
                                        color: Color(primary_text),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: spacing_small,
                                  ),
                                  SizedBox(
                                    height: button_height,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Color(primary_color),
                                          elevation: 2,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(35),
                                          )),
                                      onPressed: () {},
                                      child: Text(
                                        "Ebable Notification",
                                        style: TextStyle(fontSize: button_text),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: spacing_small,
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: Text(
                                      'Skip',
                                      style: TextStyle(
                                          fontSize: sub_title,
                                          color: Color(primary_color),
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ],
                              )));
                    },
                    child: Text(
                      "Ebable Notification",
                      style: TextStyle(fontSize: button_text),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
