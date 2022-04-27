// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/Auth/Api/service.dart';
import 'package:aira_pay/Auth/Screens/register.dart';
import 'package:aira_pay/Auth/Screens/verify_mobile_number.dart';
import 'package:aira_pay/Shop/Screens/home.dart';
import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Createpassword extends StatefulWidget {
  const Createpassword({Key? key}) : super(key: key);

  @override
  State<Createpassword> createState() => _RegisterState();
}

class _RegisterState extends State<Createpassword> {
  final _confirmPassController = TextEditingController();
  final _passwordController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  late String _password;
  double _strength = 0;
  bool _isHidden = true;
  var mobilenumber;

  RegExp numReg =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  RegExp letterReg =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  String _displayText = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getmobilenumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFf8fafc),
        body: Padding(
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Form(
              key: formGlobalKey,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: HeroIcon(
                          HeroIcons.arrowNarrowLeft,
                          color: Color(primary_color),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Create a new Password',
                        style: TextStyle(
                            fontSize: heading_title,
                            fontWeight: FontWeight.bold,
                            color: Color(primary_text)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: spacing_medium,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    onChanged: (value) => _checkPassword(value),
                    obscureText: _isHidden,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Color(regular_text)),
                      hintText: 'Enter your Password',
                      suffix: InkWell(
                        onTap: () {
                          setState(() {
                            _isHidden = !_isHidden;
                          });
                        },
                        child: HeroIcon(
                          _isHidden ? HeroIcons.eye : HeroIcons.eyeOff,
                          solid: true,
                          size: 18,
                          color: Color(text_grey),
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(input_border),
                            width: input_border_width),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(primary_color),
                            width: input_border_width),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: spacing_extra_small,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _displayText.isNotEmpty
                          ? Container(
                              width: 200,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                child: LinearProgressIndicator(
                                  value: _strength,
                                  backgroundColor: Colors.grey[300],
                                  color: _strength <= 1 / 4
                                      ? Color(week)
                                      : _strength == 2 / 4
                                          ? Color(good)
                                          : _strength == 3 / 4
                                              ? Color(strong)
                                              : Color(very_strong),
                                  minHeight: 10,
                                ),
                              ),
                            )
                          : Container(),
                      Text(
                        _displayText,
                        style: TextStyle(
                            color: _strength <= 1 / 4
                                ? Color(week)
                                : _strength == 2 / 4
                                    ? Color(good)
                                    : _strength == 3 / 4
                                        ? Color(strong)
                                        : Color(very_strong),
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: spacing_small,
                  ),
                  TextFormField(
                    controller: _confirmPassController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'plese enter Confirm Password';
                      } else if (value != _passwordController.text) {
                        return 'Password not match';
                      }
                      return null;
                    },
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700),
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(color: Color(regular_text)),
                      hintText: 'Confirm your Password',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(input_border),
                            width: input_border_width),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(primary_color),
                            width: input_border_width),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    height: button_height,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(primary_color),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                          )),
                      onPressed: _strength < 1 / 2
                          ? null
                          : () {
                              if (formGlobalKey.currentState!.validate()) {
                                updatePassword();
                              }
                            },
                      child: Text(
                        "Next",
                        style: TextStyle(fontSize: button_text),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void _checkPassword(String value) {
    _password = value.trim();

    if (_password.isEmpty) {
      setState(() {
        _strength = 0;
        _displayText = 'Enter password';
      });
    } else if (_password.length < 6) {
      setState(() {
        _strength = 1 / 4;
        _displayText = 'So Weak';
      });
    } else if (_password.length < 8) {
      setState(() {
        _strength = 2 / 4;
        _displayText = 'Pretty Good';
      });
    } else {
      if (!numReg.hasMatch(_password)) {
        setState(() {
          // Password length >= 8
          // But doesn't contain both letter and digit characters
          _strength = 3 / 4;
          _displayText = 'Strong';
        });
      } else {
        // Password length >= 8
        // Password contains both letter and digit characters
        setState(() {
          _strength = 1;
          _displayText = 'Very Strong!';
        });
      }
    }
  }



  _getmobilenumber() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var number = sharedPreferences.getString(
      "mobilenumber",
    );
    setState(() {
      mobilenumber = number;
    });
  }

  updatePassword() {
    final service = UpdatePasswordApiService();

    service.updatepassword(
      {
         "mobile_app_key": "d3VbpseZ12KMXSZkI6JalJ7sS6ytrXYu",
        "phone_number": mobilenumber,
        "password": _passwordController.text.toString()
      },
    ).then(
      (value) async {
        if (value.status == "success") {
          Fluttertoast.showToast(
              msg: "Woohoo! Password successfully changed.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.white,
              textColor: Color(primary_text),
              fontSize: sub_title);
          print(value.status);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Register()));
        } else {
          Fluttertoast.showToast(
              msg: value.message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.white,
              textColor: Color(primary_text),
              fontSize: sub_title);
          print(value.message);
        }
      },
    );
  }
}
