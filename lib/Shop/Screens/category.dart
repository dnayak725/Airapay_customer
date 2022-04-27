// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/Shop/Providers/personaliseCategoryProvider.dart';
import 'package:aira_pay/Shop/Screens/category_view.dart';
import 'package:aira_pay/Shop/Widgets/search.dart';
import 'package:aira_pay/Shop/Widgets/tabs.dart';
import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
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
    ],),
        height: 70,
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            child: Tabs(0)),
      ),
      backgroundColor: Color(page_color),
      body: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Card(
              margin: EdgeInsets.zero,
                elevation: 2.5,
                                      shadowColor: Colors.black.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 52,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 20),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          child: Stack(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              GestureDetector(
                                onTap: () => {},
                                // ignore: prefer_const_constructors
                                child: HeroIcon(
                                  HeroIcons.search,
                                  color: Color(label_grey),
                                  size: icon_size,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: TextFormField(
                              onTap: () {},

                              // ignore: unnecessary_new
                              decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintStyle: TextStyle(
                                      color: Color(label_grey), fontSize: sub_title),
                                  hintText: "Search for shops"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, right: 10),
                          child: VerticalDivider(
                            color: Color(border),
                            thickness: 0.5,
                          ),
                        ),
                        HeroIcon(
                          HeroIcons.locationMarker,
                          color: Color(primary_color),
                          size: icon_size,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Consumer<PersonaliseCategoryProvider>(
              builder: (context, categoryProvider, child) {
            return categoryProvider.PersonaliseCategory.categories.length != 0
                ? Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 0,
                          ),
                          shrinkWrap: true,
                          itemCount: categoryProvider
                              .PersonaliseCategory.categories.length,
                          itemBuilder: (cntx, i) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CategoryView(
                                          categoryProvider.PersonaliseCategory
                                              .categories[i].id,categoryProvider.PersonaliseCategory.categories[i].name.toString())),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Card(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Container(
                                    width: 100.0,
                                    height: 90.0,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            // ignore: unnecessary_new
                                            colorFilter: new ColorFilter.mode(
                                                Colors.black.withOpacity(0.3),
                                                BlendMode.darken),
                                            image: NetworkImage(categoryProvider
                                                .PersonaliseCategory
                                                .categories[i]
                                                .image
                                                .toString()),
                                            fit: BoxFit.cover)),
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                          categoryProvider.PersonaliseCategory
                                              .categories[i].name
                                              .toString(),
                                          style: TextStyle(
                                              color: Color(white_color),
                                              fontWeight: FontWeight.w800,
                                              height: 1.2,
                                              fontSize: app_tittle),
                                          textAlign: TextAlign.center),
                                    )),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  )
                : Container();
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
    var Token = sharedPreferences.getString(
      "AuthToken",
    );
    var userId = sharedPreferences.getString(
      "UserId",
    );

    var tokenparam = {"token": Token, "user_id": userId};

    await Provider.of<PersonaliseCategoryProvider>(context, listen: false)
        .Categoryfetch(tokenparam);
  }
}
