// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/Auth/Providers/CustomerDetailsProvider.dart';
import 'package:aira_pay/Shop/Providers/ExploreProvider.dart';
import 'package:aira_pay/Shop/Providers/FavouriteMerchantProvider.dart';
import 'package:aira_pay/Shop/Providers/personaliseCategoryProvider.dart';
import 'package:aira_pay/Shop/Screens/category_view.dart';
import 'package:aira_pay/Shop/Screens/personalise_screen.dart';
import 'package:aira_pay/config.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';

import '../Screens/merchant_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Personalise extends StatefulWidget {
  const Personalise({Key? key}) : super(key: key);

  @override
  State<Personalise> createState() => _PersonaliseState();
}

class _PersonaliseState extends State<Personalise> {
  @override
  var userId;
  var Token;
  var Solid = false;
  var likeColor = false;
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,top:10),
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // ignore: prefer_const_constructors
                      child: Text(
                        "Explore",
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: heading_title,
                            color: Color(primary_text)),
                      ),
                    ),

                    // Container(
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PersonaliseScreen(),
                        ));
                  },
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      Icon(
                        FontAwesomeIcons.cog,
                        color: Color(primary_color),
                        size: 16,
                      ),
                      // ignore: prefer_const_constructors
                      Padding(
                        padding: const EdgeInsets.only(top: 3, left: 5),
                        // ignore: prefer_const_constructors
                        child: Text(
                          "Personalise",
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color(primary_color),
                          ),
                        ),
                      ),
                      // ignore: prefer_const_constructors
                    ],
                  ),
                ) // ignore: prefer_const_constructors
              ],
            ),
          ),
        ),
     Provider.of<CustomerDetailsProvider>(context, listen: false)
        .getIntrestCategory.length ==0 ?   Container(
          margin: const EdgeInsets.only(top: 15, left: 5, right: 5),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(grey_bg_deep),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: HeroIcon(
                        HeroIcons.heart,
                        color: Color(grey_bg_deep_text),
                        solid: true,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Tell us what you like",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color(grey_bg_deep_text)),
                          ),
                          Text(
                            "Tell us what you're interested in and we'll tailor content and offers for you. You can make changes to your selections at any time under the 'Me' section.",
                            style: TextStyle(
                                fontSize: small_text,
                                color: Color(grey_bg_deep_text),
                                height: 1.5),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: button_height,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 249, 226, 255),
                        side: BorderSide(
                          width: 2.0,
                          color: Color(primary_color),
                        ),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PersonaliseScreen(),
                            ));
                      },
                      child: Text(
                        "Personalise my Experience",
                        style: TextStyle(
                            fontSize: button_text,
                            fontWeight: FontWeight.w700,
                            color: Color(primary_color)),
                      )),
                ),
              ],
            ),
          ),
        ):Container(),
        Consumer<ExploreProvider>(builder: (context, exploreData, child) {
          return exploreData.ExploreMerchants.length != 0
              ? Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 0.0,
                  ),
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 10,bottom: 80,left: 2,right: 2),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: exploreData.ExploreMerchants.length,
                      itemBuilder: (ctnx, i) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 0),
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
                                              exploreData
                                                  .ExploreMerchants[i].id)),
                                    );
                                  },
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(6),
                                            topRight: Radius.circular(6)),
                                        child: Image.network(
                                            exploreData
                                                .ExploreMerchants[i].banner
                                                .toString(),
                                            width: double.infinity,
                                            height: 138,
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
                                              backgroundImage: NetworkImage(
                                                exploreData
                                                    .ExploreMerchants[i].logo
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
                                            exploreData.ExploreMerchants[i]
                                                        .instore !=
                                                    "0"
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.all(2),
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
                                                              HeroIcons.home,
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
                                                                      left: 2),
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
                                                  )
                                                : Padding(
                                                    padding:
                                                        const EdgeInsets.all(2),
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
                                                              HeroIcons.home,
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
                                                                      left: 2),
                                                              child: Text(
                                                                'Online',
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
                                                MainAxisAlignment.spaceBetween,
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              Text(
                                                exploreData
                                                    .ExploreMerchants[i].name,
                                                style: TextStyle(
                                                    color: Color(regular_text),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: button_text),
                                              ),
                                              // GestureDetector(
                                              //   onTap: () async {
                                              //     var paramdata = {
                                              //       "token": Token,
                                              //       "user_id": userId,
                                              //       "merchant_id": exploreData
                                              //           .ExploreMerchants[i].id
                                              //           .toString()
                                              //     };
                                              //     await Provider.of<
                                              //                 FavoriteMerchantProvider>(
                                              //             context,
                                              //             listen: false)
                                              //         .FavouriteMerchantfetch(
                                              //             paramdata);

                                              //     setState(() {
                                              //       likeColor = !likeColor;
                                              //       Solid = !Solid;
                                              //     });
                                              //   },
                                              //   child: Padding(
                                              //     padding:
                                              //         const EdgeInsets.only(
                                              //             right: 10),
                                              //     child: HeroIcon(
                                              //       HeroIcons.heart,solid:Solid ,
                                              //       color: likeColor
                                              //           ? Color(primary_color)
                                              //           : Color(icon_gery),
                                              //       size: 25,
                                              //     ),
                                              //   ),
                                              // )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Row(
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: List.generate(
                                              exploreData.ExploreMerchants[i]
                                                  .getCategory.length,
                                              (index) => Padding(
                                                    padding:
                                                        const EdgeInsets.all(3),
                                                    child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(3),
                                                          color: Color(grey_bg),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10,
                                                                  vertical: 2),
                                                          child: Text(
                                                            exploreData
                                                                .ExploreMerchants[
                                                                    i]
                                                                .getCategory[
                                                                    index]
                                                                .categoryDetailsname,
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
    Token = sharedPreferences.getString(
      "AuthToken",
    );
    userId = sharedPreferences.getString(
      "UserId",
    );
    var tokenparam = {"token": Token, "user_id": userId};
    await Provider.of<ExploreProvider>(context, listen: false)
        .ExploreDatafetch(tokenparam);
  }
}
