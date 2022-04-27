// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/Auth/Screens/register-complete.dart';
import 'package:aira_pay/Auth/Screens/register-complete.dart';
import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:heroicons/heroicons.dart';

import '../../Shop/Widgets/tabs.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({Key? key}) : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  get otpTextStyles => null;
  String otp = "";
  final _otpController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Tabs(0),
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
                      'Verify your new Mobile Number',
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
                      '+60123456789',
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Completeregister()));
                      },
                      child: Text(
                        "Confirm",
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
}
