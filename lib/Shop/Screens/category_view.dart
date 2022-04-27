// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/Shop/Providers/FavouriteMerchantProvider.dart';
import 'package:aira_pay/Shop/Providers/GetCategoryByIdprovider.dart';
import 'package:aira_pay/Shop/Screens/home.dart';
import 'package:aira_pay/Shop/Screens/merchant_screen.dart';
import 'package:aira_pay/Shop/Widgets/tabs.dart';
import 'package:aira_pay/config.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Auth/Providers/CustomerDetailsProvider.dart';

class CategoryView extends StatefulWidget {
  var catId;
  var catName;

  CategoryView(this.catId, this.catName);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  var Solid = false;
  var likeColor = false;
  var userId;
  var Token;
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
              widget.catName,
              style: TextStyle(
                  color: Color(primary_text),
                  fontSize: app_tittle,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
      backgroundColor: Color(page_color),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Color(tag_grey_bg),
            height: 1,
          ),
          Consumer<GetCatByIdMerchantProvider>(
              builder: (context, catMerchantData, child) {
            return catMerchantData.getCatMerchants.length != 0
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 5.0,
                        ),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: catMerchantData.getCatMerchants.length,
                            itemBuilder: (ctnx, i) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Card(
                                  elevation: 2.5,
                                    shadowColor: Colors.black.withOpacity(0.3),
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Merchant(
                                                    catMerchantData
                                                        .getCatMerchants[i]
                                                        .id)),
                                          );
                                        },
                                        child: Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(6),
                                                  topRight: Radius.circular(6)),
                                              child: Image.network(
                                                  catMerchantData
                                                      .getCatMerchants[i].banner
                                                      .toString(),
                                                  width: double.infinity,
                                                  height: 145,
                                                  fit: BoxFit.cover),
                                            ),
                                            Positioned(
                                              top: 15,
                                              left: 20,
                                              child: Container(
                                                width: 48,
                                                height: 48,
                                                // ignore: prefer_const_constructors
                                                child: Align(
                                                  alignment: Alignment.topRight,
                                                  child: CircleAvatar(
                                                    radius: 30.0,
                                                    backgroundImage:
                                                        NetworkImage(
                                                      catMerchantData
                                                          .getCatMerchants[i]
                                                          .logo
                                                          .toString(),
                                                    ),
                                                    backgroundColor:
                                                        Color(white_color),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 10,
                                              right: 10,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                      ),
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 5,
                                                                vertical: 4),
                                                        child: Row(
                                                          // ignore: prefer_const_literals_to_create_immutables
                                                          children: [
                                                            HeroIcon(
                                                              HeroIcons.tag,
                                                              solid: true,
                                                              size:
                                                                  extra_small_text,
                                                              color: Color(
                                                                  white_color),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 3),
                                                              child: Text(
                                                                'Deals',
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        white_color),
                                                                    fontSize:
                                                                        extra_small_text,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  catMerchantData
                                                              .getCatMerchants[
                                                                  i]
                                                              .instore !=
                                                          "0"
                                                      ? Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(2),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.5),
                                                            ),
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal: 3,
                                                                  vertical: 2),
                                                              child: Row(
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  HeroIcon(
                                                                    HeroIcons
                                                                        .home,
                                                                    solid: true,
                                                                    size:
                                                                        extra_small_text,
                                                                    color: Color(
                                                                        white_color),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            2),
                                                                    child: Text(
                                                                      'In-store',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              white_color),
                                                                          fontSize:
                                                                              extra_small_text,
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      : Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(2),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.5),
                                                            ),
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal: 3,
                                                                  vertical: 2),
                                                              child: Row(
                                                                // ignore: prefer_const_literals_to_create_immutables
                                                                children: [
                                                                  HeroIcon(
                                                                    HeroIcons
                                                                        .home,
                                                                    solid: true,
                                                                    size:
                                                                        extra_small_text,
                                                                    color: Color(
                                                                        white_color),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            2),
                                                                    child: Text(
                                                                      'Online',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              white_color),
                                                                          fontSize:
                                                                              extra_small_text,
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 20, bottom: 15),
                                        child: Column(
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(3),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    Text(
                                                      catMerchantData
                                                          .getCatMerchants[i]
                                                          .name,
                                                      style: TextStyle(
                                                          color: Color(
                                                              regular_text),
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize:
                                                              button_text),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        setState(() {
                                                          if (selectedReportList
                                                              .contains(catMerchantData
                                                                  .getCatMerchants[
                                                                      i]
                                                                  .id
                                                                  .toString())) {
                                                            selectedReportList.remove(
                                                                catMerchantData
                                                                    .getCatMerchants[
                                                                        i]
                                                                    .id
                                                                    .toString());
                                                            var paramdata = {
                                                              "token": Token,
                                                              "user_id": userId,
                                                              "merchant_id":
                                                                  catMerchantData
                                                                      .getCatMerchants[
                                                                          i]
                                                                      .id
                                                                      .toString(),
                                                              "status": "false",
                                                            };
                                                            Provider.of<FavoriteMerchantProvider>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .FavouriteMerchantfetch(
                                                                    paramdata);
                                                          } else {
                                                            selectedReportList.add(
                                                                catMerchantData
                                                                    .getCatMerchants[
                                                                        i]
                                                                    .id
                                                                    .toString());
                                                            var paramdata = {
                                                              "token": Token,
                                                              "user_id": userId,
                                                              "merchant_id":
                                                                  catMerchantData
                                                                      .getCatMerchants[
                                                                          i]
                                                                      .id
                                                                      .toString(),
                                                              "status": "true",
                                                            };
                                                            Provider.of<FavoriteMerchantProvider>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .FavouriteMerchantfetch(
                                                                    paramdata);
                                                          }
                                                        });

                                                        //
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 10),
                                                        child:  selectedReportList.contains(
                                                                  catMerchantData
                                                                      .getCatMerchants[
                                                                          i]
                                                                      .id
                                                                      .toString())
                                                             ? HeroIcon(
                                                          HeroIcons.heart,
                                                          solid: true,
                                                          color:
                                                               Color(
                                                                  primary_color),
                                                          size: small_icon_size,
                                                        ):HeroIcon(
                                                          HeroIcons.heart,
                                                          solid: false,
                                                          color:
                                                               Color(
                                                                  icon_gery),
                                                          size: small_icon_size,),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Row(
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: List.generate(
                                                    catMerchantData.getCatMerchants[i].getCategory.length
                                                       ,
                                                    (index) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(3),
                                                          child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            3),
                                                                color: Color(
                                                                    grey_bg),
                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10,
                                                                    vertical:
                                                                        2),
                                                                child: Text(
                                                                  catMerchantData.getCatMerchants[i].getCategory[
                                                                          index]
                                                                      .categoryDetailsName,
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          primary_color),
                                                                      fontSize:
                                                                          tag_text),
                                                                ),
                                                              )),
                                                        )))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            })),
                  )
                : Center(child: Container(child: Text("No data found")));
          }),
        ],
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
    var tokenparam = {
      "token": Token,
      "user_id": userId,
      "cat_id": widget.catId.toString(),
    };
    var customerparam = {
      "token": Token,
      "user_id": userId,
    };
    await Provider.of<GetCatByIdMerchantProvider>(context, listen: false)
        .categorymerchantfetch(tokenparam);
    await Provider.of<CustomerDetailsProvider>(context, listen: false)
        .customerDetailsfetch(customerparam);
    print("from getId");
    // ignore: avoid_single_cascade_in_expression_statements
    Provider.of<CustomerDetailsProvider>(context, listen: false)
        .getFavMerchant
        .forEach((element) {
      setState(() {
        selectedReportList.add(element.merchantId.toString());
      });

      print(selectedReportList);
    });
    // print(Provider.of<CustomerDetailsProvider>(context, listen: false)
    //     .getIntrestCategory
    //     .length);
  }
}
