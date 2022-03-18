import 'package:firebase/firebase.dart';
import 'package:firebase_core/firebase_core.dart' as core;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:app_frontend/pages/signup.dart';
import 'package:app_frontend/pages/login.dart';
import 'package:app_frontend/pages/start.dart';
import 'package:app_frontend/pages/home.dart';
import 'package:app_frontend/components/shop.dart';
import 'package:app_frontend/pages/products/items.dart';
import 'package:app_frontend/pages/products/subCategory.dart';
import 'package:app_frontend/pages/shoppingBag.dart';
import 'package:app_frontend/pages/checkout/addCreditCard.dart';
import 'package:app_frontend/pages/checkout/paymentMethod.dart';
import 'package:app_frontend/pages/checkout/shippingAddress.dart';
import 'package:app_frontend/pages/checkout/shippingMethod.dart';
import 'package:app_frontend/pages/products/particularItem.dart';
import 'package:app_frontend/pages/checkout/placeOrder.dart';
import 'package:app_frontend/pages/profile/userProfile.dart' as up;
import 'package:app_frontend/pages/profile/editProfile.dart';
import 'package:app_frontend/pages/profile/setting.dart';
import 'package:app_frontend/pages/profile/contactUs.dart';
import 'package:app_frontend/pages/products/wishlist.dart';
import 'package:app_frontend/components/orders/orderHistory.dart';
import 'package:app_frontend/pages/onBoardingScreen/onboardingScreen.dart';
import 'package:app_frontend/pages/adminPanel.dart';

bool firstTime;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  firstTime = (prefs.getBool('initScreen') ?? false);
  if (!firstTime) {
    prefs.setBool('initScreen', true);
  }
  WidgetsFlutterBinding.ensureInitialized();
  await core.Firebase.initializeApp(
    // Replace with actual values
    options: core.FirebaseOptions(
        apiKey: "AIzaSyAt8rBN0JyNPkk9qC9HTWB74v8ZsPKBcKs",
        authDomain: "flutter-e-commerce-85149.firebaseapp.com",
        projectId: "flutter-e-commerce-85149",
        storageBucket: "flutter-e-commerce-85149.appspot.com",
        messagingSenderId: "329594418714",
        appId: "1:329594418714:web:c2246b5ac2879af97283a3",
        measurementId: "G-GH73X5JDE5"),
  );
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: firstTime ? '/' : '/onBoarding',
      // initialRoute: '/admin',
      routes: {
        '/': (context) => Start(),
        '/login': (context) => Login(),
        '/signup': (context) => SignUp(),
        '/home': (context) => Home(),
        '/shop': (context) => Shop(),
        '/subCategory': (context) => SubCategory(),
        '/items': (context) => Items(),
        '/particularItem': (context) => ParticularItem(),
        '/bag': (context) => ShoppingBag(),
        '/wishlist': (context) => WishList(),
        '/checkout/addCreditCard': (context) => AddCreditCard(),
        '/checkout/address': (context) => ShippingAddress(),
        '/checkout/shippingMethod': (context) => ShippingMethod(),
        '/checkout/paymentMethod': (context) => PaymentMethod(),
        '/checkout/placeOrder': (context) => PlaceOrder(),
        '/profile': (context) => up.UserProfile(),
        '/profile/settings': (context) => ProfileSetting(),
        '/profile/edit': (context) => EditProfile(),
        '/profile/contactUs': (context) => ContactUs(),
        '/placedOrder': (context) => OrderHistory(),
        "/onBoarding": (context) => OnBoardingScreen(),
        "/admin": (context) => AdminPanel()
      },
      theme: ThemeData(
          bottomSheetTheme:
              BottomSheetThemeData(backgroundColor: Colors.white)),
    );
  }
}
