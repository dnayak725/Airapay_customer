// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/Shop/Providers/NotificationProvider.dart';
import 'package:aira_pay/Shop/Providers/PushNotificationProvider.dart';
import 'package:aira_pay/Shop/Screens/home.dart';
import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Providers/NotificationStatusProvider.dart';

class NotificationSceen extends StatefulWidget {
  const NotificationSceen({Key? key}) : super(key: key);

  @override
  State<NotificationSceen> createState() => _NotificationSceenState();
}

class _NotificationSceenState extends State<NotificationSceen> {
  @override
  var Token;
  var userId;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: AppBar(
            backgroundColor: Color(page_color),
            elevation: 0,
            // ignore: prefer_const_literals_to_create_immutables
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  top: 15,
                ),
                child: Text(
                  "Read All (${Provider.of<NotificationProvider>(context, listen: false).readnotification.length})",
                  style: TextStyle(
                      fontSize: button_text,
                      color: Color(primary_color),
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
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
              'Notifications',
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
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Divider(
              color: Color(tag_grey_bg),
              height: 1,
            ),
          ),
          Expanded(
            child: Consumer<NotificationProvider>(
                builder: (context, notificationData, child) {
              return notificationData.notificationData.length != 0
                  ? Container(
                      child: ListView.builder(
                          itemCount: notificationData.notificationData.length,
                          itemBuilder: (ctnx, i) {
                            return Padding(
                              padding: const EdgeInsets.all(0),
                              child: GestureDetector(
                                onTap: () async {
                                  var paramdata = {
                                    "token": Token,
                                    "notification_id": notificationData
                                        .notificationData[i].id
                                        .toString(),
                                    "user_id": userId
                                  };
                                  await Provider.of<NotificationStatusProvider>(
                                          context,
                                          listen: false)
                                      .notificationStatusfetch(paramdata);
                                  print("john");
                                  print(Provider.of<NotificationStatusProvider>(
                                          context,
                                          listen: false)
                                      .message);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0,
                                          color: Color(tag_grey_bg)),
                                    ),
                                  ),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    margin: EdgeInsets.only(bottom: 0),
                                    elevation: 0.3,
                                    color: notificationData
                                                .notificationData[i].readAt
                                                .toString() !=
                                            "null"
                                        ? Color(grey_bg_deep)
                                        : Color(page_color),
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(top: 10, bottom: 10),
                                      child: ListTile(
                                        dense: true,
                                        isThreeLine: true,
                                        title: Text(
                                          notificationData
                                              .notificationData[i].headtitle
                                              .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: sub_title,
                                            height: 1.2,
                                          ),
                                        ),
                                        subtitle: Column(
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                notificationData
                                                    .notificationData[i].message
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: small_text,
                                                    height: 1.3,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                notificationData
                                                    .notificationData[i].createdAt
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: small_text,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(black_text)),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  : Container();
            }),
          ),
        ],
      ),
    );
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    _getmobilenumber();
    _modalBottomSheetMenu();
  }

  _getmobilenumber() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Token = sharedPreferences.getString(
      "AuthToken",
    );
    userId = sharedPreferences.getString(
      "UserId",
    );
    var tokenparam = {"token": Token, "user_id": userId};
    await Provider.of<NotificationProvider>(context, listen: false)
        .Notificationfetch(tokenparam);
    print("john");
    print(Provider.of<NotificationProvider>(context, listen: false)
        .notificationData[0]
        .readAt);
  }

  void _modalBottomSheetMenu() async {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await showModalBottomSheet(
          context: context,
          builder: (builder) {
            return Container(
              height: 240,
                padding:
                    EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 10),
                child: Column(
                  children: [
                    Text(
                      'Stay in the loop!',
                      style: TextStyle(
                          fontSize: heading_title,
                          color: Color(primary_text),
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: spacing_small,
                    ),
                    Text(
                      'Turn this on to receive notifications on due payments, deals, and more!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: sub_title,
                          color: Color(primary_text),
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
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                            )),
                        onPressed: () async {
                          var paramdata = {
                            "token": Token,
                            "user_id": userId,
                            "device_id": "54452"
                          };
                          await Provider.of<PushNotificationProvider>(context,
                                  listen: false)
                              .PushNotificationfetch(paramdata);

                          print(Provider.of<PushNotificationProvider>(context,
                                  listen: false)
                              .message);
                          Fluttertoast.showToast(
                              msg: Provider.of<PushNotificationProvider>(
                                      context,
                                      listen: false)
                                  .message,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.white,
              textColor: Color(primary_text),
                              fontSize: sub_title);
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Enable Push Notifications",
                          style: TextStyle(fontSize: button_text),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: spacing_small,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        'Skip',
                        style: TextStyle(
                            fontSize: sub_title,
                            color: Color(primary_color),
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ));
          });
    });
  }
}
