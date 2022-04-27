// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/Auth/Api/service.dart';
import 'package:aira_pay/Auth/Providers/ExistNumber.dart';
import 'package:aira_pay/Auth/Providers/OtpSendProvider.dart';
import 'package:aira_pay/Auth/Screens/password.dart';
import 'package:aira_pay/Auth/Screens/verify_mobile_number.dart';
import 'package:aira_pay/Shop/Screens/home.dart';
import 'package:aira_pay/config.dart';
import 'package:aira_pay/config/project_config.dart';
import 'package:aira_pay/viewModel/RegisterMobileVm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  otpSendApi() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(
        "mobilenumber", _mobileController.text.toString());
    final service = OptSendApiService();

    service.otpsend(
      {
        "phone_number": _mobileController.text,
        "mobile_app_key": ProjectConfig().mobileAppKey
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
              backgroundColor: Colors.white,
              textColor: Color(primary_text),
              fontSize: sub_title);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => VerifyMobile()));
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

  final _mobileController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  bool isLoading = false;
  Widget build(BuildContext context) {
    print(_mobileController.text.length);
    return Scaffold(
      backgroundColor: Color(page_color),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                child: Form(
                  key: formGlobalKey,
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Center(
                        child: Text(
                          "Sign In / Register",
                          style: TextStyle(
                              fontSize: app_tittle,
                              fontWeight: FontWeight.w700,
                              color: Color(primary_text)),
                        ),
                      ),
                      SizedBox(
                        height: spacing_large,
                      ),
                      Center(
                        child: Text(
                          "Shop Confidently, Pay it Later",
                          style: TextStyle(
                              fontSize: sub_title,
                              fontWeight: FontWeight.w500,
                              color: Color(primary_text)),
                        ),
                      ),
                      SizedBox(
                        height: spacing_large,
                      ),
                      Consumer<RegisterMobileVM>(
                          builder: (context, MobileData, child) {
                        return TextFormField(
                          onChanged: (value) {
                            MobileData.onType(value);
                          },
                          controller: _mobileController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Phone Number';
                            } else if (value.isNotEmpty) {
                              bool mobileValid =
                                  RegExp(r'^(01)[0-46-9]*[0-9]{7,8}$')
                                      .hasMatch(value);
                              return mobileValid ? null : "Invalid mobile";
                            }
                            return null;
                          },
                          style: TextStyle(
                              color: Color(primary_text),
                              fontWeight: FontWeight.w700),
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: "Mobile Number",
                            hintText: "Mobile Number",
                            floatingLabelStyle: TextStyle(
                                color: Color(regular_text),
                                fontWeight: FontWeight.w600),
                            prefixText: "+60  ",
                            prefixStyle: TextStyle(
                              color: Color(primary_text),
                              fontWeight: FontWeight.w700,
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
                        );
                      }),
                      SizedBox(
                        height: spacing_extra_large,
                      ),
                      Consumer<RegisterMobileVM>(
                          builder: (context, MobileData, child) {
                        String mobileNo = MobileData.mobileNo;
                        return SizedBox(
                          height: button_height,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(primary_color),
                              elevation: 2,
                              shadowColor: Color(fusica_text).withOpacity(0.2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                            ),
                            onPressed: mobileNo.isNotEmpty
                                ? () async {
                                    // if (formGlobalKey.currentState!.validate()) {
                                    // _register(finalResult);
                                    // }
                                    //                      Navigator.push(
                                    // context, MaterialPageRoute(builder: (context) => Password()));
                                    existNumber();
                                  }
                                : null,
                            child: Text(
                              "Next",
                              style: TextStyle(
                                fontSize: button_text,
                                fontWeight: FontWeight.w600,
                              ),
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

  existNumber() {
    setState(() {
      isLoading = true;
    });
    final service = ExistNumberApiService();

    setState(() {
      isLoading = false;
    });
    service.existnumber(
      {
        "phone_number": _mobileController.text.toString(),
        "mobile_app_key": "d3VbpseZ12KMXSZkI6JalJ7sS6ytrXYu",
      },
    ).then(
      (value) async {
        if (value.status == "success") {
          // print(value.message);
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
          sharedPreferences.setString(
              "mobilenumber", _mobileController.text.toString());
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Password()));
        } else {
          otpSendApi();
        }
      },
    );

  }

  showToast() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
