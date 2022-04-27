// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:aira_pay/Account/Api/service.dart';
import 'package:aira_pay/Auth/Providers/LoginProvider.dart';
import 'package:aira_pay/Shop/Screens/home.dart';
import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';

import '../../Auth/Providers/CustomerDetailsProvider.dart';
import '../../Shop/Widgets/tabs.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profileupdate extends StatefulWidget {
  const Profileupdate({Key? key}) : super(key: key);

  @override
  State<Profileupdate> createState() => _RegisterState();
}

class _RegisterState extends State<Profileupdate> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  var userId;
  File? Profileimage;
  var profilePhotonetworkType;

  var token;
  get isSwitched => null;
  bool _switchValue = true;
  String dropdownValue2 = 'Please select one';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.18),
              spreadRadius: 10,
              blurRadius: 3,
              offset: Offset(0, 8), // changes position of shadow
            ),
          ],
        ),
        height: 70,
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            child: Tabs(0)),
      ),
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
              'Update My Profile',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              profilePhotonetworkType != null
                  ? GestureDetector(
                      onTap: () {
                        _openGallery();
                      },
                      child: Stack(
                        children: [
                          Positioned(
                            child: Container(
                              height: 80,
                              width: 80,
                              child: CircleAvatar(
                                child: ClipOval(
                                  child: (Profileimage != null)
                                      ? Image.file(
                                          Profileimage!,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity,
                                        )
                                      : profilePhotonetworkType != null
                                          ? Image.network(
                                              profilePhotonetworkType,
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              height: double.infinity,
                                            )
                                          : Container(),
                                ),
                                backgroundColor: Color(tag_grey_bg),
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 8,
                              right: 1,
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.white,
                                child: HeroIcon(
                                  HeroIcons.camera,
                                  solid: true,
                                  size: 14,
                                  color: Color(primary_color),
                                ),
                              )),
                        ],
                      ),
                    )
                  : Container(),
              TextFormField(
                controller: _nameController,
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
                    labelText: 'Nickname',
                    floatingLabelStyle: TextStyle(color: Color(text_grey)),
                    hintText: 'Enter Nickname',
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
                    labelText: 'Gender',
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
                    'Male',
                    'Female',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            color: Color(primary_color),
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
                controller: _emailController,
                style: TextStyle(
                    color: Color(primary_text), fontWeight: FontWeight.w700),
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
                    floatingLabelStyle: TextStyle(color: Color(text_grey)),
                    hintText: 'Enter Email Address',
                    labelStyle: TextStyle(color: Color(regular_text)),
                    hintStyle: TextStyle(
                      fontSize: sub_title,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              SizedBox(
                height: spacing_small,
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  HeroIcon(
                    HeroIcons.checkCircle,
                    solid: true,
                    color: Color(success_text),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Email address verified.',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: small_text,
                        color: Color(primary_text)),
                  )
                ],
              ),
              SizedBox(
                height: spacing_small,
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Limit Promotion-based Notifications',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: sub_title,
                                    color: Color(primary_text)),
                              ),
                              Text(
                                'If you turn this on, you will no longer receive notifications on deals & promos.',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: small_text,
                                    color: Color(card_header_grey_text)),
                              ),
                            ],
                          ),
                        ),
                        Switch(
                          onChanged: (value) {
                            setState(() {
                              _switchValue = value;
                            });
                          },
                          value: _switchValue,
                          activeColor: Color(white_color),
                          activeTrackColor: Color(primary_color),
                          inactiveThumbColor: Color(white_color),
                          inactiveTrackColor: Color(border),
                        ),
                      ],
                    ),
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
                      elevation: 2,
                      shadowColor: Color(fusica_text).withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      )),
                  onPressed: () {
                    updateProfile();
                  },
                  child: Text(
                    "Update",
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

  updateProfile() {
    print("hii");
    print(Profileimage);
    final service = UpdateProfileApiService();

    service.updateprofile(
      {
        "profile_picture": Profileimage!.path,
        "token": token,
        "user_id": userId.toString(),
        "customer_name": _nameController.text.toString(),
        "gender": dropdownValue2,
        "email": _emailController.text.toString(),
      },
    ).then(
      (value) async {
        if (value.status == "success") {
          print(value.status);
          Fluttertoast.showToast(
              msg: "Woohoo! Profile successfully updated",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.white,
              textColor: Color(primary_text),
              fontSize: sub_title);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home(false)));
        } else {
          print(value.message);
          Fluttertoast.showToast(
              msg: "Something went wrong",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.white,
              textColor: Color(primary_text),
              fontSize: sub_title);
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
    token = sharedPreferences.getString(
      "AuthToken",
    );

    userId = sharedPreferences.getString(
      "UserId",
    );
    await Provider.of<CustomerDetailsProvider>(context, listen: false)
        .customerDetailsfetch({"token": token, "user_id": userId});

    var s = Provider.of<CustomerDetailsProvider>(context, listen: false)
        .userDetails
        .profilepic;
    _nameController.text =
        Provider.of<CustomerDetailsProvider>(context, listen: false)
            .userDetails
            .customerName;
    if (Provider.of<CustomerDetailsProvider>(context, listen: false)
        .userDetails
        .gender
        .isNotEmpty) {
      dropdownValue2 =
          Provider.of<CustomerDetailsProvider>(context, listen: false)
              .userDetails
              .gender;
    }

    _emailController.text =
        Provider.of<CustomerDetailsProvider>(context, listen: false)
            .userDetails
            .email;
    setState(() {
      profilePhotonetworkType = s;
    });
  }

  Future _openGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    print(imageTemporary);
    setState(() {
      this.Profileimage = imageTemporary;
    });
  }
}
