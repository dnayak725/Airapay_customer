import 'dart:convert';

import 'package:aira_pay/Auth/Api/service.dart';
import 'package:aira_pay/Auth/models/LoginModel.dart';
import 'package:aira_pay/Shop/Models/ExploreModel.dart';
import 'package:aira_pay/Shop/Models/GetCategorybyIdModel.dart';
import 'package:aira_pay/Shop/Models/HomeSliderModel.dart';
import 'package:aira_pay/Shop/Models/PersonalisecategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/customerDetailsModel.dart';

class CustomerDetailsProvider with ChangeNotifier {
  List<GetIntrestCategory> getIntrestCategory = [];
  List<GetFavMerchant> getFavMerchant = [];
  List<GetCat> getCat = [];
  List<GetCashback> getCashback = [];
  CustomerDetails userDetails = CustomerDetails(
    notificationEnable: 0,
      customerName: "",
      phoneNumber: "",
      profilepic: "",
      gender: "",
      email: "",
      getFavMerchant: [],
      getIntrestCategory: [],
      id: 0);

  String status = "";

  // Future loginprovide(context, number) async {
  customerDetailsfetch(param) async {
    final response = await http.post(
      Uri.parse(
          "https://airapay-ext.quocent.com/mobile/api/v1/customer-details"),
      body: (param),
    );
    switch (response.statusCode) {
      case 200:
        var results = json.decode(response.body);

        getIntrestCategory = [];
        getFavMerchant = [];
        if (results['status'] == "success") {
          status = results["status"];
          userDetails.profilepic =
              results["user_details"]["get_customer_details"]["profile_photo"];
          userDetails.email = results["user_details"]["email"];
            userDetails.notificationEnable = results["user_details"]["is_notification_enable"];
          userDetails.customerName =
              results["user_details"]["get_customer_details"]["customer_name"];
          userDetails.gender =
              results["user_details"]["get_customer_details"]["gender"];

          userDetails.phoneNumber = results["user_details"]["phone_number"];

          if (results["user_details"]["get_fav_merchant"] != null) {
            results["user_details"]["get_fav_merchant"].forEach((item) {
              List<GetCashback> temp2 = [];
                List<GetCat> temp = [];
              if (item["get_merchant"]["get_cashback"] != null) {
                item["get_merchant"]["get_cashback"].forEach((item4) {
                  temp2.add(GetCashback(cashbackId: item4["id"]));
                });
              }
            
              if (item["get_merchant"]["get_category"] != null) {
                item["get_merchant"]["get_category"].forEach((item3) {
                  temp.add(GetCat(
                      categoryName: item3["get_category_details"]["name"]));
                });
              }

              getFavMerchant.add(GetFavMerchant(
                getCashback: temp2,
                getCategory: temp,
                merchantId: item["merchant_id"],
                merchantName: item["get_merchant"]["name"],
                merchantlogo: item["get_merchant"]["logo"],
              ));
            });
          }
          if (results["user_details"]["get_intrest_category"] != null) {
            results["user_details"]["get_intrest_category"].forEach((item2) {
              getIntrestCategory
                  .add(GetIntrestCategory(catId: item2["category_id"]));
            });
          }
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

  reset() {
    userDetails = CustomerDetails(
      notificationEnable: 0,
        customerName: "",
        phoneNumber: "",
        profilepic: "",
        gender: "",
        email: "",
        getFavMerchant: [],
        getIntrestCategory: [],
        id: 0);
  }
}
