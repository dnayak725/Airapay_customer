// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/Shop/Providers/PromoDealsProvider.dart';
import 'package:aira_pay/Shop/Screens/merchant_screen.dart';
import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PromoDeals extends StatefulWidget {
  const PromoDeals({Key? key}) : super(key: key);

  @override
  State<PromoDeals> createState() => _PromoDealsState();
}

class _PromoDealsState extends State<PromoDeals> {
  @override
  var promodeals_title;
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // ignore: prefer_const_constructors
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: promodeals_title != null
                          ? Text(
                              promodeals_title,
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: heading_title,
                                  color: Color(primary_text)),
                            )
                          : Text(""),
                    ),
                  ),
                  // Container(
                ],
              ),
              // ignore: prefer_const_constructors
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                      "View All",
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        fontSize: sub_title,
                        fontWeight: FontWeight.w700,
                        color: Color(primary_color),
                      ),
                    ),
                  ),
                  HeroIcon(
                    HeroIcons.chevronRight,
                    solid: true,
                    color: Color(primary_color),
                    size: heading_title,
                  )
                ],
              )
            ],
          ),
        ),
        Consumer<PromoDealsProvider>(
            builder: (context, promoDealsProvider, child) {
          return promoDealsProvider.PromoDealsData.length != 0
              ? Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  height: 216,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: promoDealsProvider.getPromodeals.length,
                      itemBuilder: (ctnx, i) {
                        return Container(
                          width: 203,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Merchant(
                                        promoDealsProvider
                                            .getPromodeals[i].id)),
                              );
                            },
                            child: Card(
                                elevation: 2.5,
                                    shadowColor: Colors.black.withOpacity(0.3),
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(6),
                                            topRight: Radius.circular(6)),
                                        child: Image.network(
                                            promoDealsProvider
                                                .getPromodeals[i].banner
                                                .toString(),
                                            width: 203,
                                            height: 125,
                                            fit: BoxFit.cover),
                                      ),
                                      Positioned(
                                        top: 10,
                                        right: 10,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                ),
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 3,
                                                      vertical: 2),
                                                  child: Row(
                                                    // ignore: prefer_const_literals_to_create_immutables
                                                    children: [
                                                      HeroIcon(
                                                        HeroIcons.tag,
                                                        solid: true,
                                                        size: extra_small_text,
                                                        color:
                                                            Color(white_color),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 2),
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
                                            Padding(
                                              padding: const EdgeInsets.all(2),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                ),
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 3,
                                                      vertical: 2),
                                                  child: Row(
                                                    // ignore: prefer_const_literals_to_create_immutables
                                                    children: [
                                                      HeroIcon(
                                                        HeroIcons.home,
                                                        solid: true,
                                                        size: extra_small_text,
                                                        color:
                                                            Color(white_color),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 2),
                                                        child: Text(
                                                          'In-store',
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
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                      top: 10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Text(
                                          promoDealsProvider
                                              .getPromodeals[i].merchantTitle,
                                          style: TextStyle(
                                              color: Color(primary_text),
                                              fontWeight: FontWeight.w700,
                                              fontSize: sub_title,
                                              height: 1.2),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            promoDealsProvider
                                                .PromoDealsData[0].title,
                                            style: TextStyle(
                                                fontSize: small_text,
                                                color: Color(black_text),
                                                overflow: TextOverflow.fade),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }))
              : Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: ClipRRect(
                      // borderRadius: BorderRadius.circular(6),
                      child: Image.asset("assets/images/loading-preview.gif",
                          width: 138, height: 140, fit: BoxFit.fitWidth),
                    ),
                  ),
                );
        }),
      ],
    );
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    _getmobilenumber();
  }

  _getmobilenumber() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var Token = sharedPreferences.getString(
      "AuthToken",
    );

    var userId = sharedPreferences.getString(
      "UserId",
    );
    var tokenparam = {"token": Token, "user_id": userId};
    await Provider.of<PromoDealsProvider>(context, listen: false)
        .PromoDealsfetch(tokenparam);
    print("promodeals");
    // print(Provider.of<PromoDealsProvider>(context, listen: false)
    //     .getPromodeals
    //     .length);
    setState(() {
      promodeals_title = Provider.of<PromoDealsProvider>(context, listen: false)
          .PromoDealsData[0]
          .title;
    });
  }
}
