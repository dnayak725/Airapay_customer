// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/Payment/Screens/payment-success.dart';
import 'package:aira_pay/Payment/Screens/voucher-select.dart';
import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class Confirmpayment extends StatefulWidget {
  const Confirmpayment({Key? key}) : super(key: key);

  @override
  State<Confirmpayment> createState() => _RegisterState();
}

class _RegisterState extends State<Confirmpayment> {
  get toggleSwitch => null;
  bool _showContent = false;
  bool _showContent1 = false;
  bool _showContent2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: AppBar(
              backgroundColor: Color(grey_bg),
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
                'Confirm Payment',
                style: TextStyle(
                    color: Color(primary_text),
                    fontSize: app_tittle,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ),
        backgroundColor: Color(0xFFf8fafc),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: spacing_extra_small,
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
                          Container(
                            height: 40,
                            width: 40,
                            child: CircleAvatar(
                              radius: 30.0,
                              backgroundColor: Color(merchant_avatar_bg),
                            ),
                          ),
                          Text(
                            'Merchant Name',
                            style: TextStyle(
                                fontSize: sub_title,
                                fontWeight: FontWeight.w600,
                                color: Color(primary_text)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Bill Amount',
                            style: TextStyle(
                                color: Color(card_header_grey_text),
                                fontSize: sub_title),
                          ),
                          Text(
                            'RM 90.00',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: sub_title,
                                color: Color(primary_text)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Voucher / Promo Code',
                                style: TextStyle(
                                    color: Color(card_header_grey_text),
                                    fontSize: sub_title),
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Voucherselect()));
                            },
                            child: Row(
                              children: const [
                                Text(
                                  'Select',
                                  style: TextStyle(
                                      color: Color(primary_color),
                                      fontWeight: FontWeight.w700),
                                ),
                                Icon(
                                  Icons.chevron_right_sharp,
                                  color: Color(primary_color),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: spacing_small,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Buy Now, Pay Later',
                              style: TextStyle(
                                  fontSize: sub_title,
                                  fontWeight: FontWeight.w600,
                                  color: Color(primary_text)),
                            ),
                            Text(
                              'Split payment into monthly instalments',
                              style: TextStyle(
                                  color: Color(card_header_grey_text),
                                  fontSize: small_text),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Switch(
                          onChanged: toggleSwitch,
                          value: true,
                          activeColor: Color(primary_color),
                          activeTrackColor: Colors.yellow,
                          inactiveThumbColor: Color(primary_color),
                          inactiveTrackColor: Colors.grey,
                        ),
                      ],
                    )
                  ],
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
                      Column(children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _showContent = !_showContent;
                            });
                          },
                          child: ListTile(
                              title: Text(
                                'Pay in 2',
                                style: TextStyle(
                                    fontSize: button_text,
                                    fontWeight: FontWeight.w700),
                              ),
                              trailing: Container(
                                width: 120,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'RM 45.00',
                                      style: TextStyle(
                                          color: Color(primary_color),
                                          fontSize: button_text,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    IconButton(
                                      icon: HeroIcon(
                                        _showContent
                                            ? HeroIcons.chevronDown
                                            : HeroIcons.chevronUp,
                                        size: 15,
                                      ),
                                      color: Color(icon_gery),
                                      onPressed: () {
                                        setState(() {
                                          _showContent = !_showContent;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        _showContent
                            ? Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 15),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Text('Pay Today',
                                            style: TextStyle(
                                                fontSize: small_text,
                                                fontWeight: FontWeight.w700)),
                                        Text(
                                          'RM 30.00',
                                          style: TextStyle(
                                              fontSize: small_text,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: spacing_extra_small,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Text('3 Apr 2022',
                                            style: TextStyle(
                                                fontSize: small_text,
                                                fontWeight: FontWeight.w700,
                                                color: Color(text_grey))),
                                        Text(
                                          'RM 30.00',
                                          style: TextStyle(
                                              fontSize: small_text,
                                              fontWeight: FontWeight.w700,
                                              color: Color(text_grey)),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: spacing_extra_small,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Text('3 May 2022',
                                            style: TextStyle(
                                                fontSize: small_text,
                                                fontWeight: FontWeight.w700,
                                                color: Color(text_grey))),
                                        Text(
                                          'RM 30.00',
                                          style: TextStyle(
                                              fontSize: small_text,
                                              fontWeight: FontWeight.w700,
                                              color: Color(text_grey)),
                                        )
                                      ],
                                    )
                                  ],
                                ))
                            : Container()
                      ]),
                      Divider(
                        height: 1,
                      ),
                      Column(children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _showContent1 = !_showContent1;
                            });
                          },
                          child: ListTile(
                              title: Text(
                                'Pay in 3',
                                style: TextStyle(
                                    fontSize: button_text,
                                    fontWeight: FontWeight.w700,
                                    color: Color(card_header_grey_text)),
                              ),
                              trailing: Container(
                                width: 120,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'RM 45.00',
                                      style: TextStyle(
                                          color: Color(card_header_grey_text),
                                          fontSize: button_text,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    IconButton(
                                      icon: HeroIcon(
                                        _showContent1
                                            ? HeroIcons.chevronDown
                                            : HeroIcons.chevronUp,
                                        size: 15,
                                      ),
                                      color: Color(icon_gery),
                                      onPressed: () {
                                        setState(() {
                                          _showContent1 = !_showContent1;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        _showContent1
                            ? Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 15),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Text('Pay Today',
                                            style: TextStyle(
                                                fontSize: small_text,
                                                fontWeight: FontWeight.w700)),
                                        Text(
                                          'RM 30.00',
                                          style: TextStyle(
                                              fontSize: small_text,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: spacing_extra_small,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Text('3 Apr 2022',
                                            style: TextStyle(
                                                fontSize: small_text,
                                                fontWeight: FontWeight.w700,
                                                color: Color(text_grey))),
                                        Text(
                                          'RM 30.00',
                                          style: TextStyle(
                                              fontSize: small_text,
                                              fontWeight: FontWeight.w700,
                                              color: Color(text_grey)),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Text('3 May 2022',
                                            style: TextStyle(
                                                fontSize: small_text,
                                                fontWeight: FontWeight.w700,
                                                color: Color(text_grey))),
                                        Text(
                                          'RM 30.00',
                                          style: TextStyle(
                                              fontSize: small_text,
                                              fontWeight: FontWeight.w700,
                                              color: Color(text_grey)),
                                        )
                                      ],
                                    )
                                  ],
                                ))
                            : Container()
                      ]),
                      Divider(
                        height: 1,
                      ),
                      Column(children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _showContent2 = !_showContent2;
                            });
                          },
                          child: ListTile(
                              title: Text(
                                'Pay in 4',
                                style: TextStyle(
                                    fontSize: button_text,
                                    fontWeight: FontWeight.w700,
                                    color: Color(card_header_grey_text)),
                              ),
                              trailing: Container(
                                width: 120,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'RM 45.00',
                                      style: TextStyle(
                                          color: Color(card_header_grey_text),
                                          fontSize: button_text,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    IconButton(
                                      icon: HeroIcon(
                                        _showContent2
                                            ? HeroIcons.chevronDown
                                            : HeroIcons.chevronUp,
                                        size: 15,
                                      ),
                                      color: Color(icon_gery),
                                      onPressed: () {
                                        setState(() {
                                          _showContent2 = !_showContent2;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        _showContent2
                            ? Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 15),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Text('Pay Today',
                                            style: TextStyle(
                                                fontSize: small_text,
                                                fontWeight: FontWeight.w700)),
                                        Text(
                                          'RM 30.00',
                                          style: TextStyle(
                                              fontSize: small_text,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: spacing_extra_small,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Text('3 Apr 2022',
                                            style: TextStyle(
                                                fontSize: small_text,
                                                fontWeight: FontWeight.w700,
                                                color: Color(text_grey))),
                                        Text(
                                          'RM 30.00',
                                          style: TextStyle(
                                              fontSize: small_text,
                                              fontWeight: FontWeight.w700,
                                              color: Color(text_grey)),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Text('3 May 2022',
                                            style: TextStyle(
                                                fontSize: small_text,
                                                fontWeight: FontWeight.w700,
                                                color: Color(text_grey))),
                                        Text(
                                          'RM 30.00',
                                          style: TextStyle(
                                              fontSize: small_text,
                                              fontWeight: FontWeight.w700,
                                              color: Color(text_grey)),
                                        )
                                      ],
                                    )
                                  ],
                                ))
                            : Container()
                      ]),
                    ],
                  ),
                ),
                SizedBox(
                  height: spacing_small,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Terms & Conditions of instalment payment',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(card_header_grey_text),
                            fontSize: small_text),
                      ),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            'Read',
                            style: TextStyle(
                                fontSize: small_text,
                                color: Color(primary_color),
                                fontWeight: FontWeight.w700),
                          ),
                          HeroIcon(
                            HeroIcons.chevronRight,
                            color: Color(primary_color),
                            size: 18,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: spacing_small,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Payment Method',
                    style: TextStyle(
                        fontSize: sub_title,
                        fontWeight: FontWeight.w600,
                        color: Color(primary_text)),
                  ),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Image(
                            image: AssetImage('assets/images/Mastercard.png'),
                            height: 10,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '**** **** **** 9090',
                            style: TextStyle(
                                fontSize: sub_title,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Switch',
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
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: spacing_small,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Payment Amount',
                      style: TextStyle(
                          fontSize: sub_title,
                          color: Color(card_header_grey_text),
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'RM 45.00',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: sub_title,
                        color: Color(regular_text),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: spacing_extra_small,
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
                              builder: (context) => Successpayment()));
                    },
                    child: Text(
                      "Pay Now",
                      style: TextStyle(fontSize: button_text),
                    ),
                  ),
                ),
                SizedBox(
                  height: spacing_small,
                )
              ],
            ),
          ),
        ));
  }
}
