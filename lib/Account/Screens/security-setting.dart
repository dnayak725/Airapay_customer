// ignore_for_file: prefer__ructors, prefer_const_constructors

import 'package:aira_pay/Account/Screens/change_password.dart';
import 'package:aira_pay/Payment/Screens/add_card.dart';
import 'package:aira_pay/Payment/Screens/confirm-payment.dart';
import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

import '../../Shop/Widgets/tabs.dart';
import 'change-mobilenumber.dart';

class Securitysetting extends StatefulWidget {
  Securitysetting({Key? key}) : super(key: key);

  @override
  State<Securitysetting> createState() => _RegisterState();
}

class _RegisterState extends State<Securitysetting> {
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
                'Security Settings',
                style: TextStyle(
                    color: Color(primary_text),
                    fontSize: app_tittle,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ),
        backgroundColor: Color(page_color),
        body: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Mobile Number',
                    style: TextStyle(
                        fontSize: sub_title,
                        color: Color(primary_text),
                        fontWeight: FontWeight.w600),
                  )),
              GestureDetector(
                onTap: () {},
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Changemobileno()));
                  },
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 20, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '+60123456789',
                            style: TextStyle(
                                fontSize: sub_title,
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Text(
                                'Change',
                                style: TextStyle(
                                    fontSize: sub_title,
                                    fontWeight: FontWeight.w600,
                                    color: Color(primary_color)),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              HeroIcon(
                                HeroIcons.chevronRight,
                                size: 18,
                                solid: true,
                                color: Color(primary_color),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: spacing_medium,),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Security',
                    style: TextStyle(
                        fontSize: sub_title,
                        color: Color(primary_text),
                        fontWeight: FontWeight.w600),
                  )),
              GestureDetector(
                onTap: () {},
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChangePassword()));
                  },
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 20, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Password',
                            style: TextStyle(
                                fontSize: sub_title,
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Text(
                                'Change',
                                style: TextStyle(
                                    fontSize: sub_title,
                                    fontWeight: FontWeight.w600,
                                    color: Color(primary_color)),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              HeroIcon(
                                HeroIcons.chevronRight,
                                size: 18,
                                solid: true,
                                color: Color(primary_color),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: GestureDetector(
                  onTap: () {},
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 20, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '6-digit Passcode',
                            style: TextStyle(
                                fontSize: sub_title,
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Text(
                                'Change',
                                style: TextStyle(
                                    fontSize: sub_title,
                                    fontWeight: FontWeight.w600,
                                    color: Color(primary_color)),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              HeroIcon(
                                HeroIcons.chevronRight,
                                size: 18,
                                solid: true,
                                color: Color(primary_color),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
