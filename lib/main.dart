import 'package:aira_pay/Account/Screens/spending-limit.dart';
import 'package:aira_pay/Auth/Providers/ExistNumber.dart';
import 'package:aira_pay/Auth/Providers/LoginProvider.dart';
import 'package:aira_pay/Auth/Providers/OtpSendProvider.dart';
import 'package:aira_pay/Payment/Providers/AllbillProvider.dart';
import 'package:aira_pay/Payment/Screens/all-bills.dart';
import 'package:aira_pay/Payment/Screens/payment-success.dart';
import 'package:aira_pay/Payment/Screens/voucher-select.dart';
import 'package:aira_pay/Shop/Providers/ExploreProvider.dart';
import 'package:aira_pay/Shop/Providers/FavouriteMerchantProvider.dart';
import 'package:aira_pay/Shop/Providers/GetCategoryByIdprovider.dart';
import 'package:aira_pay/Shop/Providers/HomeSliderProvider.dart';
import 'package:aira_pay/Shop/Providers/MerchantDetailsProvider.dart';
import 'package:aira_pay/Shop/Providers/MerchantSearchProvider.dart';
import 'package:aira_pay/Shop/Providers/NotificationProvider.dart';
import 'package:aira_pay/Shop/Providers/NotificationStatusProvider.dart';
import 'package:aira_pay/Shop/Providers/PromoDealsProvider.dart';
import 'package:aira_pay/Shop/Providers/PushNotificationProvider.dart';

import 'package:aira_pay/Shop/Providers/new_store_deals_provider.dart';
import 'package:aira_pay/Shop/Providers/personaliseCategoryProvider.dart';
import 'package:aira_pay/Shop/Screens/merchant_screen.dart';
import 'package:aira_pay/Shop/Screens/personalise_screen.dart';
import 'package:aira_pay/splash_screen.dart';
import 'package:aira_pay/viewModel/PasswordVM.dart';
import 'package:aira_pay/viewModel/RegisterMobileVm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Account/Screens/account-page.dart';
import 'Account/Screens/change-mobilenumber.dart';
import 'Account/Screens/change_password.dart';
import 'Account/Screens/email-verification.dart';
import 'Account/Screens/face-scan.dart';
import 'Account/Screens/following.dart';
import 'Account/Screens/mykad-verification.dart';
import 'Account/Screens/profile-update.dart';
import 'Account/Screens/refer-friend.dart';
import 'Account/Screens/review-details.dart';
import 'Account/Screens/security-setting.dart';
import 'Account/Screens/tier-list.dart';
import 'Account/Screens/voucher.dart';
import 'Auth/Providers/CustomerDetailsProvider.dart';
import 'Auth/Screens/register-complete.dart';
import 'Auth/Screens/create_password.dart';
import 'Auth/Screens/register-complete.dart';
import 'Auth/Screens/register.dart';
import 'Payment/Screens/add_card.dart';
import 'Payment/Screens/card-list.dart';
import 'Payment/Screens/confirm-payment.dart';
import 'Payment/Screens/my-bills.dart';
import 'Shop/Providers/SelectPersonaliseCategoryProvider.dart';
import 'Shop/Providers/SpendingLimitProvider.dart';
import 'Shop/Screens/category.dart';
import 'Shop/Screens/category_view.dart';
import 'Shop/Screens/first-notification.dart';
import 'Shop/Screens/home.dart';
import 'Shop/Screens/notification.dart';
import 'Shop/Screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: NewStoreDealsProvider()),
        ChangeNotifierProvider(create: (_) => RegisterMobileVM()),
        ChangeNotifierProvider(create: (_) => PasswordVM()),
        ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
        ChangeNotifierProvider<PersonaliseCategoryProvider>(
            create: (_) => PersonaliseCategoryProvider()),
        ChangeNotifierProvider<HomesliderProvider>(
            create: (_) => HomesliderProvider()),
        ChangeNotifierProvider<ExploreProvider>(
            create: (_) => ExploreProvider()),
        ChangeNotifierProvider<AllBillProvider>(
            create: (_) => AllBillProvider()),
        ChangeNotifierProvider<MerchantSearchProvider>(
            create: (_) => MerchantSearchProvider()),
        ChangeNotifierProvider<PromoDealsProvider>(
            create: (_) => PromoDealsProvider()),
        ChangeNotifierProvider<NotificationProvider>(
            create: (_) => NotificationProvider()),
        ChangeNotifierProvider<FavoriteMerchantProvider>(
            create: (_) => FavoriteMerchantProvider()),
        ChangeNotifierProvider<PushNotificationProvider>(
            create: (_) => PushNotificationProvider()),
        ChangeNotifierProvider<NotificationStatusProvider>(
            create: (_) => NotificationStatusProvider()),
        ChangeNotifierProvider<GetCatByIdMerchantProvider>(
            create: (_) => GetCatByIdMerchantProvider()),
        ChangeNotifierProvider<MerchantDetailsProvider>(
            create: (_) => MerchantDetailsProvider()),
        ChangeNotifierProvider<SelectPersonaliseCategoryProvider>(
            create: (_) => SelectPersonaliseCategoryProvider()),
        ChangeNotifierProvider<CustomerDetailsProvider>(
            create: (_) => CustomerDetailsProvider()),
        ChangeNotifierProvider<SpendingLimitProvider>(
            create: (_) => SpendingLimitProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: "Baloo2",

          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
