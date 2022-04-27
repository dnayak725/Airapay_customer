import 'dart:convert';

import 'package:aira_pay/Auth/Api/service.dart';
import 'package:aira_pay/Auth/models/LoginModel.dart';
import 'package:aira_pay/Shop/Models/ExploreModel.dart';
import 'package:aira_pay/Shop/Models/HomeSliderModel.dart';
import 'package:aira_pay/Shop/Models/PersonalisecategoryModel.dart';
import 'package:aira_pay/Shop/Models/PromodealsModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PromoDealsProvider with ChangeNotifier {
  List<PromoDeals> PromoDealsData = [];
  List<GetCampaignDetails> getPromodeals = [];

  String status = "";

  // Future loginprovide(context, number) async {
  PromoDealsfetch(param) async {
    final response = await http.post(
      Uri.parse("https://airapay-ext.quocent.com/mobile/api/v1/promo-deals"),
      body: (param),
    );
    switch (response.statusCode) {
      case 200:
        var results = json.decode(response.body);

        PromoDealsData = [];
        getPromodeals = [];
        if (results['status'] == "success") {
          // print(results['categories']);
          status = results["status"];

          results["promo_deals"].forEach((item) {
            if (item["get_campaign_details"] != null) {
              item["get_campaign_details"].forEach((item4) {
                getPromodeals.add(GetCampaignDetails(
                  banner: item4["get_merchant"]["banner"],
                  logo: item4["get_merchant"]["logo"],
                  inStore: item4["get_merchant"]["instore"],
                  merchantTitle: item4["merchant_title"],
                  id: item4["id"],
                ));
              });
            }
            PromoDealsData.add(
              PromoDeals(
                id: item['id'],
                getCampaignDetails: getPromodeals,
                title: item["title"],
              ),
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
