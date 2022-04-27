// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/Shop/Screens/search_screen.dart';
import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heroicons/heroicons.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      
      child: Card(
        elevation: 2.5,
                                    shadowColor: Colors.black.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SerarchScreen()));
          },
          child: Container(
            height: 52,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 20,),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10,),
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
                    child: Text(
                      "Search for shops",
                      style: TextStyle(color: Color(label_grey)),
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                    child: VerticalDivider(
                      color: Color(text_grey),
                      thickness: 0.5,
                    ),
                  ),
                  HeroIcon(
                    HeroIcons.locationMarker,
                    solid: true,
                    color: Color(primary_color),
                    size: icon_size,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
