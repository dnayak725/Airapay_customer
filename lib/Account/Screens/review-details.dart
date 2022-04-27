// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heroicons/heroicons.dart';

import '../../Shop/Widgets/tabs.dart';

class Reviewdetails extends StatefulWidget {
  const Reviewdetails({Key? key}) : super(key: key);

  @override
  State<Reviewdetails> createState() => _RegisterState();
}

class _RegisterState extends State<Reviewdetails> {
  get toggleSwitch => null;

  get isSwitched => null;
  String dropdownValue2 = 'Please select one';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Tabs(0),
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
              'Review your Details',
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
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(grey_bg_deep),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeroIcon(
                      HeroIcons.questionMarkCircle,
                      solid: true,
                      color: Color(grey_bg_deep_text),
                    ),
                    SizedBox(width: spacing_extra_small),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Please ensure your details are accurate.",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(grey_bg_deep_text),
                            ),
                          ),
                          Text(
                            "It cannot be modified after verification.",
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
              TextFormField(
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
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
                    floatingLabelStyle: TextStyle(color: Color(text_grey)),
                    hintText: 'Enter Full Name',
                    labelStyle: TextStyle(color: Color(regular_text)),
                    hintStyle: TextStyle(
                      fontSize: sub_title,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              SizedBox(
                height: spacing_small,
              ),
              TextFormField(
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
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
                    labelText: 'MyKad No.',
                    floatingLabelStyle: TextStyle(color: Color(text_grey)),
                    hintText: 'Enter MyKad Number',
                    labelStyle: TextStyle(color: Color(regular_text)),
                    hintStyle: TextStyle(
                      fontSize: sub_title,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              SizedBox(
                height: spacing_small,
              ),
              TextFormField(
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
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
                    labelText: 'Date of Birth',
                    floatingLabelStyle: TextStyle(color: Color(text_grey)),
                    hintText: 'Enter Date of Birth',
                    labelStyle: TextStyle(color: Color(regular_text)),
                    hintStyle: TextStyle(
                      fontSize: sub_title,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              SizedBox(
                height: spacing_medium,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Additional Details',
                  style: TextStyle(
                      fontSize: heading_title,
                      color: Color(primary_text),
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Occupation',
                    labelStyle: TextStyle(
                        color: Color(text_grey), fontWeight: FontWeight.w700),
                    hintStyle: TextStyle(
                      fontSize: sub_title,
                      fontWeight: FontWeight.w500,
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  ),
                  dropdownColor: Colors.white,
                  value: dropdownValue2,
                  icon: const HeroIcon(
                    HeroIcons.chevronDown,
                    solid: true,
                    size: 18,
                    color: Colors.black,
                  ),
                  elevation: 16,
                  onChanged: (String? newValue2) {
                    setState(() {
                      dropdownValue2 = newValue2!;
                    });
                  },
                  items: <String>[
                    'Please select one',
                    'Apple',
                    'Orange',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            color: Color(primary_text),
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.1,
                            fontSize: button_text),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: spacing_small,
              ),
              Container(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Industry',
                    labelStyle: TextStyle(
                        color: Color(text_grey), fontWeight: FontWeight.w700),
                    hintStyle: TextStyle(
                      fontSize: sub_title,
                      fontWeight: FontWeight.w500,
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  ),
                  dropdownColor: Colors.white,
                  value: dropdownValue2,
                  icon: const HeroIcon(
                    HeroIcons.chevronDown,
                    solid: true,
                    size: 18,
                    color: Colors.black,
                  ),
                  elevation: 16,
                  onChanged: (String? newValue2) {
                    setState(() {
                      dropdownValue2 = newValue2!;
                    });
                  },
                  items: <String>[
                    'Please select one',
                    'Apple',
                    'Orange',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            color: Color(primary_text),
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.1,
                            fontSize: button_text),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: spacing_medium,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Address (as per MyKad)',
                      style: TextStyle(
                          fontSize: heading_title,
                          color: Color(primary_text),
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'Please ensure your address is as per your MyKad.',
                      style: TextStyle(
                          fontSize: sub_title,
                          color: Color(card_header_grey_text),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              TextFormField(
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
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
                    labelText: 'Address Line 1',
                    floatingLabelStyle: TextStyle(color: Color(text_grey)),
                    hintText: 'Address Line 1',
                    labelStyle: TextStyle(color: Color(regular_text)),
                    hintStyle: TextStyle(
                      fontSize: sub_title,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              SizedBox(
                height: spacing_small,
              ),
              TextFormField(
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
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
                    labelText: 'Address Line 2',
                    floatingLabelStyle: TextStyle(color: Color(text_grey)),
                    hintText: 'Address Line 2',
                    labelStyle: TextStyle(color: Color(regular_text)),
                    hintStyle: TextStyle(
                      fontSize: sub_title,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              SizedBox(
                height: spacing_small,
              ),
              TextFormField(
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
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
                    labelText: 'Postcode',
                    floatingLabelStyle: TextStyle(color: Color(text_grey)),
                    hintText: 'Enter Postcode',
                    labelStyle: TextStyle(color: Color(regular_text)),
                    hintStyle: TextStyle(
                      fontSize: sub_title,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              SizedBox(
                height: spacing_small,
              ),
              Container(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'City',
                    labelStyle: TextStyle(
                        color: Color(text_grey), fontWeight: FontWeight.w700),
                    hintStyle: TextStyle(
                      fontSize: sub_title,
                      fontWeight: FontWeight.w500,
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  ),
                  dropdownColor: Colors.white,
                  value: dropdownValue2,
                  icon: const HeroIcon(
                    HeroIcons.chevronDown,
                    solid: true,
                    size: 18,
                    color: Colors.black,
                  ),
                  elevation: 16,
                  onChanged: (String? newValue2) {
                    setState(() {
                      dropdownValue2 = newValue2!;
                    });
                  },
                  items: <String>[
                    'Please select one',
                    'Kuala Lumpur',
                    'George Town',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            color: Color(primary_text),
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.1,
                            fontSize: button_text),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: spacing_small,
              ),
              Container(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'State',
                    labelStyle: TextStyle(
                        color: Color(text_grey), fontWeight: FontWeight.w700),
                    hintStyle: TextStyle(
                      fontSize: sub_title,
                      fontWeight: FontWeight.w500,
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  ),
                  dropdownColor: Colors.white,
                  value: dropdownValue2,
                  icon: const HeroIcon(
                    HeroIcons.chevronDown,
                    solid: true,
                    size: 18,
                    color: Colors.black,
                  ),
                  elevation: 16,
                  onChanged: (String? newValue2) {
                    setState(() {
                      dropdownValue2 = newValue2!;
                    });
                  },
                  items: <String>[
                    'Please select one',
                    'Johor',
                    'Kedah',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            color: Color(primary_text),
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.1,
                            fontSize: button_text),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: spacing_medium,
              ),
              Container(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Current Address',
                        style: TextStyle(
                            fontSize: heading_title,
                            color: Color(primary_text),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            child: Text(
                          'Is your current address different from your MyKad?',
                          style: TextStyle(
                            fontSize: sub_title,
                            fontWeight: FontWeight.w500,
                            color: Color(primary_text),
                          ),
                        )),
                        Switch(
                          onChanged: toggleSwitch,
                          value: true,
                          activeColor: Color(primary_color),
                          activeTrackColor: Colors.yellow,
                          inactiveThumbColor: Color(primary_color),
                          inactiveTrackColor: Colors.grey,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'State',
                    labelStyle: TextStyle(
                        color: Color(text_grey), fontWeight: FontWeight.w700),
                    hintStyle: TextStyle(
                      fontSize: sub_title,
                      fontWeight: FontWeight.w500,
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  ),
                  dropdownColor: Colors.white,
                  value: dropdownValue2,
                  icon: const HeroIcon(
                    HeroIcons.chevronDown,
                    solid: true,
                    size: 18,
                    color: Colors.black,
                  ),
                  elevation: 16,
                  onChanged: (String? newValue2) {
                    setState(() {
                      dropdownValue2 = newValue2!;
                    });
                  },
                  items: <String>[
                    'Please select one',
                    'Johor',
                    'Kedah',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            color: Color(primary_text),
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.1,
                            fontSize: button_text),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: spacing_small,
              ),
              Container(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'City',
                    labelStyle: TextStyle(
                        color: Color(text_grey), fontWeight: FontWeight.w700),
                    hintStyle: TextStyle(
                      fontSize: sub_title,
                      fontWeight: FontWeight.w500,
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  ),
                  dropdownColor: Colors.white,
                  value: dropdownValue2,
                  icon: const HeroIcon(
                    HeroIcons.chevronDown,
                    solid: true,
                    size: 18,
                    color: Colors.black,
                  ),
                  elevation: 16,
                  onChanged: (String? newValue2) {
                    setState(() {
                      dropdownValue2 = newValue2!;
                    });
                  },
                  items: <String>[
                    'Please select one',
                    'Kuala Lumpur',
                    'George Town',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            color: Color(primary_text),
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.1,
                            fontSize: button_text),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: spacing_small,
              ),
              TextFormField(
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
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
                    labelText: 'Address Line 1',
                    floatingLabelStyle: TextStyle(color: Color(text_grey)),
                    hintText: 'Address Line 1',
                    labelStyle: TextStyle(color: Color(regular_text)),
                    hintStyle: TextStyle(
                      fontSize: sub_title,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              SizedBox(
                height: spacing_small,
              ),
              TextFormField(
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
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
                    labelText: 'Address Line 2',
                    floatingLabelStyle: TextStyle(color: Color(text_grey)),
                    hintText: 'Address Line 2',
                    labelStyle: TextStyle(color: Color(regular_text)),
                    hintStyle: TextStyle(
                      fontSize: sub_title,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              SizedBox(
                height: spacing_small,
              ),
              TextFormField(
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
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
                    labelText: 'Postcode',
                    floatingLabelStyle: TextStyle(color: Color(text_grey)),
                    hintText: 'Enter Postcode',
                    labelStyle: TextStyle(color: Color(regular_text)),
                    hintStyle: TextStyle(
                      fontSize: sub_title,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              SizedBox(height: spacing_large),
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
                    "Submit",
                    style: TextStyle(fontSize: button_text),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
