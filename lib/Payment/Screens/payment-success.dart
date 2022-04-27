// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/Payment/Screens/my-bills.dart';
import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:getwidget/getwidget.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Successpayment extends StatefulWidget {
  const Successpayment({Key? key}) : super(key: key);

  @override
  State<Successpayment> createState() => _RegisterState();
}

class _RegisterState extends State<Successpayment> {
  get toggleSwitch => null;
  bool _showContent = false;
  bool _showContent1 = false;
  bool _showContent2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFf8fafc),
        body: Padding(
          padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Row(children: const <Widget>[
                      HeroIcon(
                        HeroIcons.badgeCheck,
                        color: Colors.green,
                        solid: true,
                      ),
                      SizedBox(
                        width: spacing_small,
                      ),
                      Text(
                        'Payment Successful',
                        style: TextStyle(
                          fontSize: app_tittle,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ])),
                SizedBox(
                  height: spacing_small,
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            child: CircleAvatar(
                              radius: 30.0,
                              backgroundColor:
                                  Color(tag_grey_bg),
                            ),
                          ),
                          SizedBox(
                            width: spacing_extra_small,
                          ),
                          Text(
                            'Merchant Name',
                            style: TextStyle(
                              color: Color(regular_text),
                                fontSize: sub_title, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Paid Amount',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color(card_header_grey_text),
                                      fontSize: sub_title),
                                ),
                                Text(
                                  'RM 30.00',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: sub_title,
                                      color: Color(regular_text)
                                      ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Transaction ID',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color(card_header_grey_text),
                                      fontSize: sub_title),
                                ),
                                Text(
                                  'AD100098',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: sub_title,
                                      color: Color(regular_text)
                                      ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Timestamp',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color(card_header_grey_text),
                                      fontSize: sub_title),
                                ),
                                Text(
                                  '4 Mar 2022, 5:20 PM',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: sub_title,
                                      color: Color(regular_text)
                                      ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Payment Method',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color(card_header_grey_text),
                                      fontSize: sub_title),
                                ),
                                Row(
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/Mastercard.png'),
                                      height: 12,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '**** 9090',
                                      style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: sub_title,
                                      color: Color(regular_text)
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: spacing_small,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
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
                            Row(
                              children: [
                                Text(
                                  'Pay in 3',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(card_header_grey_text),
                                      fontSize: sub_title),
                                )
                              ],
                            ),
                            SizedBox(
                              height: spacing_extra_small,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    HeroIcon(
                                      HeroIcons.checkCircle,
                                      color: Color(success_text),
                                      size: 17,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Paid Today',
                                      style: TextStyle(
                                          fontSize: sub_title,
                                          fontWeight: FontWeight.w600,
                                          color: Color(success_text)),
                                    )
                                  ],
                                ),
                                Text('RM 30.00',
                                    style: TextStyle(
                                        fontSize: sub_title,
                                        fontWeight: FontWeight.w600,
                                        color: Color(success_text)))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    HeroIcon(
                                      HeroIcons.xCircle,
                                      color: Color(card_header_grey_text),
                                      size: 17,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Paid Today',
                                      style: TextStyle(
                                          fontSize: sub_title,
                                          fontWeight: FontWeight.w600,
                                          color: Color(card_header_grey_text)),
                                    )
                                  ],
                                ),
                                Text('RM 30.00',
                                    style: TextStyle(
                                        fontSize: sub_title,
                                        fontWeight: FontWeight.w600,
                                        color: Color(card_header_grey_text)))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    HeroIcon(
                                      HeroIcons.xCircle,
                                      color: Color(card_header_grey_text),
                                      size: 17,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Paid Today',
                                      style: TextStyle(
                                          fontSize: sub_title,
                                          fontWeight: FontWeight.w600,
                                          color: Color(card_header_grey_text)),
                                    )
                                  ],
                                ),
                                Text('RM 30.00',
                                    style: TextStyle(
                                        fontSize: sub_title,
                                        fontWeight: FontWeight.w600,
                                        color: Color(card_header_grey_text)))
                              ],
                            ),
                            SizedBox(
                              height: spacing_extra_small,
                            ),
                            Divider(
                              height: 1,
                            ),
                            SizedBox(
                              height: spacing_extra_small,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total ',
                                  style: TextStyle(
                                          fontSize: sub_title,
                                          fontWeight: FontWeight.w600,
                                          color: Color(card_header_grey_text)),
                                ),
                                Text('RM 90.00',
                                    style: TextStyle(
                                          fontSize: sub_title,
                                          fontWeight: FontWeight.w600,
                                          color: Color(regular_text)),)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: spacing_small,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your subsequent monthly instalments will be automatically deducted from your primary card. A Late Payment Fee of RM15.00 will be charged for every late payment',
                        style: TextStyle(color: Color(card_header_grey_text), fontSize: small_text),
                      ),
                    ],
                  ),
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
                          borderRadius: BorderRadius.circular(35),
                        )),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Mybills()));
                    },
                    child: Text(
                      "Done",
                      style: TextStyle(fontSize: button_text),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
