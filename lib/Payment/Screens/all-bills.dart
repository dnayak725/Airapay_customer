// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/Payment/Providers/AllbillProvider.dart';
import 'package:aira_pay/Shop/Widgets/tabs.dart';
import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

import '../../Shop/Screens/home.dart';

class Allbills extends StatefulWidget {
  const Allbills({Key? key}) : super(key: key);

  @override
  State<Allbills> createState() => _RegisterState();
}

class _RegisterState extends State<Allbills> {
  @override
  List CategoryList = ["All", "Completed"];
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          bottomNavigationBar: Container(
            height: 70,
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home(false)));
                  },
                  icon: HeroIcon(
                    HeroIcons.arrowNarrowLeft,
                    color: Color(primary_color),
                  ),
                ),
                title: Text(
                  'All Bills',
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
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TabBar(
                      onTap: (value) {},
                      indicatorColor: Color(primary_color),
                      labelColor: Color(primary_text),
                      labelStyle: TextStyle(fontWeight: FontWeight.w700),
                      unselectedLabelColor: Color(text_grey),
                      isScrollable: true,
                      // ignore: prefer_const_literals_to_create_immutables
                      tabs: CategoryList.map((e) => Tab(
                            text: e,
                          )).toList()),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Color(border),
              ),
              SizedBox(
                height: spacing_small,
              ),
              Consumer<AllBillProvider>(
                  builder: (context, AllBillsData, child) {
                return AllBillsData.AllBillsData.length != null
                    ? Expanded(
                        child: TabBarView(
                            children: [
                          ListView.builder(
                              itemCount: AllBillsData.AllBillsData.length,
                              itemBuilder: (ctnx, i) {
                                //                          var date = DateTime.parse( AllBillsData.AllBillsData[0].createdAt.toString());
                                // final DateFormat formatter = DateFormat('yyyy-MM-dd, hh:mm:ss');
                                // final String formatted = formatter.format(date);
                                return Container(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8),
                                                    child: Text(
                                                      AllBillsData
                                                          .AllBillsData[0]
                                                          .createdAt
                                                          .toString(),
                                                      style: TextStyle(
                                                        color: Color(
                                                            card_header_grey_text),
                                                        fontSize: small_text,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  )),
                                              Card(
                                                child: ListTile(
                                                    leading: Container(
                                                      height: 40,
                                                      width: 40,
                                                      child: CircleAvatar(
                                                        radius: 30.0,
                                                        backgroundColor: Color(
                                                            merchant_avatar_bg),
                                                      ),
                                                    ),
                                                    title: Row(
                                                      // ignore: prefer_const_literals_to_create_immutables
                                                      children: [
                                                        Text(
                                                          AllBillsData
                                                              .AllBillsData[i]
                                                              .subMerchantName
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize:
                                                                  sub_title),
                                                        )
                                                      ],
                                                    ),
                                                    subtitle: Row(
                                                      children: [
                                                        Container(
                                                          height: 12,
                                                          width: 32,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: Color(
                                                                primary_color),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          height: 12,
                                                          width: 32,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: Color(
                                                                primary_color),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          height: 12,
                                                          width: 32,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: Color(
                                                                teel_text),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    trailing: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                          AllBillsData
                                                              .AllBillsData[0]
                                                              .amount
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize:
                                                                  sub_title),
                                                        ),
                                                        Text(
                                                          '2/3',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Color(
                                                                  text_grey),
                                                              fontSize:
                                                                  small_text),
                                                        )
                                                      ],
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                    ],
                                  ),
                                );
                              }),
                          Consumer<AllBillProvider>(
                              builder: (context, completedData, child) {
                            return completedData.completedBillsData.isNotEmpty
                                ? ListView.builder(
                                    itemCount:
                                        completedData.completedBillsData.length,
                                    itemBuilder: (ctnx, i) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Container(
                                                child: Column(
                                                  children: [
                                                    Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8),
                                                          child: Text(
                                                            completedData.completedBillsData[i].createdAt.toString(),
                                                            style: TextStyle(
                                                              color: Color(
                                                                  card_header_grey_text),
                                                              fontSize:
                                                                  small_text,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        )),
                                                    Card(
                                                      child: ListTile(
                                                          leading: Container(
                                                            height: 40,
                                                            width: 40,
                                                            child: CircleAvatar(
                                                              radius: 30.0,
                                                              backgroundColor:
                                                                  Color(
                                                                      merchant_avatar_bg),
                                                            ),
                                                          ),
                                                          title: Row(
                                                            // ignore: prefer_const_literals_to_create_immutables
                                                            children: [
                                                              Text(
                                                               completedData.completedBillsData[i].subMerchantName.toString(),
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize:
                                                                        sub_title),
                                                              )
                                                            ],
                                                          ),
                                                          subtitle: Row(
                                                            children: [
                                                              Container(
                                                                height: 12,
                                                                width: 32,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  color: Color(
                                                                      primary_color),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Container(
                                                                height: 12,
                                                                width: 32,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  color: Color(
                                                                      primary_color),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Container(
                                                                height: 12,
                                                                width: 32,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  color: Color(
                                                                      teel_text),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          trailing: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                'RM 60.00',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        sub_title),
                                                              ),
                                                              Text(
                                                                '3/3',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Color(
                                                                        text_grey),
                                                                    fontSize:
                                                                        small_text),
                                                              )
                                                            ],
                                                          )),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 12,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    })
                                : Center(
                                    child: Container(
                                        child: Text("No data found")));
                          }),
                        ].toList()),
                      )
                    : Text("No data found");
              }),
            ],
          )),
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
    await Provider.of<AllBillProvider>(context, listen: false)
        .Allbillfetch(tokenparam);
    print("hello");
    print(Provider.of<AllBillProvider>(context, listen: false)
        .AllBillsData[0]
        .billCode);
  }
}
