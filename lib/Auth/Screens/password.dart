// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/Auth/Api/service.dart';
import 'package:aira_pay/Auth/Providers/LoginProvider.dart';
import 'package:aira_pay/Auth/Screens/confirm_otp.dart';
import 'package:aira_pay/Auth/Screens/register.dart';
import 'package:aira_pay/Shop/Screens/home.dart';
import 'package:aira_pay/config.dart';
import 'package:aira_pay/config/project_config.dart';
import 'package:aira_pay/viewModel/PasswordVM.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final _passwordController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  var mobilenumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(page_color),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
          child: Form(
            key: formGlobalKey,
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
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
                SizedBox(
                  height: 70,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Mobile Number",
                    style: TextStyle(
                        color: Color(text_grey), fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '+60${mobilenumber}',
                      style: TextStyle(
                          color: Color(black_text),
                          fontWeight: FontWeight.w700,
                          fontSize: heading_title),
                    )),
                SizedBox(
                  height: spacing_extra_small,
                ),
                Consumer<PasswordVM>(builder: (context, password, child) {
                  return TextFormField(
                    onChanged: (value) {
                      password.onType(value);
                    },
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'plese enter Password';
                      } else if (value.isNotEmpty) {
                        bool mobileValid = RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                            .hasMatch(value);

                        return mobileValid ? null : "Invalid password";
                      }
                      return null;
                    },
                    obscureText: true,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700),
                    decoration: InputDecoration(
                      labelText: "Enter Password",
                      hintText: "Enter Password",
                      floatingLabelStyle: TextStyle(
                          color: Color(black_text),
                          fontWeight: FontWeight.w600),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(border), width: 1.2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(primary_color), width: 1.2),
                      ),
                    ),
                  );
                }),
                SizedBox(
                  height: spacing_small,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      forgototpSendApi();
                    },
                    child: Text(
                      "Forgot your password?",
                      style: TextStyle(
                          color: Color(primary_color),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                SizedBox(
                  height: spacing_large,
                ),
                Consumer<PasswordVM>(builder: (context, password, child) {
                  String passwordvalue = password.password;
                  return SizedBox(
                    height: button_height,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // ignore: prefer_const_constructors
                        primary: Color(primary_color),

                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                      onPressed: passwordvalue.length > 0
                          ? () async {
                              var loginParams = {
                                "mobile_app_key": ProjectConfig().mobileAppKey,
                                "phone_number": mobilenumber,
                                "password": _passwordController.text.toString(),
                              };
                              await Provider.of<LoginProvider>(context,
                                      listen: false)
                                  .fetchData(loginParams);

                             
                              if (Provider.of<LoginProvider>(context,
                                          listen: false)
                                      .loginDetails
                                      .status ==
                                  "success") {
                                SharedPreferences sharedPreferences =
                                    await SharedPreferences.getInstance();
                                sharedPreferences.setString(
                                    "AuthToken",
                                    Provider.of<LoginProvider>(context,
                                            listen: false)
                                        .loginDetails
                                        .token);

                                sharedPreferences.setString(
                                    "UserId",
                                    Provider.of<LoginProvider>(context,
                                            listen: false)
                                        .loginDetails
                                        .userDetails
                                        .id
                                        .toString());

                                //show login successful message
                                Fluttertoast.showToast(
                                    msg: 'You have successfully logged in.',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.black87,
                                    textColor: Colors.white,
                                    fontSize: sub_title);
                                //redirect to home page
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home(false)));
                              } else {
                                Fluttertoast.showToast(
                                    msg: Provider.of<LoginProvider>(context,
                                            listen: false)
                                        .loginDetails
                                        .message,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.black87,
                                    textColor: Colors.white,
                                    fontSize: sub_title);
                              }
                            }
                          : null,
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: button_text, fontWeight: FontWeight.w600),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
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

  forgototpSendApi() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("mobilenumber", mobilenumber);

    final service = ForgotOtpSendApiService();

    service.forgototpsend(
      {
        "mobile_app_key": ProjectConfig().mobileAppKey,
        "phone_number": mobilenumber,
      },
    ).then(
      (value) async {
        if (value.status == "success") {
          Fluttertoast.showToast(
              msg: value.message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black87,
              textColor: Colors.white,
              fontSize: sub_title);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConfirmOtp(),
              ));
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
}
