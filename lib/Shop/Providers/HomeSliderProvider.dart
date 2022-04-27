import 'dart:convert';

import 'package:aira_pay/Auth/Api/service.dart';
import 'package:aira_pay/Auth/models/LoginModel.dart';
import 'package:aira_pay/Shop/Models/HomeSliderModel.dart';
import 'package:aira_pay/Shop/Models/PersonalisecategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomesliderProvider with ChangeNotifier {
  HomeSliderModel HomesliderData = HomeSliderModel(status: "", slider: []);
   List<String> images = [];
   List<String> images_tag = [];

  // String status = "";

  // Future loginprovide(context, number) async {
  Homesliderfetch(param) async {
    final response = await http.post(
      Uri.parse(
          "https://airapay-ext.quocent.com/mobile/api/v1/homepage-slider"),
      // headers: {
      //   "Content-Type": "application/json",
      //   // "ApiKey": AppConfig().apiKey,
      // },
      body: (param),
    );
    switch (response.statusCode) {
      case 200:
        var results = json.decode(response.body);
  HomesliderData.slider = [];
          images = [];
           images_tag = [];
        if (results['status'] == "success") {
          // print(results['categories']);
          HomesliderData.status = results["status"];

        
          results["slider"].forEach((item) {
            HomesliderData.slider.add(
              SLiderData(
                id: item['id'],
                title: item['title'].toString(),
                banner: item['banner'].toString(),
                webUrl: item['web_url'].toString(),
                mobileUrl: item['mobile_url'].toString(),
                status: item['status'],
              
              ),
            );
            
            images.add(item['banner'].toString());
               images_tag.add(item['title'].toString());
          });
        } else {
          HomesliderData.status = results["status"];
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
