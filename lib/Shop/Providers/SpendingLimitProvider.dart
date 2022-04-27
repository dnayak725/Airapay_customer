import 'dart:convert';

import 'package:aira_pay/Auth/Api/service.dart';
import 'package:aira_pay/Auth/models/LoginModel.dart';
import 'package:aira_pay/Shop/Models/ExploreModel.dart';
import 'package:aira_pay/Shop/Models/HomeSliderModel.dart';
import 'package:aira_pay/Shop/Models/PersonalisecategoryModel.dart';
import 'package:aira_pay/Shop/Models/PromodealsModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Models/SpendingLimitModel.dart';

class SpendingLimitProvider with ChangeNotifier {
  List<CheckSpendingLimit> spendingLimit = [];

  String status = "";

  // Future loginprovide(context, number) async {
  SpendingLimitfetch(param) async {
    final response = await http.post(
      Uri.parse(
          "https://airapay-ext.quocent.com/mobile/api/v1/check-spending-limit"),
      body: (param),
    );
    switch (response.statusCode) {
      case 200:
        var results = json.decode(response.body);

        spendingLimit = [];

        if (results['status'] == "success") {
          // print(results['categories']);
          status = results["status"];

          results["check_spending_limit"].forEach((item) {
            spendingLimit.add(
              CheckSpendingLimit(
                  id: item['id'],
                  installments: item["installments"],
                  spendingLimit: item["spending_limit"]),
            );
          });
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
