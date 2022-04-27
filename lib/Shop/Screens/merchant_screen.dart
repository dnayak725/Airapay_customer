// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/Shop/Providers/MerchantDetailsProvider.dart';
import 'package:aira_pay/Shop/Screens/Inappbrowser.dart';
import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Auth/Providers/CustomerDetailsProvider.dart';
import '../Providers/FavouriteMerchantProvider.dart';
import 'package:dotted_line/dotted_line.dart';

class Merchant extends StatefulWidget {
  var merchantId;

  Merchant(this.merchantId);

  @override
  State<Merchant> createState() => _MerchantState();
}

class _MerchantState extends State<Merchant> {
  @override
  var userId;
  var Token;
  List<String> selectedReportList = [];
  List CategoryList = ["In-Store", "Online", "Voucher"];

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Consumer<MerchantDetailsProvider>(
            builder: (context, merchantDetailsdata, child) {
          return merchantDetailsdata.merchantDetailsData.isNotEmpty
              ? Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 140.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          image: DecorationImage(
                              // ignore: unnecessary_new
                              colorFilter: new ColorFilter.mode(
                                  Colors.black.withOpacity(0.3),
                                  BlendMode.darken),
                              image: NetworkImage(merchantDetailsdata
                                  .merchantDetailsData[0].banner
                                  .toString()),
                              fit: BoxFit.cover)),
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 80, left: 15),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: HeroIcon(
                                  HeroIcons.arrowNarrowLeft,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 26),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                              ),
                              height: 10,
                              width: double.infinity,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            ListTile(
                                leading: CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: NetworkImage(
                                    merchantDetailsdata
                                        .merchantDetailsData[0].logo,
                                  ),
                                  backgroundColor: Color(tag_grey_bg),
                                ),
                                title: Text(
                                  merchantDetailsdata
                                      .merchantDetailsData[0].name
                                      .toString(),
                                  style: TextStyle(
                                    color: Color(primary_text),
                                    fontWeight: FontWeight.w700,
                                    fontSize: small_title,
                                  ),
                                ),
                                subtitle: Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: List.generate(
                                    merchantDetailsdata
                                        .getCatMerchantDetails.length,
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            merchantDetailsdata
                                                .getCatMerchantDetails[index]
                                                .categoryDetailsname,
                                            style: TextStyle(
                                                color: Color(primary_color),
                                                fontSize: small_text),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                trailing: GestureDetector(
                                  onTap: () async {
                                    setState(() {
                                      if (selectedReportList.contains(
                                          merchantDetailsdata
                                              .merchantDetailsData[0].id
                                              .toString())) {
                                        selectedReportList.remove(
                                            merchantDetailsdata
                                                .merchantDetailsData[0].id
                                                .toString());
                                        var paramdata = {
                                          "token": Token,
                                          "user_id": userId,
                                          "merchant_id": merchantDetailsdata
                                              .merchantDetailsData[0].id
                                              .toString(),
                                          "status": "false",
                                        };
                                        Provider.of<FavoriteMerchantProvider>(
                                                context,
                                                listen: false)
                                            .FavouriteMerchantfetch(paramdata);
                                      } else {
                                        selectedReportList.add(
                                            merchantDetailsdata
                                                .merchantDetailsData[0].id
                                                .toString());
                                        var paramdata = {
                                          "token": Token,
                                          "user_id": userId,
                                          "merchant_id": merchantDetailsdata
                                              .merchantDetailsData[0].id
                                              .toString(),
                                          "status": "true",
                                        };
                                        Provider.of<FavoriteMerchantProvider>(
                                                context,
                                                listen: false)
                                            .FavouriteMerchantfetch(paramdata);
                                      }
                                    });

                                    //
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: selectedReportList.contains(
                                            merchantDetailsdata
                                                .merchantDetailsData[0].id
                                                .toString())
                                        ? HeroIcon(
                                            HeroIcons.heart,
                                            solid: true,
                                            color: Color(primary_color),
                                            size: small_icon_size,
                                          )
                                        : HeroIcon(
                                            HeroIcons.heart,
                                            solid: false,
                                            color: Color(icon_gery),
                                            size: small_icon_size,
                                          ),
                                  ),
                                )),
                            Align(
                              alignment: Alignment.topLeft,
                              child: TabBar(
                                  padding: EdgeInsets.zero,
                                  indicatorPadding: EdgeInsets.zero,
                                  onTap: (value) {},
                                  indicatorColor: Color(primary_color),
                                  indicatorWeight: 3,
                                  labelColor: Color(primary_text),
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Baloo2",
                                  ),
                                  unselectedLabelColor: Color(text_grey),
                                  isScrollable: true,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  tabs: CategoryList.map((e) => Tab(
                                        text: e,
                                      )).toList()),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 1,
                              color: Color(tag_grey_bg),
                            ),
                            Expanded(
                              child: TabBarView(
                                  children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10, top: 0),
                                  child: ListView.builder(
                                      itemCount: merchantDetailsdata
                                          .getmerchantAdress.length,
                                      itemBuilder: (ctnx, i) {
                                        return Card(
                                          margin: EdgeInsets.only(
                                              bottom: 5, top: 0),
                                          elevation: 2.5,
                                          shadowColor:
                                              Colors.black.withOpacity(0.3),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: ListTile(
                                              dense: true,
                                              minLeadingWidth: 10,
                                              leading: HeroIcon(
                                                HeroIcons.locationMarker,
                                                color: Color(primary_color),
                                              ),
                                              title: Row(
                                                children: [
                                                  Text(
                                                    '${merchantDetailsdata.getmerchantAdress[i].branchName} / ${merchantDetailsdata.getmerchantAdress[i].landmark}',
                                                    style: TextStyle(
                                                        color:
                                                            Color(primary_text),
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: sub_title),
                                                  )
                                                ],
                                              ),
                                              subtitle: Column(
                                                children: [
                                                  Text(
                                                    '${merchantDetailsdata.getmerchantAdress[i].address},${merchantDetailsdata.getmerchantAdress[i].city},${merchantDetailsdata.getmerchantAdress[i].state},${merchantDetailsdata.getmerchantAdress[i].state}',
                                                    style: TextStyle(
                                                        height: 1.2,
                                                        color:
                                                            Color(regular_text),
                                                        fontSize: small_text),
                                                  )
                                                ],
                                              ),
                                              trailing: Text(
                                                'Map',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: sub_title,
                                                    color:
                                                        Color(primary_color)),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: merchantDetailsdata
                                          .merchantDetailsData[0]
                                          .onlineUrl
                                          .isNotEmpty
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                'assets/images/merchant-online.png',
                                                fit: BoxFit.cover),
                                            SizedBox(
                                              height: spacing_small,
                                            ),
                                            Text(
                                              'Proceed to the merchants online website to explore products.',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: sub_title,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(regular_text)),
                                            ),
                                            SizedBox(
                                              height: spacing_small,
                                            ),
                                            SizedBox(
                                              height: button_height,
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary:
                                                        Color(primary_color),
                                                    elevation: 2,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              35),
                                                    )),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            InAppBrowser( merchantDetailsdata
                                          .merchantDetailsData[0]
                                          .onlineUrl)),
                                                  );
                                                },
                                                child: Text(
                                                  "Take Me There",
                                                  style: TextStyle(
                                                      fontSize: button_text),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Container(),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  child: ListView.builder(
                                      itemCount: merchantDetailsdata
                                          .getcashback.length,
                                      itemBuilder: (ctnx, i) {
                                        return Stack(
                                          children: [
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              elevation: 2.5,
                                              shadowColor:
                                                  Colors.grey.withOpacity(0.2),
                                              margin: EdgeInsets.only(
                                                bottom: 10,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10),
                                                child: Container(
                                                  height: 90,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            decoration:
                                                                new BoxDecoration(
                                                              color: Color(
                                                                  tag_grey_bg),
                                                              borderRadius:
                                                                  new BorderRadius
                                                                      .only(
                                                                topLeft:
                                                                    const Radius
                                                                            .circular(
                                                                        10.0),
                                                                bottomLeft:
                                                                    const Radius
                                                                            .circular(
                                                                        10.0),
                                                              ),
                                                            ),
                                                            width: 80,
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            // ignore: prefer_const_literals_to_create_immutables
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 5),
                                                                child: Row(
                                                                  // ignore: prefer_const_literals_to_create_immutables
                                                                  children: [
                                                                    HeroIcon(
                                                                      HeroIcons
                                                                          .ticket,
                                                                      color: Color(
                                                                          primary_color),
                                                                      size: 20,
                                                                    ),
                                                                    SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Text(
                                                                      merchantDetailsdata
                                                                          .getcashback[
                                                                              i]
                                                                          .percentage
                                                                          .toString(),
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              regular_text),
                                                                          fontWeight: FontWeight
                                                                              .w700,
                                                                          fontSize:
                                                                              sub_title),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 150,
                                                                child: Text(
                                                                  merchantDetailsdata
                                                                      .getcashback[
                                                                          i]
                                                                      .description,
                                                                  style: TextStyle(
                                                                      height:
                                                                          1.1,
                                                                      color: Color(
                                                                          regular_text),
                                                                      fontSize:
                                                                          10,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .clip),
                                                                ),
                                                              ),
                                                              Text(
                                                                'T&C',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        small_text,
                                                                    color: Color(
                                                                        primary_color),
                                                                    height:
                                                                        1.2),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 10),
                                                        child: Text(
                                                          'Claim',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  sub_title,
                                                              color: Color(
                                                                  primary_color),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              right: 80,
                                              top: 82,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Color(page_color),
                                                ),
                                                height: 14,
                                                width: 17,
                                              ),
                                            ),
                                            Positioned(
                                              right: 80,
                                              bottom: 90,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Color(page_color),
                                                ),
                                                height: 14,
                                                width: 17,
                                              ),
                                            ),
                                            Positioned(
                                              right: 88,
                                              bottom: 20,
                                              child: Container(
                                                  height: 65,
                                                  child: DottedLine(
                                                      direction: Axis.vertical,
                                                      dashColor:
                                                          Color(tag_grey_bg))),
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                              ].toList()),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Container();
        }),
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
      "merchant_id": widget.merchantId.toString()
    };
    var customerparam = {
      "token": Token,
      "user_id": userId,
    };
    await Provider.of<MerchantDetailsProvider>(context, listen: false)
        .MerchantDatafetch(tokenparam);
    // print(Provider.of<MerchantDetailsProvider>(context, listen: false)
    //     .getCatMerchantDetails[1].categoryDetailsname
    //     );
    await Provider.of<CustomerDetailsProvider>(context, listen: false)
        .customerDetailsfetch(customerparam);
    Provider.of<CustomerDetailsProvider>(context, listen: false)
        .getFavMerchant
        .forEach((element) {
      setState(() {
        selectedReportList.add(element.merchantId.toString());
      });

      print(selectedReportList);
    });
  }
}
