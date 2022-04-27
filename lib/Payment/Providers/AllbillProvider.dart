import 'dart:convert';

import 'package:aira_pay/Auth/Api/service.dart';
import 'package:aira_pay/Auth/models/LoginModel.dart';
import 'package:aira_pay/Payment/Models/AllbillsModel.dart';
import 'package:aira_pay/Shop/Models/HomeSliderModel.dart';
import 'package:aira_pay/Shop/Models/PersonalisecategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AllBillProvider with ChangeNotifier {
  List<Bills> AllBillsData = [];
  List<CompletedBills> completedBillsData = [];

  String status = "";

  // Future loginprovide(context, number) async {
  Allbillfetch(param) async {
    final response = await http.post(
      Uri.parse("https://airapay-ext.quocent.com/mobile/api/v1/all-bills"),
      // headers: {
      //   "Content-Type": "application/json",
      //   // "ApiKey": AppConfig().apiKey,
      // },
      body: (param),
    );
    switch (response.statusCode) {
      case 200:
        var results = json.decode(response.body);
        print(results);
        if (results['status'] == "success") {
          // print(results['categories']);
          status = results["status"];

          AllBillsData = [];
          completedBillsData = [];
          results["bills"].forEach((item) {
            AllBillsData.add(
              Bills(
                id: item['id'],
                amount: item['amount'],
                billCode: item["bill_code"],
                isSettled: item["is_settled"],
                merchantId: item["merchant_id"],
                requestData: item["request_data"],
                successPageLoaded: item["success_page_loaded"],
                userId: item["user_id"],
                availableCredit: item["available_credit"],
                billingStageId: item["billings_stage_id"],
                callbackUrl: item["callback_url"],
                description: item["description"],
                discount: item["discount"],
                merchantOrderId: item["merchant_order_id"],
                nettAmount: item["nett_amount"],
                plan: item["plan"],
                productTag: item["product_tag"],
                ref: item["ref"],
                returnUrl: item["return_url"],
                subMerchantName: item["sub_merchant_name"],
                unpaidBalance: item["unpaid_balance"],
                subMerchantId: item["sub_merchant_id"],
                deletedAt: item['deleted_at'],
                createdAt: item['created_at'],
                updatedAt: item['updated_at'],
              ),
            );
          });
          results["bills"].forEach((item) {
            if (item["billing_stage_id"] == 2) {
              completedBillsData.add(
                CompletedBills(
                  id: item['id'],
                  amount: item['amount'],
                  billCode: item["bill_code"],
                  isSettled: item["is_settled"],
                  merchantId: item["merchant_id"],
                  requestData: item["request_data"],
                  successPageLoaded: item["success_page_loaded"],
                  userId: item["user_id"],
                  availableCredit: item["available_credit"],
                  billingStageId: item["billings_stage_id"],
                  callbackUrl: item["callback_url"],
                  description: item["description"],
                  discount: item["discount"],
                  merchantOrderId: item["merchant_order_id"],
                  nettAmount: item["nett_amount"],
                  plan: item["plan"],
                  productTag: item["product_tag"],
                  ref: item["ref"],
                  returnUrl: item["return_url"],
                  subMerchantName: item["sub_merchant_name"],
                  unpaidBalance: item["unpaid_balance"],
                  subMerchantId: item["sub_merchant_id"],
                  deletedAt: item['deleted_at'],
                  createdAt: item['created_at'],
                  updatedAt: item['updated_at'],
                ),
              );
            }
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
