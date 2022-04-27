// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:aira_pay/Auth/Providers/CustomerDetailsProvider.dart';
import 'package:aira_pay/Shop/Screens/merchant_screen.dart';
import 'package:aira_pay/Shop/Widgets/search.dart';
import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Shop/Providers/FavouriteMerchantProvider.dart';
import '../../Shop/Widgets/tabs.dart';

class Following extends StatefulWidget {
  const Following({Key? key}) : super(key: key);

  @override
  State<Following> createState() => _FollowingState();
}

class _FollowingState extends State<Following> {
  @override
  var Token;
  var userId;
  List<String> selectedReportList = [];
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
            backgroundColor: Colors.white,
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
              'Following',
              style: TextStyle(
                  color: Color(primary_text),
                  fontSize: app_tittle,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Divider(
                color: Color(tag_grey_bg),
                height: 1,
              ),
            ),
            Consumer<CustomerDetailsProvider>(
                builder: (context, customerDetailsdata, child) {
              return customerDetailsdata.getFavMerchant.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                          itemCount: customerDetailsdata.getFavMerchant.length,
                          itemBuilder: (ctnx, i) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Merchant(
                                          customerDetailsdata
                                              .getFavMerchant[i].merchantId),
                                    ));
                              },
                              child: Card(
                                margin: EdgeInsets.zero,
                                elevation: 0,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                // ignore: prefer_const_constructors
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                    left: 10,
                                    right: 10,
                                  ),
                                  child: ListTile(
                                    dense: true,
                                    contentPadding: EdgeInsets.zero,
                                    leading: CircleAvatar(
                                      radius: 30.0,
                                      backgroundImage: NetworkImage(
                                        customerDetailsdata
                                            .getFavMerchant[i].merchantlogo,
                                      ),
                                      backgroundColor: Color(tag_grey_bg),
                                    ),
                                    trailing: GestureDetector(
                                      onTap: () async {
                                        setState(() {
                                          if (selectedReportList.contains(
                                              customerDetailsdata
                                                  .getFavMerchant[i].merchantId
                                                  .toString())) {
                                            selectedReportList.remove(
                                                customerDetailsdata
                                                    .getFavMerchant[i]
                                                    .merchantId
                                                    .toString());
                                            var paramdata = {
                                              "token": Token,
                                              "user_id": userId,
                                              "merchant_id": customerDetailsdata
                                                  .getFavMerchant[i].merchantId
                                                  .toString(),
                                              "status": "false",
                                            };
                                            Provider.of<FavoriteMerchantProvider>(
                                                    context,
                                                    listen: false)
                                                .FavouriteMerchantfetch(
                                                    paramdata);
                                          } else {
                                            selectedReportList.add(
                                                customerDetailsdata
                                                    .getFavMerchant[i]
                                                    .merchantId
                                                    .toString());
                                            var paramdata = {
                                              "token": Token,
                                              "user_id": userId,
                                              "merchant_id": customerDetailsdata
                                                  .getFavMerchant[i].merchantId
                                                  .toString(),
                                              "status": "true",
                                            };
                                            Provider.of<FavoriteMerchantProvider>(
                                                    context,
                                                    listen: false)
                                                .FavouriteMerchantfetch(
                                                    paramdata);
                                          }
                                        });

                                        _getmobilenumber();
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: selectedReportList.contains(
                                                customerDetailsdata
                                                    .getFavMerchant[i]
                                                    .merchantId
                                                    .toString())
                                            ? HeroIcon(
                                                HeroIcons.heart,
                                                solid: true,
                                                color: Color(error_text),
                                                size: small_icon_size,
                                              )
                                            : HeroIcon(
                                                HeroIcons.heart,
                                                solid: false,
                                                color: Color(icon_gery),
                                                size: small_icon_size,
                                              ),
                                      ),
                                    ),
                                    title: Row(
                                      children: [
                                        Text(
                                          customerDetailsdata
                                              .getFavMerchant[i].merchantName,
                                          style: TextStyle(
                                              color: Color(primary_text),
                                              fontWeight: FontWeight.w700,
                                              fontSize: sub_title),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        customerDetailsdata.getFavMerchant[i]
                                                .getCashback.isNotEmpty
                                            ? HeroIcon(
                                                HeroIcons.ticket,
                                                size: 18,
                                                color: Color(primary_color),
                                              )
                                            : Container(),
                                      ],
                                    ),
                                    subtitle: Row(
                                      children: List.generate(
                                        customerDetailsdata.getFavMerchant[i]
                                            .getCategory.length,
                                        (index) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              color: Color(grey_bg),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Text(
                                                customerDetailsdata
                                                    .getFavMerchant[i]
                                                    .getCategory[index]
                                                    .categoryName,
                                                style: TextStyle(
                                                    color: Color(primary_color),
                                                    fontSize: small_text),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  : Center(child: Text("No data found"));
            }),
          ],
        ),
      ),
    );
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
    var customerparam = {
      "token": Token,
      "user_id": userId,
    };
    await Provider.of<CustomerDetailsProvider>(context, listen: false)
        .customerDetailsfetch(customerparam);
    Provider.of<CustomerDetailsProvider>(context, listen: false)
        .getFavMerchant
        .forEach((element) {
      setState(() {
        selectedReportList.add(element.merchantId.toString());
      });
    });
    // print(Provider.of<CustomerDetailsProvider>(context, listen: false)
    //     .getFavMerchant[1].getCategory[0].categoryName);
  }
}
