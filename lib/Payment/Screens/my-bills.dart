// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/Payment/Screens/all-bills.dart';
import 'package:aira_pay/Shop/Widgets/tabs.dart';
import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Mybills extends StatefulWidget {
  const Mybills({Key? key}) : super(key: key);

  @override
  State<Mybills> createState() => _RegisterState();
}

class _RegisterState extends State<Mybills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Tabs(0),
        backgroundColor: Color(0xFFf8fafc),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(children: const <Widget>[
                        Text(
                          'My Bills',
                          style: TextStyle(
                            fontSize: app_tittle,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ])),
                ),
                    Divider(height: 1,),
                SizedBox(
                  height: app_tittle,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Spending Limit',
                        style: TextStyle(
                            fontSize: heading_title, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  margin: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: StepProgressIndicator(
                    totalSteps: 100,
                    currentStep: 20,
                    size: 16,
                    padding: 0,
                    selectedColor: Colors.yellow,
                    unselectedColor: Colors.cyan,
                    roundedEdges: Radius.circular(10),
                    selectedGradientColor: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 255, 0, 221),
                        Color.fromARGB(255, 210, 61, 255)
                      ],
                    ),
                    unselectedGradientColor: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 202, 202, 202),
                        Color.fromARGB(255, 235, 235, 235)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: spacing_extra_small,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Spending Limit',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: sub_title,
                                    color: Color(card_header_grey_text)),
                              ),
                              Text(
                                'Used',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: sub_title,
                                    color: Color(card_header_grey_text)),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'RM 1,500.00',
                                style: TextStyle(
                                    color: Color(regular_text),
                                    fontWeight: FontWeight.w700,
                                    fontSize: sub_title),
                              ),
                              Text(
                                'RM 90.00',
                                style: TextStyle(
                                    color: Color(regular_text),
                                    fontWeight: FontWeight.w700,
                                    fontSize: sub_title),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(
                        height: 1,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Available',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: sub_title,
                                color: Color(card_header_grey_text)),
                          ),
                          Text(
                            'RM 1,410.00',
                            style: TextStyle(
                                fontSize: button_text,
                                fontWeight: FontWeight.w700,
                                color: Color(primary_color)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: spacing_small,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(grey_bg_deep),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeroIcon(
                              HeroIcons.heart,
                              color: Color(grey_bg_deep_text),
                              solid: true,
                            ),
                            SizedBox(width: spacing_extra_small),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Increase your spending limit and earn RM5",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: sub_title,
                                        fontWeight: FontWeight.bold,
                                        color: Color(grey_bg_deep_text)),
                                  ),
                                  Text(
                                    "Verify your MyKad to increase your spending limit and receive a complimentary RM5 voucher.",
                                    style: TextStyle(
                                        fontSize: small_text,
                                        color: Color(grey_bg_deep_text)),
                                  ),
                                  SizedBox(
                                    height: spacing_extra_small,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: button_height,
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                // ignore: prefer_const_constructors
                                primary: Color.fromARGB(255, 249, 226, 255),
                                side: BorderSide(
                                  width: 2.0,
                                  color: Color(primary_color),
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
                                "Verify MyKad",
                                style: TextStyle(
                                    fontSize: button_text,
                                    fontWeight: FontWeight.w700,
                                    color: Color(primary_color)),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Upcoming Payments',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: heading_title),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Allbills()));
                        },
                        child: Row(
                          children: [
                            Text(
                              'View All',
                              style: TextStyle(
                                fontSize: sub_title,
                                  color: Color(primary_color),
                                  fontWeight: FontWeight.w700),
                            ),
                            HeroIcon(
                              HeroIcons.chevronRight,
                              color: Color(primary_color),
                              size: 18,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '24 Apr 2022',
                                  style: TextStyle(
                                    fontSize: small_text,
                                      fontWeight: FontWeight.w700,
                                      color: Color(card_header_grey_text)),
                                )),
                            Card(
                              child: Container(
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                child: ListTile(
                                  leading: Container(
                                    height: 40,
                                    width: 40,
                                    child: CircleAvatar(
                                      radius: 30.0,
                                      backgroundColor:
                                          Color(merchant_avatar_bg),
                                    ),
                                  ),
                                  title: Row(
                                    children: [
                                      Text(
                                        'Merchant Name',
                                        style: TextStyle(
                                          color: Color(regular_text),
                                            fontWeight: FontWeight.w700,
                                            fontSize: sub_title),
                                      )
                                    ],
                                  ),
                                  trailing: Text(
                                    'RM 30.00',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: sub_title,
                                        color: Color(primary_color)),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: spacing_extra_small,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '16 Apr 2022',
                                 style: TextStyle(
                                    fontSize: small_text,
                                      fontWeight: FontWeight.w700,
                                      color: Color(card_header_grey_text)),
                                )),
                            Card(
                              child: Container(
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                child: ListTile(
                                  leading: Container(
                                    height: 40,
                                    width: 40,
                                    child: CircleAvatar(
                                      radius: 30.0,
                                      backgroundColor:
                                          Color(merchant_avatar_bg),
                                    ),
                                  ),
                                  title: Row(
                                    children: [
                                      Text(
                                        'Merchant Name',
                                       style: TextStyle(
                                          color: Color(regular_text),
                                            fontWeight: FontWeight.w700,
                                            fontSize: sub_title),
                                      )
                                    ],
                                  ),
                                  trailing: Text(
                                    'RM 30.00',
                                     style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: sub_title,
                                        color: Color(primary_color)),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
