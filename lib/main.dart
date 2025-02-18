import 'package:advance_flutter_exam/view/auctionproductspage.dart';
import 'package:advance_flutter_exam/view/homepage.dart';
import 'package:advance_flutter_exam/view/splashpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    getPages: [
      GetPage(name: "/", page: () => Splashpage()),
      GetPage(name: "/home", page: () => HomePage()),
      GetPage(name: "/auction", page: () => AuctionProductsPage()),
    ],
  ));
}
