// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/Shop/Models/new_store_deals_model.dart';

import 'package:aira_pay/Shop/Providers/new_store_deals_provider.dart';
import 'package:aira_pay/Shop/Screens/category.dart';
import 'package:aira_pay/Shop/Screens/merchant_screen.dart';
import 'package:aira_pay/config.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewAirapay extends StatefulWidget {
  const NewAirapay({Key? key}) : super(key: key);

  @override
  State<NewAirapay> createState() => _NewAirapayState();
}

class _NewAirapayState extends State<NewAirapay> {
  @override
  void initState() {
    super.initState();
    _getMobileNumber();
  }

  @override
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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        "New to AiraPay",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: heading_title,
                            color: Color(primary_text)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 5.0,
          ),
          height: 145.0,
          child: Consumer<NewStoreDealsProvider>(
            builder: (context, newStoreDealsProvider, child) {
              return newStoreDealsProvider.NewAirapayData.isNotEmpty
                  ? Container(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: newStoreDealsProvider.NewAirapayData.length,
                        itemBuilder: (cntx, i) {
                          return Stack(children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Merchant(
                                              newStoreDealsProvider
                                                  .NewAirapayData[i].id)),
                                    );
                                  },
                                  child: Card(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Center(
                                        child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: Image.network(
                                          newStoreDealsProvider
                                              .NewAirapayData[i].banner,
                                          width: 138,
                                          height: 135,
                                          fit: BoxFit.cover),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: 15,
                              right: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                alignment: Alignment.centerRight,
                                child: newStoreDealsProvider
                                            .NewAirapayData[i].instore !=
                                        "0"
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3, vertical: 2),
                                        child: Row(
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            HeroIcon(
                                              HeroIcons.home,
                                              solid: true,
                                              size: extra_small_text,
                                              color: Color(white_color),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 2),
                                              child: Text(
                                                "in-store",
                                                style: TextStyle(
                                                    color: Color(white_color),
                                                    fontSize: extra_small_text,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 4),
                                        child: Row(
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            HeroIcon(
                                              HeroIcons.home,
                                              solid: true,
                                              size: extra_small_text,
                                              color: Color(white_color),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 2),
                                              child: Text(
                                                "online",
                                                style: TextStyle(
                                                    color: Color(white_color),
                                                    fontSize: extra_small_text,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                              ),
                            ),
                            Positioned(
                              top: 15,
                              left: 10,
                              child: Container(
                                width: 40,
                                height: 40,
                                // ignore: prefer_const_constructors
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage: NetworkImage(
                                      newStoreDealsProvider
                                          .NewAirapayData[i].logo
                                          .toString(),
                                    ),
                                    backgroundColor: Color(white_color),
                                  ),
                                ),
                              ),
                            ),
                          ]);
                        },
                      ),
                    )
                  : Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: ClipRRect(
                          // borderRadius: BorderRadius.circular(6),
                          child:
                              Image.asset("assets/images/loading-preview.gif",
                                  width: 138,
                                  height: 140,
                                  fit: BoxFit.fitWidth),
                        ),
                      ),
                    );
              ;
            },
          ),
        )
      ],
    );
  }

  _getMobileNumber() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString(
      "AuthToken",
    );
    var userId = sharedPreferences.getString("UserId");

    var tokenparam = {"token": token, "user_id": userId};
    await Provider.of<NewStoreDealsProvider>(context, listen: false)
        .NewAirapayfetch({"token": token, "user_id": userId});
  }
}
