import 'package:aira_pay/Account/Screens/account-page.dart';
import 'package:aira_pay/Account/Screens/face-scan.dart';
import 'package:aira_pay/Payment/Screens/all-bills.dart';
import 'package:aira_pay/Shop/Screens/category.dart';
import 'package:aira_pay/Shop/Screens/home.dart';
import 'package:flutter/material.dart';


import '../Screens/qr_scanner.dart';
import 'Enums.dart';

// void showHideSearchBar() {
//   global.searchBar ? global.searchBar = false : global.searchBar = true;
// }



void moveToPage(NavigateToPage page, pageContext) {
  switch (page) {
    case NavigateToPage.home:
      Navigator.of(pageContext).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (BuildContext context) =>  Home(false),
        ),
        (Route<dynamic> route) => false,
      );
      break;
    case NavigateToPage.bills:
      Navigator.of(pageContext).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (BuildContext context) => const Allbills(),
        ),
        (Route<dynamic> route) => false,
      );
      break;
    case NavigateToPage.category:
      Navigator.of(pageContext).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (BuildContext context) => const Category(),
        ),
        (Route<dynamic> route) => false,
      );
      break;
    case NavigateToPage.scan:
      _scan:
      Navigator.of(pageContext).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (BuildContext context) => const QrScanner(),
        ),
            (Route<dynamic> route) => false,
      );
      break;
    case NavigateToPage.me:
      Navigator.of(pageContext).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => const Account()),
        (Route<dynamic> route) => false,
      );
      break;
    default:
  }
}
