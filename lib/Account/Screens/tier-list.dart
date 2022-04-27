// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

import '../../Shop/Widgets/tabs.dart';

class TierList extends StatefulWidget {
  const TierList({Key? key}) : super(key: key);

  @override
  State<TierList> createState() => _RegisterState();
}

class _RegisterState extends State<TierList> {
  @override
  List CategoryList = ["Basic", "Silver", "Gold"];
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: Tabs(0),
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
                  'Tier List',
                  style: TextStyle(
                      color: Color(primary_text),
                      fontSize: app_tittle,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ),
          backgroundColor: Color(page_color),
          
          body: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                
                Align(
                  alignment: Alignment.topLeft,
                  child: TabBar(
                      onTap: (value) {},
                      indicatorColor: Color(primary_color),
                      indicatorWeight: 3,
                      labelColor: Color(primary_text),
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
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
                color: Color(border),
              ),
                Expanded(
                  child: TabBarView(
                      children: [
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Color(tag_grey_bg),
                            child: IconButton(
                              icon: HeroIcon(HeroIcons.star,
                                  solid: true,
                                  size: 18,
                                  color: Color(text_grey)),
                              onPressed: () {},
                            ),
                          ),
                          Text('Basic',
                              style: TextStyle(
                                  fontSize: heading_title,
                                  fontWeight: FontWeight.w500,
                                  color: Color(primary_text))),
                          SizedBox(
                            height: spacing_small,
                          ),
                          Card(
                                elevation: 2.5,
                                    shadowColor: Colors.black.withOpacity(0.3),
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                          
                            child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(15),
                             
                                child: Column(
                                  children: const [
                                    Text(
                                      'Spending Limit',
                                      style: TextStyle(
                                          fontSize: sub_title,
                                          color: Color(text_grey),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: spacing_extra_small,
                                    ),
                                    Text(
                                      'RM 150.00',
                                      style: TextStyle(
                                          fontSize: app_tittle,
                                          fontWeight: FontWeight.w700,
                                          color: Color(fusica_text)),
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: spacing_small,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Benefits',
                              style: TextStyle(
                                  fontSize: heading_title,
                                  fontWeight: FontWeight.w700,
                                  color: Color(primary_text)),
                            ),
                          ),
                          SizedBox(
                            height: spacing_extra_small,
                          ),
                        Card(
                            
                             elevation: 2.5,
                                    shadowColor: Colors.black.withOpacity(0.3),
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                              
                                child: Column(
                                  children: [
                                    Container(
                                      child: ListTile(
                                              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                        dense: true,
                                        minLeadingWidth: 10,
                                        leading: HeroIcon(
                                          HeroIcons.checkCircle,
                                          color: Colors.green,
                                          solid: true,
                                        ),
                                        title: Text(
                                          'Earn 2x points for each RM1 spent.',
                                          style: TextStyle(
                                              fontSize: sub_title,
                                              fontWeight: FontWeight.w700,
                                              color: Color(primary_text)),
                                        ),
                                      ),
                                    ),
                                  
                                    Container(
                                      child: ListTile(
                                        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                        dense: true,
                                        minLeadingWidth: 10,
                                        leading: HeroIcon(
                                          HeroIcons.xCircle,
                                          solid: true,
                                          color: Color(label_grey),
                                        ),
                                        title: Text(
                                          'Exclusive vouchers',
                                          style: TextStyle(
                                              fontSize: sub_title,
                                              fontWeight: FontWeight.w700,
                                              color: Color(primary_text)),
                                        ),
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
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Color.fromARGB(255, 95, 95, 95),
                            child: IconButton(
                              icon: HeroIcon(HeroIcons.star,
                                  solid: true, color: Colors.white),
                              onPressed: () {},
                            ),
                          ),
                          Text('Silver',
                              style: TextStyle(
                                  fontSize: heading_title,
                                  fontWeight: FontWeight.w500,
                                  color: Color(primary_text))),
                          SizedBox(
                            height: spacing_small,
                          ),
                          Card(
                             elevation: 2.5,
                                    shadowColor: Colors.black.withOpacity(0.3),
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                            child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(15),
                              
                                child: Column(
                                  children: const [
                                    Text(
                                      'Spending Limit',
                                      style: TextStyle(
                                          fontSize: sub_title,
                                          color: Color(text_grey),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: spacing_extra_small,
                                    ),
                                    Text(
                                      'RM 3,000.00',
                                      style: TextStyle(
                                          fontSize: app_tittle,
                                          fontWeight: FontWeight.w700,
                                          color: Color(fusica_text)),
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Benefits',
                              style: TextStyle(
                                  fontSize: heading_title,
                                  fontWeight: FontWeight.w700,
                                  color: Color(primary_text)),
                            ),
                          ),
                          SizedBox(
                            height: spacing_extra_small,
                          ),
                          Card(
                            
                             elevation: 2.5,
                                    shadowColor: Colors.black.withOpacity(0.3),
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                              
                                child: Column(
                                  children: [
                                    Container(
                                      child: ListTile(
                                              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                        dense: true,
                                        minLeadingWidth: 10,
                                        leading: HeroIcon(
                                          HeroIcons.checkCircle,
                                          color: Colors.green,
                                          solid: true,
                                        ),
                                        title: Text(
                                          'Earn 2x points for each RM1 spent.',
                                          style: TextStyle(
                                              fontSize: sub_title,
                                              fontWeight: FontWeight.w700,
                                              color: Color(primary_text)),
                                        ),
                                      ),
                                    ),
                                  
                                    Container(
                                      child: ListTile(
                                        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                        dense: true,
                                        minLeadingWidth: 10,
                                        leading: HeroIcon(
                                          HeroIcons.xCircle,
                                          solid: true,
                                          color: Color(label_grey),
                                        ),
                                        title: Text(
                                          'Exclusive vouchers',
                                          style: TextStyle(
                                              fontSize: sub_title,
                                              fontWeight: FontWeight.w700,
                                              color: Color(primary_text)),
                                        ),
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
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Color.fromARGB(255, 133, 67, 6),
                            child: IconButton(
                              icon: Icon(Icons.star,
                                  color: Color.fromARGB(255, 255, 174, 68)),
                              onPressed: () {},
                            ),
                          ),
                          Text('Gold',
                              style: TextStyle(
                                  fontSize: heading_title,
                                  fontWeight: FontWeight.w500,
                                  color: Color(primary_text))),
                          SizedBox(
                            height: spacing_small,
                          ),
                          Card(
                             elevation: 2.5,
                                    shadowColor: Colors.black.withOpacity(0.3),
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                            child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                              
                                child: Column(
                                  children: const [
                                    Text(
                                      'Spending Limit',
                                      style: TextStyle(
                                          fontSize: sub_title,
                                          color: Color(text_grey),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'up to RM 10,000.00',
                                      style: TextStyle(
                                          fontSize: app_tittle,
                                          fontWeight: FontWeight.w700,
                                          color: Color(fusica_text)),
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: spacing_small,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Benefits',
                              style: TextStyle(
                                  fontSize: heading_title,
                                  fontWeight: FontWeight.w700,
                                  color: Color(primary_text)),
                            ),
                          ),
                          SizedBox(
                            height: spacing_extra_small,
                          ),
                         Card(
                            
                             elevation: 2.5,
                                    shadowColor: Colors.black.withOpacity(0.3),
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                              
                                child: Column(
                                  children: [
                                    Container(
                                      child: ListTile(
                                              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                        dense: true,
                                        minLeadingWidth: 10,
                                        leading: HeroIcon(
                                          HeroIcons.checkCircle,
                                          color: Colors.green,
                                          solid: true,
                                        ),
                                        title: Text(
                                          'Earn 2x points for each RM1 spent.',
                                          style: TextStyle(
                                              fontSize: sub_title,
                                              fontWeight: FontWeight.w700,
                                              color: Color(primary_text)),
                                        ),
                                      ),
                                    ),
                                  
                                    Container(
                                      child: ListTile(
                                        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                        dense: true,
                                        minLeadingWidth: 10,
                                        leading: HeroIcon(
                                          HeroIcons.xCircle,
                                          solid: true,
                                          color: Color(label_grey),
                                        ),
                                        title: Text(
                                          'Exclusive vouchers',
                                          style: TextStyle(
                                              fontSize: sub_title,
                                              fontWeight: FontWeight.w700,
                                              color: Color(primary_text)),
                                        ),
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
                  ].toList()),
                ),
              ],
            ),
          )),
    );
  }

  color(int primary_text) {}
}
