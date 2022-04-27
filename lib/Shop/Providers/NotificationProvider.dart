import 'dart:convert';

import 'package:aira_pay/Auth/Api/service.dart';
import 'package:aira_pay/Auth/models/LoginModel.dart';
import 'package:aira_pay/Shop/Models/AllNotificationModel.dart';
import 'package:aira_pay/Shop/Models/HomeSliderModel.dart';
import 'package:aira_pay/Shop/Models/PersonalisecategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NotificationProvider with ChangeNotifier {
  List<AllNotification> notificationData = [];

  String status = "";
  List<ReadNotification> readnotification = [];

  // Future loginprovide(context, number) async {
  Notificationfetch(param) async {
    final response = await http.post(
      Uri.parse("https://airapay-ext.quocent.com/mobile/api/v1/notification"),
      // headers: {
      //   "Content-Type": "application/json",
      //   // "ApiKey": AppConfig().apiKey,
      // },
      body: (param),
    );
    switch (response.statusCode) {
      case 200:
        var results = json.decode(response.body);
        notificationData = [];
        readnotification = [];

        if (results['status'] == "success") {
          // print(results['categories']);
          status = results["status"];

          results["notification"].forEach((item) {
            notificationData.add(
              AllNotification(
                  readNotify: readnotification,
                  message: item["message"],
                  headtitle: item["title"],
                  data: item["data"],
                  id: item["id"],
                  readAt: item["read_at"],
                  createdAt: item["created_at"],
                  type: item["type"],
                  url: item["url"],
                  userId: item["user_id"]),
            );
          });
          results["notification"].forEach((item2) {
            if (item2["read_at"].toString() != "null") {
              readnotification.add(ReadNotification(
                read: item2["read_at"],
              ));
            }
          });
          print(readnotification.length);
        } else {
          status = results["status"];
        }
        break;
      default:
        print("Error:" +
            response.statusCode.toString() +
            ": Something went wrong ");
        break;
    }

    notifyListeners();
  }
}
