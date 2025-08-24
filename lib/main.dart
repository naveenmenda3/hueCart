import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:get/get.dart';
import 'package:huecart/app.dart';
import 'package:huecart/controllers/wishlist_controller.dart';
import 'package:huecart/firebase_options.dart';
import 'package:huecart/services/service_provider.dart';
import 'package:huecart/controllers/cart_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.appAttest,
  );

  await Get.putAsync<ServiceProvider>(() => ServiceProvider().init());
  
  // Initialize controllers
  Get.put(CartController());
  Get.put(WishlistController());
  
  runApp(const App());
}
