// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/Account/Screens/profile-update.dart';
import 'package:aira_pay/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Modal extends StatefulWidget {
  var SpendingLimit;

  Modal(this.SpendingLimit);

  @override
  State<Modal> createState() => _ModalState();
}

class _ModalState extends State<Modal> {
  @override
  final height = 100.0;
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      // ignore: prefer_const_constructors
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              "Your Available Spending Limit",
              style: TextStyle(
                  color: Color(primary_text),
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
            Text(
              "RM ${widget.SpendingLimit}",
              style: TextStyle(
                  color: Color(primary_color),
                  fontWeight: FontWeight.w800,
                  fontSize: 30),
            ),
            Text(
              "Your pay later spending limit is RM150. You can increase your spending limit by verifying your MyKad. Start shopping at your favourite stores to earn rewards and cash back. Remember to always spend responsibly within your means!",
              style: TextStyle(
                  color: Color(primary_text),
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 56,
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
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Start Shopping",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 56,
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // ignore: prefer_const_constructors
                    primary: Colors.white,
                    side: BorderSide(
                      width: 2.0,
                      color: Color(primary_color),
                    ),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Profileupdate()));
                  },
                  child: Text(
                    "Increase my Limit",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Color(primary_text)),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
