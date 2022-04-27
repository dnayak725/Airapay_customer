import 'dart:convert';

import 'package:aira_pay/Auth/Api/service.dart';
import 'package:aira_pay/Auth/models/LoginModel.dart';
import 'package:aira_pay/Shop/Models/HomeSliderModel.dart';
import 'package:aira_pay/Shop/Models/PersonalisecategoryModel.dart';
import 'package:aira_pay/Shop/Models/new_store_deals_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewStoreDealsProvider with ChangeNotifier {
  List<NewToPlatform> NewAirapayData = [];

  String status = "";

  // Future loginprovide(context, number) async {
  NewAirapayfetch(param) async {
    final response = await http.post(
      Uri.parse(
          "https://airapay-ext.quocent.com/mobile/api/v1/new-to-platform"),
      // headers: {
      //   "Content-Type": "application/json",
      //   // "ApiKey": AppConfig().apiKey,
      // },
      body: (param),
    );
    switch (response.statusCode) {
      case 200:
        var results = json.decode(response.body);
    NewAirapayData = [];
        if (results['status'] == "success") {
          // print(results['categories']);
       status = results["status"];

     
          results["new_to_platform"].forEach((item) {
           NewAirapayData.add(
              NewToPlatform(
                id: item['id'],
                name: item['name'].toString(),
          
                userId: item['user_id'],
                ipay_88Id: item['ipay_88_id'].toString(),
                isActive: item['is_active'],
                logo: item['logo'].toString(),
                banner: item['banner'].toString(),
                code: item['code'].toString(),
                callbackUrl: item['callback_url'].toString(),
                redirectUrl: item['redirect_url'].toString(),
                merchantRateId: item['merchant_rate_id'],
                 merchantRateId_2: item['merchant_rate_id_2'],
                  merchantRateId_3: item['merchant_rate_id_3'],
                parentId: item['parent_id'],
                 merchantRateId_6: item['merchant_rate_id_6'],
                apikey: item['apikey'].toString(),
                  instore: item['instore'].toString(),
                    onlineUrl: item['online_url'].toString(),
              
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
