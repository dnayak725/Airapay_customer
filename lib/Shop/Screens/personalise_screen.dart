// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/Shop/Providers/personaliseCategoryProvider.dart';
import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Auth/Providers/CustomerDetailsProvider.dart';
import '../../Auth/Providers/LoginProvider.dart';
import '../Providers/SelectPersonaliseCategoryProvider.dart';

class PersonaliseScreen extends StatefulWidget {
  const PersonaliseScreen({Key? key}) : super(key: key);

  @override
  State<PersonaliseScreen> createState() => _RegisterState();
}

class _RegisterState extends State<PersonaliseScreen> {
  @override
  List<String> selectedReportList = [];
  int? _value;
  var userId;
  var Token;
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
                'Personalize',
                style: TextStyle(
                    color: Color(primary_text),
                    fontSize: app_tittle,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Text(
                      'Tell us what you like and we will personalise your experience with tailored content and offers from us.',
                      style: TextStyle(
                          fontSize: sub_title,
                          color: Color(regular_text),
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: spacing_medium,
              ),
              Consumer<PersonaliseCategoryProvider>(
                  builder: (context, PrsonaliseData, child) {
                return Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12.0,
                  children: List<Widget>.generate(
                      PrsonaliseData.PersonaliseCategory.categories.length,
                      (int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectedReportList.contains(PrsonaliseData
                              .PersonaliseCategory.categories[index].id
                              .toString())) {
                            selectedReportList.remove(PrsonaliseData
                                .PersonaliseCategory.categories[index].id
                                .toString());
                          } else {
                            selectedReportList.add(PrsonaliseData
                                .PersonaliseCategory.categories[index].id
                                .toString());
                          }
                        });
                     
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: selectedReportList.contains(PrsonaliseData
                                      .PersonaliseCategory.categories[index].id
                                      .toString())
                                  ? Color(primary_color)
                                  : Color(page_color),
                              border:
                                  Border.all(color: Color(border), width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 25),
                            child: Text(
                              PrsonaliseData
                                  .PersonaliseCategory.categories[index].name,
                              style: TextStyle(
                                  fontSize: button_text,
                                  color: selectedReportList.contains(
                                          PrsonaliseData.PersonaliseCategory
                                              .categories[index].id
                                              .toString())
                                      ? Color(white_color)
                                      : Color(primary_text),
                                  fontWeight: FontWeight.w700),
                            ),
                          )),
                    );
                    // return ChoiceChip(
                    //   selectedColor: selectedReportList.contains(PrsonaliseData
                    //           .PersonaliseCategory.categories[index].name
                    //           .toString())
                    //       ? Colors.red
                    //       : Colors.green,
                    //   padding: EdgeInsets.all(10),
                    //   label: Text(
                    //     PrsonaliseData
                    //         .PersonaliseCategory.categories[index].name,
                    //     style: TextStyle(
                    //         fontSize: button_text,
                    //         color: Color(regular_text),
                    //         fontWeight: FontWeight.w700),
                    //   ),
                    //   selected: _value == index,
                    //   onSelected: (bool selected) {
                    //     setState(() {
                    //       if (selectedReportList.contains(PrsonaliseData
                    //           .PersonaliseCategory.categories[index].name
                    //           .toString())) {
                    //         selectedReportList.remove(PrsonaliseData
                    //             .PersonaliseCategory.categories[index].name
                    //             .toString());
                    //       } else {
                    //         selectedReportList.add(PrsonaliseData
                    //             .PersonaliseCategory.categories[index].name
                    //             .toString());
                    //       }
                    //     });
                    //     print(selectedReportList);
                    //   },
                    // );
                  }),
                );
              }),
              SizedBox(
                height: spacing_medium,
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
                  onPressed: () async {
                    var paramdata = {
                      "token": Token,
                      "user_id": userId,
                      "cat_id": selectedReportList.join(","),
                    };

                    await Provider.of<SelectPersonaliseCategoryProvider>(
                            context,
                            listen: false)
                        .selectPersonaliseFetch(paramdata);

                    if (Provider.of<SelectPersonaliseCategoryProvider>(context,
                                listen: false)
                            .status ==
                        "success") {
                      Fluttertoast.showToast(
                          msg: "Successfully Choose the Category",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black87,
                          textColor: Color(white_color),
                          fontSize: sub_title);
                      Navigator.pop(context);
                    } else {
                      Fluttertoast.showToast(
                          msg: "Something went wrong",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black87,
                          textColor: Color(white_color),
                          fontSize: sub_title);
                    }
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(fontSize: button_text),
                  ),
                ),
              ),
            ],
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
    Token = sharedPreferences.getString(
      "AuthToken",
    );
    userId = sharedPreferences.getString(
      "UserId",
    );

    var tokenparam = {"token": Token, "user_id": userId};

    await Provider.of<PersonaliseCategoryProvider>(context, listen: false)
        .Categoryfetch(tokenparam);

    await Provider.of<CustomerDetailsProvider>(context, listen: false)
        .customerDetailsfetch(tokenparam);
    print(Provider.of<CustomerDetailsProvider>(context, listen: false)
        .getIntrestCategory
        .length);
    Provider.of<CustomerDetailsProvider>(context, listen: false)
        .getIntrestCategory
        .forEach((element) {
      setState(() {
        selectedReportList.add(element.catId.toString());
      });

      print(selectedReportList);
    });
    // print(Provider.of<LoginProvider>(context, listen: false)
    //     .loginDetails
    //     .userDetails
    //     .getIntrestCategory[0].intrestCatId
    //     );
  }
}
