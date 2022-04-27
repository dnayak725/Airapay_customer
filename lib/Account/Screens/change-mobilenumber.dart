// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/Auth/Screens/confirm_otp.dart';
import 'package:aira_pay/Auth/Screens/register.dart';
import 'package:aira_pay/Shop/Screens/home.dart';
import 'package:aira_pay/config.dart';
import 'package:aira_pay/viewModel/PasswordVM.dart';
import 'package:flutter/material.dart';

import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Shop/Widgets/tabs.dart';

class Changemobileno extends StatefulWidget {
  const Changemobileno({Key? key}) : super(key: key);

  @override
  State<Changemobileno> createState() => _PasswordState();
}

class _PasswordState extends State<Changemobileno> {
  @override
  final _passwordController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  var mobilenumber;
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
                  height: spacing_medium,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Change Mobile Number",
                    style: TextStyle(
                        color: Color(primary_text),
                        fontSize: heading_title,
                         fontWeight: FontWeight.w700),
                  ),
                ),
               
                SizedBox(
                  height: spacing_extra_large,
                ),
                TextFormField(
                    style: TextStyle(
                      color: Color(primary_text), fontWeight: FontWeight.w700),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Mobile Number",
                    hintText: "Mobile Number",
                    floatingLabelStyle: TextStyle(
                        color: Color(regular_text),
                        fontWeight: FontWeight.w600),
                    prefixText: "+60",
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
                  ),
                SizedBox(
                  height: spacing_small,
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
                      onPressed: () {},
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
      ),
    );
  }

 
  
}
