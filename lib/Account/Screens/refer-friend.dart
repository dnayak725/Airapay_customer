// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:aira_pay/Shop/Widgets/search.dart';
import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heroicons/heroicons.dart';

import '../../Shop/Widgets/tabs.dart';

class Referfriend extends StatefulWidget {
  const Referfriend({Key? key}) : super(key: key);

  @override
  State<Referfriend> createState() => _ReferfriendState();
}

class _ReferfriendState extends State<Referfriend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Tabs(0),
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
              'Refer a Friend',
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
          Divider(color: Color(label_grey)),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 221, 221, 221),
                    blurRadius: 4.0,
                  ),
                ]),
            child: Column(
              children: [
                Text(
                  'Share your Referral Code',
                  style: TextStyle(
                      fontSize: button_text,
                      color: Color(primary_text),
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: spacing_extra_small,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ABCDE',
                      style: TextStyle(
                          fontSize: app_tittle,
                          color: Color(primary_color),
                          fontWeight: FontWeight.w700),
                    ),
                    HeroIcon(
                      HeroIcons.documentDuplicate,
                      solid: true,
                      size: 18,
                      color: Color(primary_color),
                    )
                  ],
                ),
                SizedBox(
                  height: spacing_extra_small,
                ),
                Text(
                  'Get an RM5 voucher when your friend signs up for AiraPay and completes a purchase. Your friend gets an RM5 first-purchase voucher too!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: sub_title,
                      color: Color(regular_text),
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
                        shadowColor: Color(fusica_text).withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        )),
                    onPressed: () {},
                    child: Text(
                      "Invite a Friend",
                      style: TextStyle(fontSize: button_text),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
