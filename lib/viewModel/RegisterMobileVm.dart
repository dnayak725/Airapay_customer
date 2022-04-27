import 'package:flutter/material.dart';
// register Mobile
class RegisterMobileVM with ChangeNotifier {
  String mobileNo = "";
  void onType(String value) {
    mobileNo = value;
    notifyListeners();
  }
}
