// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:getwidget/getwidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Shop/Widgets/tabs.dart';

class Voucher extends StatefulWidget {
  const Voucher({Key? key}) : super(key: key);

  @override
  State<Voucher> createState() => _RegisterState();
}

bool _value = false;
int val = -1;

class _RegisterState extends State<Voucher> {
  get toggleSwitch => null;
  bool _showContent = false;
  bool _showContent1 = false;
  bool _showContent2 = false;
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
                'Vouchers',
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
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 36,
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: Card(
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 20),
                        child: Expanded(
                          child: Container(
                            child: TextFormField(
                              // ignore: unnecessary_new
                              decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintStyle:
                                      TextStyle(color: Color(label_grey)),
                                  hintText: "Enter promo code"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  SizedBox(
                    height: 36,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(disable_color),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          )),
                      onPressed: () {},
                      child: Text(
                        "Apply",
                        style: TextStyle(fontSize: sub_title),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: spacing_small,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text('Platform Vouchers',
                    style: TextStyle(
                      fontSize: sub_title,
                      color: Color(regular_text),
                      fontWeight: FontWeight.w600,
                    )),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (ctnx, i) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Color(label_grey),
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                              bottomLeft:
                                                  Radius.circular(10.0))),
                                      width: 80,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            children: [
                                              HeroIcon(
                                                HeroIcons.ticket,
                                                color: Color(primary_color),
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '10% Of',
                                                style: TextStyle(
                                                    color: Color(regular_text),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: sub_title),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          'Minimum Spend RM50',
                                          style: TextStyle(
                                              height: 1.2,
                                              color: Color(regular_text),
                                              fontSize: small_text),
                                        ),
                                        Text(
                                          'Valid until 30 Mar 2022',
                                          style: TextStyle(
                                              height: 1.2,
                                              color: Color(regular_text),
                                              fontSize: small_text),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'T&C',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: small_text,
                                              color: Color(primary_color),
                                              height: 1.2),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // VerticalDivider(),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text('Shop Vouchers',
                    style: TextStyle(
                      fontSize: sub_title,
                      color: Color(regular_text),
                      fontWeight: FontWeight.w600,
                    )),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (ctnx, i) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Color(label_grey),
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                              bottomLeft:
                                                  Radius.circular(10.0))),
                                      width: 80,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            children: [
                                              HeroIcon(
                                                HeroIcons.ticket,
                                                color: Color(primary_color),
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '10% Of',
                                                style: TextStyle(
                                                    color: Color(regular_text),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: sub_title),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          'Minimum Spend RM50',
                                          style: TextStyle(
                                              height: 1.2,
                                              color: Color(regular_text),
                                              fontSize: small_text),
                                        ),
                                        Text(
                                          'Valid until 30 Mar 2022',
                                          style: TextStyle(
                                              height: 1.2,
                                              color: Color(regular_text),
                                              fontSize: small_text),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'T&C',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: small_text,
                                              color: Color(primary_color),
                                              height: 1.2),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // VerticalDivider(),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
