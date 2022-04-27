import 'package:aira_pay/Auth/Api/service.dart';
import 'package:aira_pay/Auth/Screens/register-complete.dart';
import 'package:aira_pay/config.dart';
import 'package:aira_pay/config/project_config.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';


class VerifyMobile extends StatefulWidget {
  const VerifyMobile({Key? key}) : super(key: key);

  @override
  State<VerifyMobile> createState() => _VerifyMobileState();
}

class _VerifyMobileState extends State<VerifyMobile> {
  get otpTextStyles => null;
  var mobilenumber;
  String otp = "";
  OtpFieldController otpController = OtpFieldController();
  verifyOtp() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("mobilenumber", mobilenumber);
    final service = OptVerifyApiService();

    service.otpverify(
      {
        "mobile_app_key": ProjectConfig().mobileAppKey,
        "otp": otp,
        "phone_number": mobilenumber,
      },
    ).then(
      (value) async {
        if (value.status == "success") {
          Fluttertoast.showToast(
              msg: 'Successfully verified',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.white,
              textColor: Color(primary_text),
              fontSize: sub_title);
          // print(value.status);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Completeregister()));
        } else {
          Fluttertoast.showToast(
              msg: 'Something went wrong',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.white,
              textColor: Color(primary_text),
              fontSize: sub_title);
          print(value.status);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(page_color),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const HeroIcon(
                      HeroIcons.arrowNarrowLeft,
                      color: Color(primary_color),
                    ),
                  )),
              SizedBox(
                height: spacing_small,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Verify your Mobile Number',
                  style: TextStyle(
                      fontSize: app_tittle, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'A 4-digit OTP has been sent to',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: sub_title),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '+60${mobilenumber}',
                  style: const TextStyle(
                      fontSize: heading_title, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: spacing_large,
              ),
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
              // OtpTextField(
              //     numberOfFields: 4,
              //     showFieldAsBox: false,
              //     borderColor: Colors.black,
              //     focusedBorderColor: const Color(primary_color),
              //     borderWidth: 4.0,
              //     onCodeChanged: 	(String code){
              //       print(code);
              //     },
              //
              //     textStyle: const TextStyle(
              //         fontSize: app_tittle, fontWeight: FontWeight.w700)),
              const SizedBox(
                height: spacing_small,
              ),
              const Text(
                'Resend OTP (50s)',
                style: TextStyle(
                  fontSize: sub_title,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
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
                    verifyOtp();
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(fontSize: button_text),
                  ),
                ),
              ),
            ],
          ),
        )));
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
