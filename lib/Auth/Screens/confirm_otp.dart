// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/Auth/Api/service.dart';
import 'package:aira_pay/Auth/Screens/create_password.dart';
import 'package:aira_pay/Auth/Screens/register-complete.dart';
import 'package:aira_pay/Auth/Screens/register-complete.dart';
import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfirmOtp extends StatefulWidget {
  const ConfirmOtp({Key? key}) : super(key: key);

  @override
  State<ConfirmOtp> createState() => _ConfirmOtpState();
}

class _ConfirmOtpState extends State<ConfirmOtp> {
  get otpTextStyles => null;
  var mobilenumber;
  String otp = "";
  OtpFieldController otpController = OtpFieldController();

  final formGlobalKey = GlobalKey<FormState>();
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
                    height: spacing_small,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Confirm OTP for password reset',
                      style: TextStyle(
                          fontSize: heading_title,
                          fontWeight: FontWeight.w700,
                          color: Color(primary_text)),
                    ),
                  ),
                  SizedBox(
                    height: spacing_small,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'A 4-digit OTP has been sent to',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Color(regular_text)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '+60${mobilenumber}',
                      style: TextStyle(
                          fontSize: heading_title,
                          fontWeight: FontWeight.w700,
                          color: Color(primary_text)),
                    ),
                  ),
                  SizedBox(
                    height: spacing_large,
                  ),
                  // OtpTextField(
                  //     numberOfFields: 4,
                  //     showFieldAsBox: false,
                  //     enabledBorderColor: Color(label_grey),
                  //     focusedBorderColor: Color(primary_color),
                  //     borderWidth: 2.0,
                  //     textStyle:
                  //         TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),

                  OTPTextField(
                      length: 4,
                      width: MediaQuery.of(context).size.width,
                      textFieldAlignment: MainAxisAlignment.center,
                      fieldWidth: 50,
                      fieldStyle: FieldStyle.underline,
                      style: TextStyle(
                          fontSize: app_tittle, fontWeight: FontWeight.bold),
                      onChanged: (pin) {
                        print("Changed: " + pin);
                        setState(() {
                          otp = pin;
                        });
                      },
                      onCompleted: (pin) {
                        print("Completed: " + pin);
                        setState(() {
                          otp = pin;
                        });
                      }),
                  SizedBox(
                    height: spacing_small,
                  ),
                  Text(
                    'Resend OTP (50s)',
                    style: TextStyle(
                      fontSize: sub_title,
                      fontWeight: FontWeight.w700,
                      color: Color(label_text),
                    ),
                  ),
                  SizedBox(
                    height: spacing_large,
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
                      onPressed: () {
                        verifyforgototp();
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

  verifyforgototp() {
    final service = ForgotOptVerifyApiService();

    service.forgototpverify(
      {
        "mobile_app_key": "d3VbpseZ12KMXSZkI6JalJ7sS6ytrXYu",
        "otp": otp,
        "phone_number": mobilenumber,
      },
    ).then(
      (value) async {
        if (value.status == "success") {
          print(value.status);
          Fluttertoast.showToast(
              msg: "Successfully verified'",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black87,
              textColor: Colors.white,
              fontSize: sub_title);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Createpassword()));
        } else {
          Fluttertoast.showToast(
              msg: 'Something went wrong',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black87,
              textColor: Colors.white,
              fontSize: sub_title);
          print(value.status);
        }
      },
    );
  }
}
