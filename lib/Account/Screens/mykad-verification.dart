// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heroicons/heroicons.dart';

import '../../Shop/Widgets/tabs.dart';

class Mykadverification extends StatefulWidget {
  const Mykadverification({Key? key}) : super(key: key);

  @override
  State<Mykadverification> createState() => _RegisterState();
}

class _RegisterState extends State<Mykadverification> {
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
              'Verify MyKad',
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
          padding:
              const EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Image.asset('assets/images/id-card.png', fit: BoxFit.cover)),
              SizedBox(
                height: spacing_small,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("• "),
                        Expanded(
                          child: Text('Do not use flash.',
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
                          child: Text('Ensure your MyKad is within the frame.',
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
              ),
              SizedBox(height: spacing_medium,),
              
              Container(
                  padding: const EdgeInsets.all(12),
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
                            HeroIcons.lockClosed,
                            color: Color(grey_bg_deep_text),
                            solid: true,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Your MyKad details are protected.",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(grey_bg_deep_text)),
                                ),
                                Text(
                                  "Rest assured that your MyKad details are kept secure and confidential.",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Color(grey_bg_deep_text)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: spacing_large,),
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
                      onPressed: () {},
                      child: Text(
                        "Take MyKad Photo",
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
