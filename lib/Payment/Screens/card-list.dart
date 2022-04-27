// ignore_for_file: prefer__ructors, prefer_const_constructors

import 'package:aira_pay/Payment/Screens/add_card.dart';
import 'package:aira_pay/Payment/Screens/confirm-payment.dart';
import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Cardlist extends StatefulWidget {
  Cardlist({Key? key}) : super(key: key);

  @override
  State<Cardlist> createState() => _RegisterState();
}

class _RegisterState extends State<Cardlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: AppBar(
              // ignore: prefer_const_literals_to_create_immutables
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Addcardpage()));
                    },
                    icon: HeroIcon(
                      HeroIcons.plusCircle,
                      color: Color(primary_color),
                    ),
                  ),
                ),
              ],
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
                'Cards',
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
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Confirmpayment()));
                },
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                            padding: EdgeInsets.only(
                                top: 10, left: 20, right: 20, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                HeroIcon(
                                  HeroIcons.xCircle,
                                  solid: true,
                                  color: Color(week),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: Text(
                                  'This card can only be removed after your outstanding instalments have been completed',
                                  style: TextStyle(
                                      height: 1.2, color: Color(primary_text)),
                                ))
                              ],
                            )));
                  },
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    shadowColor: Color(fusica_text).withOpacity(0.2),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image:
                                    AssetImage('assets/images/Mastercard.png'),
                                height: 18,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(primary_color),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Primary",
                                  style: TextStyle(fontSize: tag_text),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '**** **** **** 9090',
                                style: TextStyle(
                                    fontSize: sub_title,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Valid thru: 10/23',
                                style: TextStyle(
                                    fontSize: small_text,
                                    color: Color(card_header_grey_text)),
                                textAlign: TextAlign.end,
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
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                          padding:
                              EdgeInsets.only(top: 40, left: 20, right: 20),
                          child: Container(
                            height: 200,
                            child: Column(
                              children: [
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
                                          borderRadius:
                                              BorderRadius.circular(35),
                                        ),
                                      ),
                                      onPressed: () {
                                        // Navigator.push(context,
                                        //     MaterialPageRoute(builder: (context) => Password()));

                                        Fluttertoast.showToast(
                                            msg:
                                                "Woohoo! Your primary card selection has been saved.",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.white,
                                            textColor: Color(primary_text),
                                            fontSize: sub_title);
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Set as Primary",
                                        style: TextStyle(
                                            fontSize: button_text,
                                            fontWeight: FontWeight.w700,
                                            color: Color(primary_text)),
                                      )),
                                ),
                                SizedBox(
                                  height: spacing_small,
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
                                          color: Color(week),
                                        ),
                                        elevation: 2,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                        ),
                                      ),
                                      onPressed: () {
                                        // Navigator.push(context,
                                        //     MaterialPageRoute(builder: (context) => Password()));
                                      },
                                      child: Text(
                                        "Remove Card",
                                        style: TextStyle(
                                            fontSize: button_text,
                                            fontWeight: FontWeight.w700,
                                            color: Color(week)),
                                      )),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: Container(
                                      margin: EdgeInsets.only(top: 20),
                                      child: HeroIcon(
                                        HeroIcons.xCircle,
                                        color: Color(text_grey),
                                        size: 50,
                                      )),
                                )
                              ],
                            ),
                          )));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  shadowColor: Color(fusica_text).withOpacity(0.2),
                  color: Colors.white,
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              image: AssetImage('assets/images/Mastercard.png'),
                              height: 18,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '**** **** **** 9090',
                              style: TextStyle(
                                  fontSize: sub_title,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Valid thru: 10/23',
                              style: TextStyle(
                                  fontSize: small_text,
                                  color: Color(card_header_grey_text)),
                              textAlign: TextAlign.end,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
