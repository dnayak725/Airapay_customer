// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:aira_pay/Shop/Providers/MerchantSearchProvider.dart';
import 'package:aira_pay/Shop/Screens/merchant_screen.dart';
import 'package:aira_pay/Shop/Widgets/search.dart';
import 'package:aira_pay/Shop/Widgets/tabs.dart';
import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Auth/Providers/CustomerDetailsProvider.dart';
import '../Providers/FavouriteMerchantProvider.dart';

class SerarchScreen extends StatefulWidget {
  const SerarchScreen({Key? key}) : super(key: key);

  @override
  State<SerarchScreen> createState() => _SerarchScreenState();
}

class _SerarchScreenState extends State<SerarchScreen> {
  @override
  var Token;
  var userId;
  final _searchController = TextEditingController();
  List<String> selectedReportList = [];
  List<dynamic> selectedSearchDropdown = [
    {'id': '1', 'tag_name': 'Discover Vouchers'},
    {'id': '2', 'tag_name': 'In-Store'},
    {'id': '3', 'tag_name': 'Online'}
  ];
  List<String> selectedFavoriteMerchant = [];
  var discover_voucher = "0";
  var instore = "0";
  var online = "0";
  Widget build(BuildContext context) {
    print(selectedFavoriteMerchant);
    return Scaffold(
      bottomNavigationBar: Tabs(0),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Row(
            children: [
              Flexible(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      elevation: 2.5,
                      shadowColor: Colors.black.withOpacity(0.3),
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Container(
                        height: 52,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 0),
                          child: Row(
                            children: <Widget>[
                              // Padding(
                              //   padding: const EdgeInsets.only(right: 15, left: 10),
                              //   child: Stack(
                              //     // ignore: prefer_const_literals_to_create_immutables
                              //     children: [
                              //       GestureDetector(
                              //         onTap: () => {},
                              //         // ignore: prefer_const_constructors
                              //         child: Icon(
                              //           Icons.search_outlined,
                              //           color: Color(label_grey),
                              //           size: 32,
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              Expanded(
                                child: Container(
                                  child: TextFormField(
                                    controller: _searchController,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    onChanged: (value) {
                                      SearchAllMerchant();
                                    },
                                    // ignore: unnecessary_new
                                    decoration: new InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        hintStyle: TextStyle(
                                            color: Color(text_grey),
                                            fontWeight: FontWeight.w500),
                                        hintText: "Search"),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 10, right: 5),
                                child: VerticalDivider(
                                  color: Color(tag_grey_bg),
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 10,
                                ),
                                child: HeroIcon(
                                  HeroIcons.locationMarker,
                                  solid: true,
                                  color: Color(primary_color),
                                  size: icon_size,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _searchController.text = "";
                  });
                  SearchAllMerchant();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 30),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        fontSize: small_title,
                        color: Color(text_grey),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
          Container(
              margin: const EdgeInsets.only(top: 20, bottom: 15),
              height: 42.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: selectedSearchDropdown.length,
                  itemBuilder: (ctnx, i) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectedReportList
                              .contains(selectedSearchDropdown[i]["id"])) {
                            selectedReportList
                                .remove(selectedSearchDropdown[i]["id"]);
                          } else {
                            selectedReportList
                                .add(selectedSearchDropdown[i]["id"]);
                          }
                          if (selectedReportList.contains('1')) {
                            discover_voucher = "1";
                          } else {
                            discover_voucher = "0";
                          }
                          if (selectedReportList.contains('2')) {
                            instore = "1";
                          } else {
                            instore = "0";
                          }
                          if (selectedReportList.contains('3')) {
                            online = "1";
                          } else {
                            online = "0";
                          }
                          SearchAllMerchant();
                        });
                      },
                      child: Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                        elevation: 0,
                        color: selectedReportList
                                .contains(selectedSearchDropdown[i]["id"])
                            ? Color(primary_color)
                            : Color(grey_bg_deep),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        // ignore: prefer_const_constructors
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Center(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: selectedSearchDropdown[i]['id'] == "1"
                                      ? HeroIcon(
                                          HeroIcons.tag,
                                          solid: true,
                                          color: selectedReportList.contains(
                                                  selectedSearchDropdown[i]
                                                      ["id"])
                                              ? Color(white_color)
                                              : Color(primary_color),
                                        )
                                      : selectedSearchDropdown[i]['id'] == "2"
                                          ? HeroIcon(
                                              HeroIcons.home,
                                              solid: true,
                                              color: selectedReportList.contains(
                                                      selectedSearchDropdown[i]
                                                          ["id"])
                                                  ? Color(white_color)
                                                  : Color(primary_color),
                                            )
                                          : HeroIcon(
                                              HeroIcons.statusOnline,
                                              solid: true,
                                              color: selectedReportList.contains(
                                                      selectedSearchDropdown[i]
                                                          ["id"])
                                                  ? Color(white_color)
                                                  : Color(primary_color),
                                            ),
                                ),
                                Text(
                                  selectedSearchDropdown[i]['tag_name'],
                                  style: TextStyle(
                                      color: selectedReportList.contains(
                                              selectedSearchDropdown[i]["id"])
                                          ? Color(white_color)
                                          : Color(serch_grey_text),
                                      fontWeight: FontWeight.w700,
                                      fontSize: sub_title),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })),
          Divider(
            color: Color(tag_grey_bg),
            height: 1,
          ),
          Consumer<MerchantSearchProvider>(
              builder: (context, SearchAllMerchant, child) {
            return SearchAllMerchant.MerchantSearchData.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                        itemCount: SearchAllMerchant.MerchantSearchData.length,
                        itemBuilder: (ctnx, i) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Merchant(
                                        SearchAllMerchant
                                            .MerchantSearchData[i].id)),
                              );
                            },
                            child: Card(
                              margin: EdgeInsets.zero,

                              elevation: 0,
                              color: Color(white_color),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              // ignore: prefer_const_constructors
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 5, left: 10, right: 10),
                                child: ListTile(
                                    dense: true,
                                    contentPadding: EdgeInsets.zero,
                                    leading: CircleAvatar(
                                      radius: 30.0,
                                      // backgroundImage: NetworkImage(
                                      //   "https://helobnv2.quocent.com/frontend/images/user-37.jpg",
                                      // ),
                                      backgroundColor: Color(tag_grey_bg),
                                    ),
                                    trailing: GestureDetector(
                                      onTap: () async {
                                        setState(() {
                                          if (selectedFavoriteMerchant.contains(
                                              SearchAllMerchant
                                                  .MerchantSearchData[i].id
                                                  .toString())) {
                                            selectedFavoriteMerchant.remove(
                                                SearchAllMerchant
                                                    .MerchantSearchData[i].id
                                                    .toString());
                                            var paramdata = {
                                              "token": Token,
                                              "user_id": userId,
                                              "merchant_id": SearchAllMerchant
                                                  .MerchantSearchData[i].id
                                                  .toString(),
                                              "status": "false",
                                            };
                                            Provider.of<FavoriteMerchantProvider>(
                                                    context,
                                                    listen: false)
                                                .FavouriteMerchantfetch(
                                                    paramdata);
                                          } else {
                                            selectedFavoriteMerchant.add(
                                                SearchAllMerchant
                                                    .MerchantSearchData[i].id
                                                    .toString());
                                            var paramdata = {
                                              "token": Token,
                                              "user_id": userId,
                                              "merchant_id": SearchAllMerchant
                                                  .MerchantSearchData[i].id
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
                                      },
                                      child: selectedFavoriteMerchant.contains(
                                              SearchAllMerchant
                                                  .MerchantSearchData[i].id
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
                                    title: Text(
                                      SearchAllMerchant
                                          .MerchantSearchData[i].name
                                          .toString(),
                                      style: TextStyle(
                                          color: Color(primary_text),
                                          fontWeight: FontWeight.w600,
                                          fontSize: sub_title),
                                    ),
                                    subtitle: Row(
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: List.generate(
                                            SearchAllMerchant
                                                .MerchantSearchData[i]
                                                .getCategory
                                                .length,
                                            (index) => Padding(
                                                  padding:
                                                      const EdgeInsets.all(3),
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3),
                                                        color: Color(grey_bg),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 10,
                                                                vertical: 2),
                                                        child: Text(
                                                          SearchAllMerchant
                                                              .MerchantSearchData[
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
                                                )))),
                              ),
                            ),
                          );
                        }),
                  )
                : Center(child: Text("No data found"));
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
    var customerparam = {
      "token": Token,
      "user_id": userId,
    };
    SearchAllMerchant();
    await Provider.of<CustomerDetailsProvider>(context, listen: false)
        .customerDetailsfetch(customerparam);
    Provider.of<CustomerDetailsProvider>(context, listen: false)
        .getFavMerchant
        .forEach((element) {
      setState(() {
        selectedFavoriteMerchant.add(element.merchantId.toString());
      });
    });
  }

  SearchAllMerchant() async {
    var tokenparam = {
      "token": Token,
      "merchant_name": _searchController.text,
      "discover_voucher": discover_voucher,
      "instore": instore,
      "online": online,
      "user_id": userId
    };
    await Provider.of<MerchantSearchProvider>(context, listen: false)
        .SearchMerchantfetch(tokenparam);

    print(Provider.of<MerchantSearchProvider>(context, listen: false)
        .MerchantSearchData[0]
        .callbackUrl);
  }
}
