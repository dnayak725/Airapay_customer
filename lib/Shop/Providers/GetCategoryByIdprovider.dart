import 'dart:convert';

import 'package:aira_pay/Auth/Api/service.dart';
import 'package:aira_pay/Auth/models/LoginModel.dart';
import 'package:aira_pay/Shop/Models/ExploreModel.dart';
import 'package:aira_pay/Shop/Models/GetCategorybyIdModel.dart';
import 'package:aira_pay/Shop/Models/HomeSliderModel.dart';
import 'package:aira_pay/Shop/Models/PersonalisecategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetCatByIdMerchantProvider with ChangeNotifier {
  List<GetCategoryMerchant> getCatMerchants = [];
  List<GetByIDMerchant> getCategoryIdMerchant = [];

  String status = "";

  // Future loginprovide(context, number) async {
  categorymerchantfetch(param) async {
    final response = await http.post(
      Uri.parse(
          "https://airapay-ext.quocent.com/mobile/api/v1/get-merchant-by-category"),
      body: (param),
    );
    switch (response.statusCode) {
      case 200:
        var results = json.decode(response.body);
        getCatMerchants = [];

        if (results['status'] == "success") {
          // print(results['categories']);
          status = results["status"];

          results["all_merchant"].forEach((item) {
            List<GetByIDMerchant> temp = [];
            if (item["get_category"] != null) {
              item["get_category"].forEach((item3) {
                temp.add(GetByIDMerchant(
                  categoryId: item3["id"],
                  categoryDetailsName: item3["get_category_details"]["name"],
                ));
              });
            }
            getCatMerchants.add(
              GetCategoryMerchant(
                id: item['id'],
                userId: item['user_id'],
                apikey: item["api_key"],
                banner: item["banner"],
                getCategory: temp,
                code: item["code"],
                instore: item["instore"],
                ipay_88Id: item["ipay_88_id"],
                isActive: item["is_active"],
                logo: item["logo"],
                name: item["name"],
                onlineUrl: item["online_url"],
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
