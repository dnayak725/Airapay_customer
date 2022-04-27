// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/Auth/Api/service.dart';
import 'package:aira_pay/Auth/Screens/register.dart';
import 'package:aira_pay/Shop/Screens/home.dart';
import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/project_config.dart';
import '../Providers/LoginProvider.dart';

class Completeregister extends StatefulWidget {
  const Completeregister({Key? key}) : super(key: key);

  @override
  State<Completeregister> createState() => _RegisterState();
}

class _RegisterState extends State<Completeregister> {
  @override
  var mobilenumber;
  final _nameController = TextEditingController();
  final _myKadController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmPassController = TextEditingController();
  final _passwordController = TextEditingController();
  final _referalController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  late String _password;
  double _strength = 0;
  bool _isHidden = true;
  bool isChecked = false;
  RegExp numReg =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  RegExp letterReg =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  String _displayText = '';
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: AppBar(
              backgroundColor: Color(page_color),
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: HeroIcon(
                  HeroIcons.arrowNarrowLeft,
                  color: Color(primary_color),
                ),
              ),
              title: Text(
                'Complete registration',
                style: TextStyle(
                    color: Color(primary_text),
                    fontSize: app_tittle,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ),
        backgroundColor: Color(page_color),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Form(
              key: formGlobalKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter  full name';
                      }

                      return null;
                    },
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700),
                    decoration: InputDecoration(
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
                        labelText: 'Full Name (as per your MyKad)',
                        labelStyle: TextStyle(
                            color: Color(regular_text),
                            fontWeight: FontWeight.w600,
                            fontSize: sub_title),
                        hintText: 'Enter your full name as per your MyKad',
                        hintStyle: TextStyle(
                          fontSize: sub_title,
                          color: Color(placeholder_text),
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                  SizedBox(
                    height: spacing_extra_small,
                  ),
                  TextFormField(
                    controller: _myKadController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter myKad';
                      }

                      return null;
                    },
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700),
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
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
                        labelText: 'myKad No.',
                        labelStyle: TextStyle(
                            color: Color(regular_text),
                            fontWeight: FontWeight.w600,
                            fontSize: sub_title),
                        hintText: 'Enter your MyKad number',
                        hintStyle: TextStyle(
                          fontSize: sub_title,
                          color: Color(placeholder_text),
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                  SizedBox(
                    height: spacing_extra_small,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        HeroIcon(
                          HeroIcons.informationCircle,
                          solid: true,
                          color: Color(primary_grey),
                        ),
                        Text(
                          'This helps us assign you a spending limit.',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: sub_title,
                              color: Color(regular_text)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: spacing_extra_small,
                  ),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'plese enter email';
                      } else if (!value.contains("@")) {
                        return "please enter valid email";
                      }
                      return null;
                    },
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700),
                    decoration: InputDecoration(
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
                        labelText: 'Email Address',
                        labelStyle: TextStyle(
                            color: Color(regular_text),
                            fontWeight: FontWeight.w600,
                            fontSize: sub_title),
                        hintText: 'Enter your email address',
                        hintStyle: TextStyle(
                          fontSize: sub_title,
                          color: Color(placeholder_text),
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                  SizedBox(
                    height: spacing_extra_small,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    onChanged: (value) => _checkPassword(value),
                    obscureText: _isHidden,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: Color(regular_text),
                          fontWeight: FontWeight.w600,
                          fontSize: sub_title),
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
                    height: 5,
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
                      labelStyle: TextStyle(
                          color: Color(regular_text),
                          fontWeight: FontWeight.w600,
                          fontSize: sub_title),
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
                    height: spacing_extra_small,
                  ),
                  TextFormField(
                    controller: _referalController,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700),
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
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
                        labelText: 'Referral Code',
                        labelStyle: TextStyle(
                            color: Color(regular_text),
                            fontWeight: FontWeight.w600,
                            fontSize: sub_title),
                        hintText: 'Enter a Referral Code if you received one',
                        hintStyle: TextStyle(
                          fontSize: sub_title,
                          color: Color(placeholder_text),
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                  SizedBox(
                    height: spacing_extra_small,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: Color(primary_color),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      SizedBox(
                        height: spacing_extra_large,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'I have read and agree to the',
                            style: TextStyle(color: Color(regular_text)),
                          ),
                          Text(
                            'Terms & Conditions & Privacy Policy',
                            style: TextStyle(
                              color: Color(primary_color),
                              fontSize: button_text,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: spacing_medium,
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
                                completeRegister();
                              }
                            },
                      child: Text(
                        "Next",
                        style: TextStyle(fontSize: button_text),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: spacing_medium,
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

  loginCall() async {
    var loginParams = {
      "mobile_app_key": ProjectConfig().mobileAppKey,
      "phone_number": mobilenumber,
      "password": _passwordController.text.toString(),
    };

    await Provider.of<LoginProvider>(context, listen: false)
        .fetchData(loginParams);
    print((Provider.of<LoginProvider>(context, listen: false)
        .loginDetails
        .message));
    if (Provider.of<LoginProvider>(context, listen: false)
            .loginDetails
            .status ==
        "success") {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString(
          "AuthToken",
          Provider.of<LoginProvider>(context, listen: false)
              .loginDetails
              .token);

      sharedPreferences.setString(
          "UserId",
          Provider.of<LoginProvider>(context, listen: false)
              .loginDetails
              .userDetails
              .id
              .toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Home(true)));
      print("object object");
      print(Provider.of<LoginProvider>(context, listen: false)
          .loginDetails
          .message);
    }
  }

  completeRegister() {
    final service = CompleteRegisterApiService();
    print("heloo from register");
    service.completeregister(
      {
        "mobile_app_key": "d3VbpseZ12KMXSZkI6JalJ7sS6ytrXYu",
        "customer_name": _nameController.text.toString(),
        "mykad_number": _myKadController.text.toString(),
        "password": _passwordController.text.toString(),
        "phone_number": mobilenumber,
        "email": _emailController.text.toString(),
        "refer_code": _referalController.text.toString(),
      },
    ).then(
      (value) async {
        if (value.status == "success") {
          print(value.message);
          Fluttertoast.showToast(
              msg: value.message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black87,
              textColor: Colors.white,
              fontSize: sub_title);
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.setString("mobilenumber", mobilenumber);
          loginCall();
        } else {
          Fluttertoast.showToast(
              msg: value.message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black87,
              textColor: Colors.white,
              fontSize: sub_title);
          print(value.message);
        }
      },
    );
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    _getmobilenumber();
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
}
