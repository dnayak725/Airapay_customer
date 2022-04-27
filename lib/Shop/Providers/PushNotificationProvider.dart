import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PushNotificationProvider with ChangeNotifier {
  String message = "";

  String status = "";

  // Future loginprovide(context, number) async {
PushNotificationfetch(param) async {
    final response = await http.post(
      Uri.parse(
          "https://airapay-ext.quocent.com/mobile/api/v1/push-notification"),
      // headers: {
      //   "Content-Type": "application/json",
      //   // "ApiKey": AppConfig().apiKey,
      // },
      body: (param),
    );
    switch (response.statusCode) {
      case 200:
        var results = json.decode(response.body);

        if (results['status'] == "success") {
          // print(results['categories']);
          status = results["status"];
            message = results["message"];

        
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
