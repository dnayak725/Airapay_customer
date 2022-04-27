import 'package:aira_pay/Shop/Providers/PromoDealsProvider.dart';
import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';

import 'merchant_screen.dart';

class PromodealsView extends StatefulWidget {
  const PromodealsView({Key? key}) : super(key: key);

  @override
  State<PromodealsView> createState() => _PromodealsViewState();
}

class _PromodealsViewState extends State<PromodealsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
             Provider.of<PromoDealsProvider>(context, listen: false)
          .PromoDealsData[0]
          .title,
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
         Consumer<PromoDealsProvider>(
              builder: (context, promoDealsProvider, child) {
            return promoDealsProvider.PromoDealsData.length != 0
                ? Expanded(
                  child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                     
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListView.builder(
                     
                              
                            itemCount: promoDealsProvider.getPromodeals.length,
                            itemBuilder: (ctnx, i) {
                              
                              return Container(
                             
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Merchant(
                                              promoDealsProvider.getPromodeals[i].id)),
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
                                                  width: double.infinity,
                                                  height: 125,
                                                  fit: BoxFit.cover),
                                            ),
                                            Positioned(
                                              top: 10,
                                              right: 10,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(2.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(4),
                                                        color:
                                                            Colors.black.withOpacity(0.5),
                                                      ),
                                                      alignment: Alignment.centerRight,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.symmetric(
                                                                horizontal: 3,
                                                                vertical: 2),
                                                        child: Row(
                                                          // ignore: prefer_const_literals_to_create_immutables
                                                          children: [
                                                            HeroIcon(
                                                              HeroIcons.tag,
                                                              solid: true,
                                                              size: extra_small_text,
                                                              color: Color(white_color),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets.only(
                                                                      left: 2),
                                                              child: Text(
                                                                'Deals',
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
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(2),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(4),
                                                        color:
                                                            Colors.black.withOpacity(0.5),
                                                      ),
                                                      alignment: Alignment.centerRight,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.symmetric(
                                                                horizontal: 3,
                                                                vertical: 2),
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
                                                              padding:
                                                                  const EdgeInsets.only(
                                                                      left: 2),
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
                                          child: Padding(
                                            padding: const EdgeInsets.only(bottom: 15),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
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
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )),
                )
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
     ),
    );
  }
}
