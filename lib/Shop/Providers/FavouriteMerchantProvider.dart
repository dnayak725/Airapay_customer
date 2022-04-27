import 'dart:convert';

import 'package:aira_pay/Shop/Models/SearchMerchantModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FavoriteMerchantProvider with ChangeNotifier {
  String message = "";

  String status = "";

  // Future loginprovide(context, number) async {
  FavouriteMerchantfetch(param) async {
    final response = await http.post(
      Uri.parse(
          "https://airapay-ext.quocent.com/mobile/api/v1/favorite-merchant"),
      // headers: {
      //   "Content-Type": "application/json",
      //   // "ApiKey": AppConfig().apiKey,
      // },
      body: (param),
    );
    switch (response.statusCode) {
      case 200:
        var results = json.decode(response.body);
        print(results);
        if (results['status'] == "success") {
          // print(results['categories']);
          status = results["status"];
          message = results["message"];
        } else {
          status = results["status"];
          message = results["message"];
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
