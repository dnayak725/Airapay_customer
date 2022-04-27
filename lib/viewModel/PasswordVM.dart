import 'package:flutter/material.dart';
// register Mobile
class PasswordVM with ChangeNotifier {
  String password = "";
  void onType(String value) {
    password = value;
    notifyListeners();
  }
}
