import 'dart:convert';

import 'package:aira_pay/Auth/Api/service.dart';
import 'package:aira_pay/Auth/models/LoginModel.dart';
import 'package:aira_pay/Shop/Models/PersonalisecategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PersonaliseCategoryProvider with ChangeNotifier {
  PersonaliseCategoryModel PersonaliseCategory =
      PersonaliseCategoryModel(status: "", categories: []);

  // String status = "";

  // Future loginprovide(context, number) async {
  Categoryfetch(param) async {
    final response = await http.post(
      Uri.parse("https://airapay-ext.quocent.com/mobile/api/v1/all-category"),
      // headers: {
      //   "Content-Type": "application/json",
      //   // "ApiKey": AppConfig().apiKey,
      // },
      body: (param),
    );
    switch (response.statusCode) {
      case 200:
        var results = json.decode(response.body);
      PersonaliseCategory.categories = [];
        if (results['status'] == "success") {
          // print(results['categories']);
          PersonaliseCategory.status = results["status"];

        
          results["categories"].forEach((item) {
            PersonaliseCategory.categories.add(
              Categories(
                id: item['id'],
                name: item['name'].toString(),
                description: item['description'].toString(),
                logo: item['logo'].toString(),
                image: item['image'].toString(),
                active: item['active'],
                url: item['url'].toString(),
               
              ),
            );
          });
        } else {
          PersonaliseCategory.status = results["status"];
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
