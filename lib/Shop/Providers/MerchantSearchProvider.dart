import 'dart:convert';

import 'package:aira_pay/Auth/Api/service.dart';
import 'package:aira_pay/Auth/models/LoginModel.dart';
import 'package:aira_pay/Payment/Models/AllbillsModel.dart';
import 'package:aira_pay/Shop/Models/HomeSliderModel.dart';
import 'package:aira_pay/Shop/Models/PersonalisecategoryModel.dart';
import 'package:aira_pay/Shop/Models/SearchMerchantModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MerchantSearchProvider with ChangeNotifier {
  List<MerchantSearch> MerchantSearchData = [];
  List<GetSearchCategory> getCatMerchantDetails = [];
  String status = "";

  // Future loginprovide(context, number) async {
  SearchMerchantfetch(param) async {
    final response = await http.post(
      Uri.parse(
          "https://airapay-ext.quocent.com/mobile/api/v1/search-merchants"),
      // headers: {
      //   "Content-Type": "application/json",
      //   // "ApiKey": AppConfig().apiKey,
      // },
      body: (param),
    );
    switch (response.statusCode) {
      case 200:
        var results = json.decode(response.body);
        MerchantSearchData = [];
        getCatMerchantDetails = [];
        if (results['status'] == "success") {
          // print(results['categories']);
          status = results["status"];

          results["merchant_search"].forEach((item) {
            List<GetSearchCategory> temp = [];
            if (item["get_category"] != null) {
              item["get_category"].forEach((item3) {
                temp.add(GetSearchCategory(
                  id: item3["id"],
                  categoryDetailsname: item3["get_category_details"]["name"],
                ));
              });
            }
            MerchantSearchData.add(
              MerchantSearch(
                getCategory: temp,
                id: item['id'],
                apikey: item["api_key"],
                banner: item["banner"],
                code: item["code"],
                instore: item["instore"],
                ipay_88Id: item["ipay_88_id"],
                isActive: item["is_active"],
                logo: item["logo"],
                merchantRateId: item["merchant_rate_id"],
                merchantRateId_2: item["merchant_rate_id_2"],
                merchantRateId_3: item["merchant_rate_id_2"],
                merchantRateId_6: item["merchant_rate_id_6"],
                name: item["name"],
                onlineUrl: item["online_url"],
                parentId: item["parent_id"],
                redirectUrl: item["redirect_url"],
                userId: item["user_id"],
                callbackUrl: item["callback_url"],
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
