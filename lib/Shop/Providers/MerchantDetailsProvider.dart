import 'dart:convert';

import 'package:aira_pay/Shop/Models/MerchantDetailsModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MerchantDetailsProvider with ChangeNotifier {
  List<MerchantDetails> merchantDetailsData = [];
  List<GetCategory> getCatMerchantDetails = [];
  List<GetMerchantAddress> getmerchantAdress = [];
  List<GetCashback> getcashback = [];

  String status = "fetching";

  // Future loginprovide(context, number) async {
  MerchantDatafetch(param) async {
    final response = await http.post(
      Uri.parse(
          "https://airapay-ext.quocent.com/mobile/api/v1/merchant-details"),
      body: (param),
    );
    print(response);
    switch (response.statusCode) {
      case 200:
        var results = json.decode(response.body);
        merchantDetailsData = [];
        getCatMerchantDetails = [];
        getmerchantAdress = [];
        getcashback = [];
        if (results['status'] == "success") {
          // print(results['categories']);
          status = results["status"];

          results["merchant_details"].forEach((item) {
            if (item["get_cashback"] != null) {
              item["get_cashback"].forEach((item5) {
                getcashback.add(GetCashback(
                  description: item5["description"],
                  percentage: item5["percentage"],
                  id: item5["id"],
                ));
              });
            }
            if (item["get_address"] != null) {
              item["get_address"].forEach((item4) {
                getmerchantAdress.add(GetMerchantAddress(
                  address: item4["get_address_details"]["address_line_1"],
                  merchantId: item4["merchant_id"],
                  id: item4["id"],
                  branchName: item4["branch_name"],
                  isActive: item4["ie_active"],
                  landmark: item4["landmark"],
                  latitude: item4["latitude"],
                  longitude: item4["longitude"],
                  city: item4["get_address_details"]["get_city"]["name"],
                  country: item4["get_address_details"]["get_country"]["name"],
                  state: item4["get_address_details"]["get_state"]["name"],
                ));
              });
            }
            if (item["get_category"] != null) {
              item["get_category"].forEach((item3) {
                getCatMerchantDetails.add(GetCategory(
                  categoryId: item3["category_id"],
                  categoryDetailsname: item3["get_category_details"]["name"],
                  merchantId: item3["merchant_id"],
                  id: item3["id"],
                ));
              });
            }
            merchantDetailsData.add(
              MerchantDetails(
                getAddress: getmerchantAdress,
                id: item['id'],
                userId: item['user_id'],
                apikey: item["api_key"],
                banner: item["banner"],
                callbackUrl: item["callback_url"],
                code: item["code"],
                getCategory: getCatMerchantDetails,
                instore: item["instore"],
                ipay_88Id: item["ipay_88_id"],
                isActive: item["is_active"],
                getCashback: getcashback,
                logo: item["logo"],
                name: item["name"],
                onlineUrl: item["online_url"],
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
