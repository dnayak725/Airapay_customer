// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:aira_pay/Account/Screens/following.dart';
import 'package:aira_pay/Account/Screens/mykad-verification.dart';
import 'package:aira_pay/Account/Screens/profile-update.dart';
import 'package:aira_pay/Account/Screens/refer-friend.dart';
import 'package:aira_pay/Account/Screens/security-setting.dart';
import 'package:aira_pay/Account/Screens/spending-limit.dart';
import 'package:aira_pay/Account/Screens/tier-list.dart';
import 'package:aira_pay/Auth/Providers/LoginProvider.dart';
import 'package:aira_pay/Auth/Screens/register.dart';
import 'package:aira_pay/Payment/Screens/card-list.dart';
import 'package:aira_pay/Payment/Screens/voucher-select.dart';
import 'package:aira_pay/Shop/Screens/notification.dart';
import 'package:aira_pay/Shop/Screens/personalise_screen.dart';
import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Auth/Providers/CustomerDetailsProvider.dart';
import '../../Shop/Widgets/tabs.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _RegisterState();
}

class _RegisterState extends State<Account> {
  @override
  var Customername;
  var mobileNumber;
  var profileimage;
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.18),
                spreadRadius: 10,
                blurRadius: 3,
                offset: Offset(0, 8), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              child: Tabs(0)),
        ),
        appBar: PreferredSize(
                preferredSize: Size.fromHeight(90.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: AppBar(
              leadingWidth: 80,
               automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Color(grey_bg),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(0),
                ),),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 7),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xFFF2E3F4)),
                    alignment: Alignment.center,
                    height: 40,
                    width: 50,
                    child: Stack(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotificationSceen()),
                            );
                          },
                          child: HeroIcon(
                            HeroIcons.bell,
                            solid: true,
                            color: Color(primary_color),
                            size: icon_size,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              leading: Container(
                width: 55,
                height: 55,
                // ignore: prefer_const_constructors
                child: Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                      Provider.of<CustomerDetailsProvider>(context, listen: false)
                          .userDetails
                          .profilepic,
                    ),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              title: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      Provider.of<CustomerDetailsProvider>(context, listen: false)
                          .userDetails
                          .customerName,
                      style: TextStyle(
                          color: Color(primary_text),
                          fontSize: app_tittle,
                          fontWeight: FontWeight.w900,
                          height: 1),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          '+ ${Provider.of<CustomerDetailsProvider>(context, listen: false)
                              .userDetails
                              .phoneNumber}',
                          style: TextStyle(
                              fontSize: sub_title, fontWeight: FontWeight.w500,color: Color(regular_text)),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20),
                           color: Color(tag_grey_bg)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Tier:Basic",
                            style: TextStyle(color: Color(regular_text,),fontSize: 12),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   elevation: 0,
        //   backgroundColor: Color(grey_bg),
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.vertical(
        //       bottom: Radius.circular(0),
        //     ),
        //   ),
        //   bottom: PreferredSize(
        //       child: Padding(
        //         padding:
        //             const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        //         child: Row(
        //           children: [
        //             Container(
        //               width: 55,
        //               height: 55,
        //               // ignore: prefer_const_constructors
        //               child: Align(
        //                 alignment: Alignment.topRight,
        //                 child: CircleAvatar(
        //                   radius: 30.0,
        //                   backgroundImage: NetworkImage(
        //                     Provider.of<CustomerDetailsProvider>(context,
        //                             listen: false)
        //                         .userDetails
        //                         .profilepic,
        //                   ),
        //                   backgroundColor: Colors.white,
        //                 ),
        //               ),
        //             ),
        //             Padding(
        //               padding: const EdgeInsets.all(10.0),
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Container(
        //                     child: Text(
        //                       Provider.of<CustomerDetailsProvider>(context,
        //                             listen: false)
        //                         .userDetails
        //                         .customerName,
        //                       style: TextStyle(
        //                           color: Color(primary_text),
        //                           fontSize: app_tittle,
        //                           fontWeight: FontWeight.w900,
        //                           height: 1),
        //                     ),
        //                   ),
        //                   Row(
        //                     children: [
        //                       Container(
        //                           child: Text(
        //                          Provider.of<CustomerDetailsProvider>(context,
        //                             listen: false)
        //                         .userDetails
        //                         .phoneNumber,
        //                         style: TextStyle(
        //                             fontSize: sub_title,
        //                             fontWeight: FontWeight.w500),
        //                       )),
        //                       Padding(
        //                         padding: const EdgeInsets.all(5),
        //                         child: Container(
        //                             decoration: BoxDecoration(
        //                               borderRadius: BorderRadius.circular(3),
        //                               color: Color(tag_grey_bg),
        //                             ),
        //                             child: Padding(
        //                               padding: const EdgeInsets.symmetric(
        //                                   horizontal: 10),
        //                               child: Text(
        //                                 "Tier:Basic",
        //                                 style: TextStyle(
        //                                     color: Color(regular_text)),
        //                               ),
        //                             )),
        //                       ),
        //                     ],
        //                   ),
        //                 ],
        //               ),
        //             ),
        //             Align(
        //               alignment: Alignment.centerRight,
        //               child: Container(
        //                 decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(50),
        //                   color: Color(grey_bg),
        //                 ),
        //                 alignment: Alignment.centerRight,
        //                 height: 43,
        //                 width: 43,
        //                 margin: EdgeInsets.only(top: 6, left: 20),
        //                 child: Stack(
        //                   // ignore: prefer_const_literals_to_create_immutables
        //                   children: [
        //                     GestureDetector(
        //                       onTap: () {
        //                         Navigator.push(
        //                           context,
        //                           MaterialPageRoute(
        //                               builder: (context) =>
        //                                   NotificationSceen()),
        //                         );
        //                       },
        //                       child: HeroIcon(
        //                         HeroIcons.bell,
        //                         solid: true,
        //                         color: Color(primary_color),
        //                         size: 22,
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       preferredSize: Size.fromHeight(50.0)),
        // ),
        backgroundColor: Color(0xFFf8fafc),
        body: Padding(
          padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 22, left: 30, bottom: 22, right: 30),
                  margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(148, 163, 184, 0.12),
                          blurRadius: 3.0,
                        ),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Voucherselect()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                width: spacing_medium,
                                child: HeroIcon(
                                  HeroIcons.ticket,
                                  size: 18,
                                ),
                              ),
                              Text(
                                'Voucher',
                                style: TextStyle(
                                    fontSize: small_text,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '23',
                                style: TextStyle(
                                    fontSize: small_text,
                                    color: Color(primary_color),
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Following()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                width: spacing_medium,
                                child: HeroIcon(
                                  HeroIcons.heart,
                                  size: 18,
                                ),
                              ),
                              Text(
                                'Following',
                                style: TextStyle(
                                    fontSize: small_text,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '15',
                                style: TextStyle(
                                    fontSize: small_text,
                                    color: Color(primary_color),
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Cardlist()));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 5),
                                  width: spacing_medium,
                                  child: HeroIcon(
                                    HeroIcons.creditCard,
                                    size: 18,
                                  ),
                                ),
                                Text(
                                  'Cards',
                                  style: TextStyle(
                                      fontSize: small_text,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '2',
                                  style: TextStyle(
                                      fontSize: small_text,
                                      color: Color(primary_color),
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  padding: const EdgeInsets.all(16),
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
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.70,
                                child: Text(
                                  "Increase your spending limit and earn RM5",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(grey_bg_deep_text),
                                      fontSize: sub_title,
                                      overflow: TextOverflow.clip),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.70,
                                child: Text(
                                  "Verify your MyKad to increase your spending limit and receive a complimentary RM5 voucher.",
                                  style: TextStyle(
                                      fontSize: small_text,
                                      color: Color(grey_bg_deep_text),
                                      overflow: TextOverflow.clip),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: button_height,
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Mykadverification()));
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
                SizedBox(
                  height: 16,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 236, 236, 236),
                          blurRadius: 4.0,
                        ),
                      ]),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          top: 6,
                          bottom: 6,
                        ),
                        child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Spendinglimit()));
                            },
                            child: ListTile(
                              dense: true,
                              minLeadingWidth: 3,
                              leading: HeroIcon(
                                HeroIcons.chartBar,
                                solid: true,
                                color: Color(primary_text),
                                size: 16,
                              ),
                              title: Text(
                                'Increase Spending Limit',
                                style: TextStyle(
                                    fontSize: sub_title,
                                    fontWeight: FontWeight.w700,
                                    color: Color(primary_text)),
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
                            )),
                      ),
                      Divider(
                        height: 1,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: 6,
                          bottom: 6,
                        ),
                        child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PersonaliseScreen()));
                            },
                            child: ListTile(
                              dense: true,
                              minLeadingWidth: 5,
                              leading: HeroIcon(
                                HeroIcons.deviceTablet,
                                solid: true,
                                color: Color(primary_text),
                              ),
                              title: Text(
                                'Personalise My Experience',
                                style: TextStyle(
                                    fontSize: sub_title,
                                    fontWeight: FontWeight.w700,
                                    color: Color(primary_text)),
                              ),
                              trailing: HeroIcon(
                                HeroIcons.chevronRight,
                                size: 18,
                                color: Color(icon_gery),
                              ),
                            )),
                      ),
                      Divider(
                        height: 1,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: 6,
                          bottom: 6,
                        ),
                        child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Profileupdate()));
                            },
                            child: ListTile(
                              dense: true,
                              minLeadingWidth: 5,
                              leading: HeroIcon(
                                HeroIcons.user,
                                solid: true,
                                color: Color(primary_text),
                              ),
                              title: Text(
                                'Update My Profile',
                                style: TextStyle(
                                    fontSize: sub_title,
                                    fontWeight: FontWeight.w700,
                                    color: Color(primary_text)),
                              ),
                              trailing: HeroIcon(
                                HeroIcons.chevronRight,
                                size: 18,
                                color: Color(icon_gery),
                              ),
                            )),
                      ),
                      Divider(
                        height: 1,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: 6,
                          bottom: 6,
                        ),
                        child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Securitysetting()),
                              );
                            },
                            child: ListTile(
                              dense: true,
                              minLeadingWidth: 5,
                              leading: HeroIcon(
                                HeroIcons.lockClosed,
                                solid: true,
                                color: Color(primary_text),
                              ),
                              title: Text(
                                'Security Settings',
                                style: TextStyle(
                                  fontSize: sub_title,
                                  fontWeight: FontWeight.w700,
                                  color: Color(primary_text),
                                ),
                              ),
                              trailing: HeroIcon(
                                HeroIcons.chevronRight,
                                size: 18,
                                color: Color(icon_gery),
                              ),
                            )),
                      ),
                      Divider(
                        height: 1,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: 6,
                          bottom: 6,
                        ),
                        child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Referfriend()),
                              );
                            },
                            child: ListTile(
                              dense: true,
                              minLeadingWidth: 5,
                              leading: HeroIcon(HeroIcons.userAdd,
                                  solid: true, color: Color(primary_text)),
                              title: Text(
                                'Refer a friend',
                                style: TextStyle(
                                    fontSize: sub_title,
                                    fontWeight: FontWeight.w700,
                                    color: Color(primary_text)),
                              ),
                              trailing: HeroIcon(HeroIcons.chevronRight,
                                  size: 18, color: Color(icon_gery)),
                            )),
                      ),
                      Divider(
                        height: 1,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: 6,
                          bottom: 6,
                        ),
                        child: FlatButton(
                            onPressed: () async {
                              _logOut();
                            },
                            child: ListTile(
                              dense: true,
                              minLeadingWidth: 5,
                              leading: HeroIcon(
                                HeroIcons.logout,
                                solid: true,
                                color: Color(week),
                              ),
                              title: Text(
                                'Sign Out',
                                style: TextStyle(
                                    color: Color(week),
                                    fontSize: sub_title,
                                    fontWeight: FontWeight.w700),
                              ),
                              trailing: HeroIcon(HeroIcons.chevronRight,
                                  size: 18, color: Color(icon_gery)),
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 236, 236, 236),
                          blurRadius: 4.0,
                        ),
                      ]),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          top: 6,
                          bottom: 6,
                        ),
                        child: FlatButton(
                            onPressed: () {},
                            child: ListTile(
                              dense: true,
                              minLeadingWidth: 5,
                              leading: HeroIcon(
                                HeroIcons.questionMarkCircle,
                                solid: true,
                                color: Color(primary_text),
                              ),
                              title: Text(
                                'FAQ',
                                style: TextStyle(
                                  fontSize: sub_title,
                                  fontWeight: FontWeight.w700,
                                  color: Color(primary_text),
                                ),
                              ),
                              trailing: HeroIcon(HeroIcons.chevronRight,
                                  size: 18, color: Color(icon_gery)),
                            )),
                      ),
                      Divider(
                        height: 1,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: 6,
                          bottom: 6,
                        ),
                        child: FlatButton(
                            onPressed: () {},
                            child: ListTile(
                              dense: true,
                              minLeadingWidth: 5,
                              leading: HeroIcon(
                                HeroIcons.chatAlt2,
                                solid: true,
                                color: Color(primary_text),
                              ),
                              title: Text(
                                'Contact Us',
                                style: TextStyle(
                                  fontSize: sub_title,
                                  fontWeight: FontWeight.w700,
                                  color: Color(primary_text),
                                ),
                              ),
                              trailing: HeroIcon(HeroIcons.chevronRight,
                                  size: 18, color: Color(icon_gery)),
                            )),
                      ),
                      Divider(
                        height: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Close Account',
                    style: TextStyle(
                        fontSize: sub_title,
                        fontWeight: FontWeight.w700,
                        color: Color(week)),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    // _providerLoginData();
  }

  // _providerLoginData() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   var Cname = sharedPreferences.getString(
  //     "CustomerName",
  //   );
  //   var number = sharedPreferences.getString("mobilenumber");
  //   var profilepic = sharedPreferences.getString("profilepic");
  //   setState(() {
  //     mobileNumber = number;
  //     Customername = Cname;
  //     profileimage = profilepic;
  //   });
  // }

  _logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    await Provider.of<CustomerDetailsProvider>(context, listen: false).reset();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Register()));
  }
}
