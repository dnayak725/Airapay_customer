// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:aira_pay/Account/Screens/input_formatters.dart';
import 'package:aira_pay/Account/Screens/my_strings.dart';
import 'package:aira_pay/Account/Screens/payment_card.dart';
import 'package:aira_pay/Payment/Screens/confirm-payment.dart';
import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heroicons/heroicons.dart';

class Addcardpage extends StatefulWidget {
  const Addcardpage({Key? key}) : super(key: key);

  @override
  State<Addcardpage> createState() => _RegisterState();
}

class _RegisterState extends State<Addcardpage> {
  get toggleSwitch => null;

  get isSwitched => null;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _formKey = new GlobalKey<FormState>();
  var numberController = new TextEditingController();
  var _paymentCard = PaymentCard();
  var _autoValidateMode = AutovalidateMode.disabled;

  var _card = new PaymentCard();
  @override
  void initState() {
    super.initState();
    _paymentCard.type = CardType.Others;
    numberController.addListener(_getCardTypeFrmNumber);
  }

  @override
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
              'Add New Card',
              style: TextStyle(
                  color: Color(primary_text),
                  fontSize: app_tittle,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
      backgroundColor: Color(page_color),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Form(
            key: _formKey,
            autovalidateMode: _autoValidateMode,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(grey_bg_deep),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeroIcon(
                        HeroIcons.lockClosed,
                        solid: true,
                        color: Color(grey_bg_deep_text),
                      ),
                      SizedBox(width: spacing_extra_small),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your card details are protected.",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(grey_bg_deep_text),
                              ),
                            ),
                            Text(
                              "I acknowledge that my card information is saved to my AiraPay account and a One Time Password (OTP) may not be required for future transactions.",
                              style: TextStyle(
                                fontSize: small_text,
                                color: Color(grey_bg_deep_text),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: spacing_medium,
                ),
                TextFormField(
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
                      labelText: 'Card Holder Name',
                      floatingLabelStyle: TextStyle(color: Color(text_grey)),
                      hintText: 'Enter Card Holder Name',
                      labelStyle: TextStyle(color: Color(regular_text)),
                      hintStyle: TextStyle(
                        fontSize: sub_title,
                        fontWeight: FontWeight.w500,
                      )),
                  onSaved: (String? value) {
                    _card.name = value;
                  },
                  keyboardType: TextInputType.text,
                  validator: (String? value) =>
                      value!.isEmpty ? Strings.fieldReq : null,
                ),
                SizedBox(
                  height: spacing_small,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    new LengthLimitingTextInputFormatter(19),
                    new CardNumberInputFormatter()
                  ],
                  controller: numberController,
                  onSaved: (String? value) {
                    print('onSaved = $value');
                    print('Num controller has = ${numberController.text}');
                    _paymentCard.number = CardUtils.getCleanedNumber(value!);
                  },
                  validator: CardUtils.validateCardNum,
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
                      labelText: 'Card Number',
                      floatingLabelStyle: TextStyle(color: Color(text_grey)),
                      hintText: 'Enter Card Holder Name',
                      suffixIcon: Container(
                        width: 1,
                        child: CardUtils.getCardIcon(_paymentCard.type),
                      ),
                      labelStyle: TextStyle(color: Color(regular_text)),
                      hintStyle: TextStyle(
                        fontSize: sub_title,
                        fontWeight: FontWeight.w500,
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          new LengthLimitingTextInputFormatter(4),
                          new CardMonthInputFormatter()
                        ],
                        validator: CardUtils.validateDate,
                        keyboardType: TextInputType.number,
                        onSaved: (value) {
                          List<int> expiryDate =
                              CardUtils.getExpiryDate(value!);
                          _paymentCard.month = expiryDate[0];
                          _paymentCard.year = expiryDate[1];
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
                            labelText: 'Expire Date',
                            floatingLabelStyle:
                                TextStyle(color: Color(text_grey)),
                            labelStyle: TextStyle(color: Color(regular_text)),
                            hintStyle: TextStyle(
                              fontSize: sub_title,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                    ),
                    Flexible(
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          new LengthLimitingTextInputFormatter(4),
                        ],
                        validator: CardUtils.validateCVV,
                        keyboardType: TextInputType.number,
                        onSaved: (value) {
                          _paymentCard.cvv = int.parse(value!);
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
                            labelText: 'CVV',
                            floatingLabelStyle:
                                TextStyle(color: Color(text_grey)),
                            labelStyle: TextStyle(color: Color(regular_text)),
                            hintStyle: TextStyle(
                              fontSize: sub_title,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: spacing_large,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "I acknowledge that my card information is saved to my AiraPay account and a One Time Password (OTP) may not be required for future transactions.",
                              style: TextStyle(
                                  fontSize: small_text,
                                  color: Color(text_grey)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: spacing_extra_small),
                    ],
                  ),
                ),
                SizedBox(height: spacing_large),
                SizedBox(
                  height: button_height,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(primary_color),
                        elevation: 2.5,
                                    shadowColor: Color(fusica_text).withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        )),
                    onPressed: () {
                      _validateInputs();
                    },
                    child: Text(
                      "Add Card",
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

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    numberController.removeListener(_getCardTypeFrmNumber);
    numberController.dispose();
    super.dispose();
  }

  void _getCardTypeFrmNumber() {
    String input = CardUtils.getCleanedNumber(numberController.text);
    CardType cardType = CardUtils.getCardTypeFrmNumber(input);
    setState(() {
      this._paymentCard.type = cardType;
    });
  }

  void _validateInputs() {
    final FormState form = _formKey.currentState!;
    if (!form.validate()) {
      setState(() {
        _autoValidateMode =
            AutovalidateMode.always; // Start validating on every change.
      });

      Fluttertoast.showToast(
          msg: 'Please fix the errors in red before submitting.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black87,
          textColor: Colors.white,
          fontSize: sub_title);
    } else {
      form.save();
      // Encrypt and send send payment details to payment gateway

      Fluttertoast.showToast(
          msg: 'Payment card is valid',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black87,
          textColor: Colors.white,
          fontSize: sub_title);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Confirmpayment()));
    }
  }
}
