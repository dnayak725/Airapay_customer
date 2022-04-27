

// import 'package:aira_pay/Auth/Api/service.dart';
// import 'package:aira_pay/Auth/models/OtpSendModel.dart';
// import 'package:flutter/material.dart';

// class OtpSendProvider with ChangeNotifier {
//   OtpSendModel result = OtpSendModel();
//   String status = "";

//   Future OtpSendProvide(context, number) async {
//     result = await otpsend(context, number);
//     // print(result.status);
//     if (result.status == "success") {
//       status = result.status;
//     }
//     notifyListeners();
//   }

//   void reset() {
//     status = "";
//     notifyListeners();
//   }
// }
