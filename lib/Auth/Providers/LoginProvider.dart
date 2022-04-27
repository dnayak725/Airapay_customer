import 'dart:convert';
import 'package:aira_pay/Auth/models/LoginModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginProvider with ChangeNotifier {
  List<GetintrestCategory> intrestCat = [];
  LoginModel loginDetails = LoginModel(
      status: "fetching",
      message: "",
      token: "",
      userDetails: UserDetails(
        getIntrestCategory: [],
        id: 0,
        email: "",
        emailVerificationToken: "",
        emailIsVerified: 0,
        phoneNumber: "",
        sessionToken: "",
        userType: "",
        statusId: 0,
        referredBy: 0,
        referCode: 0,
        isVerified: 0,
        isSuspended: 0,
        deviceId: 0,
        isNotificationEnable: 0,
        customerName: "",
        profilePhoto: "",
      ));

  // String status = "";

  fetchData(param) async {
    final response = await http.post(
      Uri.parse("https://airapay-ext.quocent.com/mobile/api/v1/user_login"),
    
      body: (param),
    );
    switch (response.statusCode) {
      case 200:
        var results = json.decode(response.body);

        intrestCat = [];

        if (results['status'] == "success") {
          loginDetails.status = results["status"];
          loginDetails.userDetails.profilePhoto =
              results["user_details"]["get_customer_details"]["profile_photo"];
          loginDetails.token = results["token"];

          loginDetails.userDetails.id = results["user_details"]["id"];

          loginDetails.userDetails.customerName =
              results["user_details"]["get_customer_details"]["customer_name"];
          if (results["user_details"]["get_intrest_category"] != null) {
            print("hii");
            results["user_details"]["get_intrest_category"].forEach((item) {
              print("hello");

              intrestCat.add(GetintrestCategory(
                intrestCatId: item["category_id"],
              ));
              print(item["id"]);
            });
          }
          loginDetails.userDetails.getIntrestCategory = intrestCat;
        } else {
          loginDetails.status = results["status"];
          loginDetails.message = results["message"];
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
