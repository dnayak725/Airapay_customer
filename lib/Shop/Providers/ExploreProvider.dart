import 'dart:convert';

import 'package:aira_pay/Auth/Api/service.dart';
import 'package:aira_pay/Auth/models/LoginModel.dart';
import 'package:aira_pay/Shop/Models/ExploreModel.dart';
import 'package:aira_pay/Shop/Models/HomeSliderModel.dart';
import 'package:aira_pay/Shop/Models/PersonalisecategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExploreProvider with ChangeNotifier {
  List<MerchantDetails> ExploreMerchants = [];
  List<GetCategory> getCategoryDetails = [];

  String status = "fetching";

  // Future loginprovide(context, number) async {
  ExploreDatafetch(param) async {
    final response = await http.post(
      Uri.parse("https://airapay-ext.quocent.com/mobile/api/v1/explore"),
      body: (param),
    );
    switch (response.statusCode) {
      case 200:
        var results = json.decode(response.body);
       ExploreMerchants = [];
         
        if (results['status'] == "success") {
          // print(results['categories']);
          status = results["status"];

        
          results["merchant_details"].forEach((item) {
              List<GetCategory> temp = [];
            if (item["get_category"] != null) {
              item["get_category"].forEach((item3) {
                temp.add(GetCategory(
                  categoryId: item3["category_id"],
                  categoryDetailsname: item3["get_category_details"]["name"],
                  merchantId: item3["merchant_id"],
                  id: item3["id"],
              
                ));
              });
            }
            ExploreMerchants.add(
              MerchantDetails(
                id: item['id'],
                userId: item['user_id'],
                apikey: item["api_key"],
                banner: item["banner"],
                callbackUrl: item["callback_url"],
                code: item["code"],
                getCategory: temp,
                instore: item["instore"],
                ipay_88Id: item["ipay_88_id"],
                isActive: item["is_active"],
                logo: item["logo"],
                merchantRateId: item["merchant_rate_id"],
                merchantRateId_2: item["merchant_rate_id_2"],
                merchantRateId_3: item["merchant_rate_id_3"],
                merchantRateId_6: item["merchant_rate_id_6"],
                name: item["name"],
                onlineUrl: item["online_url"],
                parentId: item["parent_id"],
                redirectUrl: item["redirect_url"],
             
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
