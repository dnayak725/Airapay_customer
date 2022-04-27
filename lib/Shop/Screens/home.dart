// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/Auth/Providers/CustomerDetailsProvider.dart';
import 'package:aira_pay/Auth/Providers/LoginProvider.dart';
import 'package:aira_pay/Shop/Providers/new_store_deals_provider.dart';
import 'package:aira_pay/Shop/Screens/notification.dart';
import 'package:aira_pay/Shop/Widgets/bottom_modal.dart';
import 'package:aira_pay/Shop/Widgets/home_slider.dart';
import 'package:aira_pay/Shop/Widgets/new_airapay.dart';
import 'package:aira_pay/Shop/Widgets/personalise.dart';
import 'package:aira_pay/Shop/Widgets/promo_deals.dart';
import 'package:aira_pay/Shop/Widgets/search.dart';
import 'package:aira_pay/Shop/Widgets/tabs.dart';
import 'package:aira_pay/config.dart';
import 'package:aira_pay/config/project_config.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Providers/SpendingLimitProvider.dart';

class Home extends StatefulWidget {
  var spendingcheck;
  Home(this.spendingcheck);
  @override
  State<Home> createState() => _HomeState();
}

final controller = ScrollController();
var customerName;
var profilePhoto;
var spendingLimitCheck = false;

class _HomeState extends State<Home> {
  _syncLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var token = sharedPreferences.getString("AuthToken");
    var userId = sharedPreferences.getString("UserId");
    await Provider.of<CustomerDetailsProvider>(context, listen: false)
        .customerDetailsfetch({"token": token, "user_id": userId});
    await Provider.of<NewStoreDealsProvider>(context, listen: false)
        .NewAirapayfetch({"token": token, "user_id": userId});
    await Provider.of<SpendingLimitProvider>(context, listen: false)
        .SpendingLimitfetch({"token": token, "user_id": userId});

    if (spendingLimitCheck == true) {
      _modalBottomSheetMenu();
    }
  }

  void _modalBottomSheetMenu() async {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await showModalBottomSheet(
          context: context,
          builder: (builder) {
            return Modal(
                Provider.of<SpendingLimitProvider>(context, listen: false)
                    .spendingLimit[0]
                    .spendingLimit);
          });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      spendingLimitCheck = widget.spendingcheck;
    });
    print(spendingLimitCheck);
    _syncLogin();
  }

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
      backgroundColor: Color(page_color),
      // extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Consumer<CustomerDetailsProvider>(
          builder: (context, customerDetailsdata, child) {
        return NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverPadding(
              padding: const EdgeInsets.only(top: 20),
              sliver: SliverAppBar(
                elevation: 0,
                backgroundColor: Color(appbar_default),
                pinned: true,
                snap: true,
                floating: true,
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        "Good Morning",
                        style: TextStyle(
                            fontSize: sub_title,
                            fontWeight: FontWeight.w600,
                            color: Color(fusica_text)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child:
                          customerDetailsdata.userDetails.customerName != null
                              ? Text(
                                  customerDetailsdata.userDetails.customerName,
                                  style: TextStyle(
                                      color: Color(primary_text),
                                      fontSize: app_tittle,
                                      fontWeight: FontWeight.w700),
                                )
                              : Text("Guest"),
                    ),
                  ],
                ),
                leadingWidth: 80,

                // ignore: unnecessary_new
                leading: Container(
                  margin: EdgeInsets.only(
                    left: 20,
                  ),
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                      customerDetailsdata.userDetails.profilepic,
                    ),
                    backgroundColor: Color(white_color),
                  ),
                ),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 20, top: 7),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xFFF2E3F4)),
                      alignment: Alignment.center,
                      height: 40,
                      width: 50,
                      child: Stack(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NotificationSceen()),
                              );
                            },
                            child: HeroIcon(
                              HeroIcons.bell,
                              solid: true,
                              color: Color(primary_color),
                              size: icon_size,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                bottom: PreferredSize(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Search(),
                  ),
                  preferredSize: Size.fromHeight(70.0),
                ),
              ),
            )
          ],
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(
                    height: spacing_small,
                  ),
                  NewAirapay(),
                  SizedBox(
                    height: spacing_small,
                  ),
                  SliderCarousel(),
                  SizedBox(
                    height: spacing_medium,
                  ),
                  PromoDeals(),
                  Personalise(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
