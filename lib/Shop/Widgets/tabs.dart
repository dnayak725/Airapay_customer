import 'package:aira_pay/Shop/Models/NavMenuModel.dart';
import 'package:aira_pay/config.dart';
import 'package:flutter/material.dart';

import 'package:heroicons/heroicons.dart';
import 'package:aira_pay/Shop/global.dart' as global;

import '../components/Enums.dart';
import '../components/all_functions.dart';


class Tabs extends StatefulWidget {
  final int menuIndex;
  const Tabs(this.menuIndex);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  // int _pageIndex = 0;
  int bottomNavIndex = global.btmNavIndx;
  List<NavMenuModel> navItems = [
    NavMenuModel(
      name: 'Home',
      icon: const HeroIcon(
        HeroIcons.home,
        solid: false,
        size: 26,
        color: Color(primary_text),
      ),
      activeIcon: const HeroIcon(
        HeroIcons.home,
        solid: true,
        size: 26,
        color: Color(primary_color),
      ),
    ),
    NavMenuModel(
      name: 'Category',
      icon: const HeroIcon(
        HeroIcons.collection,
        solid: false,
        size: 26,
        color: Color(primary_text),
      ),
      activeIcon: const HeroIcon(
        HeroIcons.collection,
        solid: true,
        size: 26,
        color: Color(primary_color),
      ),
    ),
    NavMenuModel(
      name: 'Scan',
      icon: const HeroIcon(
        HeroIcons.qrcode,
        solid: false,
        size: 26,
        color: Color(primary_text),
      ),
      activeIcon: const HeroIcon(
        HeroIcons.qrcode,
        solid: true,
        size: 26,
        color: Color(primary_color),
      ),
    ),
    NavMenuModel(
      name: 'Bills',
      icon: const HeroIcon(
        HeroIcons.documentText,
        solid: false,
        size: 26,
        color: Color(primary_text),
      ),
      activeIcon: const HeroIcon(
        HeroIcons.documentText,
        solid: true,
        size: 26,
        color: Color(primary_color),
      ),
    ),
    NavMenuModel(
      name: 'Me',
      icon: const HeroIcon(
        HeroIcons.user,
        solid: false,
        size: 26,
        color: Color(primary_text),
      ),
      activeIcon: const HeroIcon(
        HeroIcons.user,
        solid: true,
        size: 26,
        color: Color(primary_color),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedFontSize: 10,
        unselectedFontSize: 10,
        currentIndex: bottomNavIndex,
        onTap: (navIndex) {
          setState(() {
            global.btmNavIndx = navIndex;
            bottomNavIndex = global.btmNavIndx;
          });
          switch (navIndex) {
            case 0:
              moveToPage(NavigateToPage.home, context);
              break;
            case 1:
              moveToPage(NavigateToPage.category, context);
              break;
            case 2:
              moveToPage(NavigateToPage.scan, context);
              break;
            case 3:
              moveToPage(NavigateToPage.bills, context);
              break;
            case 4:
              moveToPage(NavigateToPage.me, context);
              break;
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(primary_color),
        unselectedLabelStyle: TextStyle(
          fontSize: small_text,
          fontWeight: FontWeight.w600
        ),
        selectedLabelStyle: TextStyle(
          fontSize: small_text,
          fontWeight: FontWeight.w700
        ),
        items: navItems
            .map((nav) => BottomNavigationBarItem(
                  icon: nav.icon,
                  activeIcon: nav.activeIcon,
                  label: nav.name,
                ))
            .toList());
    // return Container(
    //   decoration: BoxDecoration(boxShadow: [
    //     BoxShadow(
    //       offset: Offset(2, 2),
    //       blurRadius: 12,
    //       color: Color.fromRGBO(0, 0, 0, 0.16),
    //     )
    //   ]),
    //   child: ClipRRect(
    //     borderRadius: const BorderRadius.only(
    //       topRight: Radius.circular(12),
    //       topLeft: Radius.circular(12),
    //     ),
    //     child: BottomNavigationBar(
    //       onTap: (int _pageIndex) {
    //         setState(() {
    //           bottomNavIndex = _pageIndex;
    //         });
    //       },
    //       currentIndex: bottomNavIndex,
    //       selectedItemColor: Color(primary_color),
    //       unselectedItemColor: Color(black_text),
    //       type: BottomNavigationBarType.fixed,
    //       items: <BottomNavigationBarItem>[
    //         BottomNavigationBarItem(
    //             icon: InkWell(
    //               onTap: () {
    //                 Navigator.push(context,
    //                     MaterialPageRoute(builder: (context) => Home()));
    //               },
    //               child: HeroIcon(
    //                 HeroIcons.home,solid: true,
    //                 size: 26,
    //               ),
    //             ),
    //             label: "Home"),
    //         BottomNavigationBarItem(
    //             icon: InkWell(
    //               onTap: () {
    //                 Navigator.push(
    //                   context,
    //                   MaterialPageRoute(builder: (context) => Category()),
    //                 );
    //               },
    //               child: HeroIcon(
    //                 HeroIcons.collection,solid: true,
    //                 size: 26,
    //               ),
    //             ),
    //             label: "Category"),
    //         BottomNavigationBarItem(
    //             icon: GestureDetector(
    //               child: HeroIcon(
    //                 HeroIcons.qrcode,solid: true,
    //                 size: 26,
    //               ),
    //               onTap: () => {
    //                 Navigator.push(
    //                   context,
    //                   MaterialPageRoute(builder: (context) => Facescan()),
    //                 )
    //               },
    //             ),
    //             label: "Scan"),
    //         BottomNavigationBarItem(
    //             icon: GestureDetector(
    //               child: HeroIcon(HeroIcons.documentText),
    //               onTap: () => {
    //                 Navigator.push(context,
    //                     MaterialPageRoute(builder: (context) => Allbills())),
    //               },
    //             ),
    //             label: "Bills"),
    //         BottomNavigationBarItem(
    //             icon: InkWell(
    //               onTap: () {
    //                 Navigator.push(context,
    //                     MaterialPageRoute(builder: (context) => Account()));
    //               },
    //               child: HeroIcon(
    //                 HeroIcons.user,
    //               ),
    //             ),
    //             label: "Me"),
    //       ],
    //     ),
    //   ),
    // );
  }


}
