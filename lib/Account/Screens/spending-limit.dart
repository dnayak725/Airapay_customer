// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/Account/Screens/email-verification.dart';
import 'package:aira_pay/Account/Screens/tier-list.dart';
import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../Shop/Widgets/tabs.dart';

class Spendinglimit extends StatefulWidget {
  const Spendinglimit({Key? key}) : super(key: key);

  @override
  State<Spendinglimit> createState() => _RegisterState();
}

class _RegisterState extends State<Spendinglimit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Tabs(0),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
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
                'Increase Spending Limit',
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
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your Current Tier',
                      style: TextStyle(
                        fontSize: heading_title,
                        fontWeight: FontWeight.w700,
                        color: Color(primary_text),
                      ),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: Color(icon_gery),
                          child: CircleAvatar(
                              radius: 8,
                              backgroundColor: Color.fromARGB(255, 95, 95, 95),
                              child: HeroIcon(
                                HeroIcons.star,
                                solid: true,
                                color: Colors.white,
                                size: 12,
                              )),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Silver',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(primary_text),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: spacing_small,
                ),
                Stack(
                  children: [
                    Positioned(
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 7,
                        ),
                        child: StepProgressIndicator(
                          totalSteps: 100,
                          currentStep: 50,
                          size: 18,
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
                              Color.fromARGB(255, 221, 221, 221)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Color(tag_grey_bg),
                          child: CircleAvatar(
                              radius: 13,
                              backgroundColor: Color(icon_gery),
                              child: HeroIcon(
                                HeroIcons.star,
                                solid: true,
                                color: Color(text_grey),
                                size: 20,
                              )),
                        ),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Color(icon_gery),
                          child: CircleAvatar(
                              radius: 13,
                              backgroundColor: Color.fromARGB(255, 95, 95, 95),
                              child: HeroIcon(
                                HeroIcons.star,
                                solid: true,
                                color: Colors.white,
                                size: 20,
                              )),
                        ),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Color(gold_color_bg_2),
                          child: CircleAvatar(
                              radius: 13,
                              backgroundColor: Color(gold_color_bg),
                              child: HeroIcon(
                                HeroIcons.star,
                                solid: true,
                                color: Color(gold_color),
                                size: 20,
                              )),
                        ),
                      ],
                    ))
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.13,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Basic',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color(primary_text),
                              ),
                            ),
                            Text(
                              'RM150',
                              style: TextStyle(
                                fontSize: tag_text,
                                color: Color(primary_text),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Silver',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(text_grey)),
                            ),
                            Text(
                              'up to RM3,000',
                              style: TextStyle(
                                fontSize: tag_text,
                                color: Color(primary_text),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Gold',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color(text_grey),
                              ),
                            ),
                            Text(
                              'up to RM10,000',
                              style: TextStyle(
                                fontSize: tag_text,
                                color: Color(primary_text),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: spacing_small,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TierList()));
                  },
                  child: Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      child: Text(
                        'See Tier List and Benefits',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(primary_color)),
                      )),
                ),
                SizedBox(
                  height: spacing_small,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color(grey_bg_deep),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Verify additional documents to increase your spending limit",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: sub_title,
                            fontWeight: FontWeight.bold,
                            color: Color(grey_bg_deep_text)),
                      ),
                      Text(
                        "Verify additional documents to get to the next tier and enjoy a larger spending limit + enhanced benefits!",
                        style: TextStyle(
                            fontSize: small_text,
                            color: Color(grey_bg_deep_text)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Verify',
                    style: TextStyle(
                      fontSize: heading_title,
                      fontWeight: FontWeight.w700,
                      color: Color(primary_text),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
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
                      Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: ListTile(
                          dense: true,
                          minLeadingWidth: 10,
                          leading: HeroIcon(
                            HeroIcons.user,
                            solid: true,
                            size: 18,
                            color: Color(primary_text),
                          ),
                          title: Text(
                            'MyKad',
                            style: TextStyle(
                              fontSize: sub_title,
                              fontWeight: FontWeight.w700,
                              color: Color(primary_text),
                            ),
                          ),
                          trailing: Container(
                            width: 74,
                            child: Row(
                              children: [
                                HeroIcon(
                                  HeroIcons.checkCircle,
                                  solid: true,
                                  size: 18,
                                  color: Color(success_text),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Verified',
                                  style: TextStyle(
                                    fontSize: sub_title,
                                    fontWeight: FontWeight.w700,
                                    color: Color(primary_text),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        height: 1,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Emailverification()));
                          },
                          child: ListTile(
                            dense: true,
                            minLeadingWidth: 10,
                            leading: HeroIcon(
                              HeroIcons.mail,
                              solid: true,
                              size: 18,
                              color: Color(primary_text),
                            ),
                            title: Text(
                              'Email Address',
                              style: TextStyle(
                                fontSize: sub_title,
                                fontWeight: FontWeight.w700,
                                color: Color(primary_text),
                              ),
                            ),
                            trailing: Container(
                              width: 74,
                              child: Row(
                                children: [
                                  HeroIcon(
                                    HeroIcons.checkCircle,
                                    solid: true,
                                    size: 18,
                                    color: Color(success_text),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Verified',
                                    style: TextStyle(
                                      fontSize: sub_title,
                                      fontWeight: FontWeight.w700,
                                      color: Color(primary_text),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        height: 1,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: ListTile(
                          dense: true,
                          minLeadingWidth: 10,
                          leading: HeroIcon(
                            HeroIcons.documentText,
                            solid: true,
                            size: 18,
                            color: Color(primary_text),
                          ),
                          title: Text(
                            'Employment documents',
                            style: TextStyle(
                              fontSize: sub_title,
                              fontWeight: FontWeight.w700,
                              color: Color(primary_text),
                            ),
                          ),
                          trailing: Container(
                            width: 36,
                            child: Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  // ignore: prefer_const_constructors
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: CircleAvatar(
                                      radius: 30.0,
                                      backgroundColor: Color(week),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                HeroIcon(
                                  HeroIcons.chevronRight,
                                  solid: true,
                                  size: 18,
                                  color: Color(icon_gery),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        height: 1,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: ListTile(
                          dense: true,
                          minLeadingWidth: 10,
                          leading: HeroIcon(
                            HeroIcons.documentText,
                            solid: true,
                            size: 18,
                            color: Color(primary_text),
                          ),
                          title: Text(
                            'Proof of Address',
                            style: TextStyle(
                              fontSize: sub_title,
                              fontWeight: FontWeight.w700,
                              color: Color(primary_text),
                            ),
                          ),
                          trailing: Container(
                            width: 36,
                            child: Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  // ignore: prefer_const_constructors
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: CircleAvatar(
                                      radius: 30.0,
                                      backgroundColor: Color(week),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                HeroIcon(
                                  HeroIcons.chevronRight,
                                  solid: true,
                                  size: 18,
                                  color: Color(icon_gery),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        height: 1,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: ListTile(
                          dense: true,
                          minLeadingWidth: 10,
                          leading: HeroIcon(
                            HeroIcons.documentText,
                            solid: true,
                            size: 18,
                            color: Color(primary_text),
                          ),
                          title: Text(
                            'Income documents',
                            style: TextStyle(
                              fontSize: sub_title,
                              fontWeight: FontWeight.w700,
                              color: Color(primary_text),
                            ),
                          ),
                          trailing: Container(
                            width: 84,
                            child: Row(
                              children: [
                                HeroIcon(
                                  HeroIcons.searchCircle,
                                  solid: true,
                                  size: 18,
                                  color: Color(gold_color),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'In Review',
                                  style: TextStyle(
                                    fontSize: sub_title,
                                    fontWeight: FontWeight.w700,
                                    color: Color(primary_text),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: spacing_small,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Status',
                    style: TextStyle(
                        fontSize: heading_title,
                        fontWeight: FontWeight.w700,
                        color: Color(grey_bg_deep_text)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
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
                      Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: ListTile(
                          dense: true,
                          minLeadingWidth: 10,
                          leading: HeroIcon(
                            HeroIcons.thumbUp,
                            solid: true,
                            size: 18,
                            color: Color(primary_text),
                          ),
                          title: Text(
                            'On-Time Payment',
                            style: TextStyle(
                              fontSize: sub_title,
                              fontWeight: FontWeight.w700,
                              color: Color(primary_text),
                            ),
                          ),
                          trailing: HeroIcon(
                            HeroIcons.checkCircle,
                            solid: true,
                            size: 18,
                            color: Color(success_text),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
