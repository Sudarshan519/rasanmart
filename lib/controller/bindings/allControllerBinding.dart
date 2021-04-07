import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasanmart/utils/localization.dart';

import '../authController.dart';
import '../languageController.dart';
import '../networkController.dart';
import '../productController.dart';
import '../userController.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyController>(() => MyController());

    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => NetworkController());
    Get.lazyPut(() => LanguageController());
    Get.lazyPut(() => ProductController());
    Get.lazyPut(() => UserController());
    // Get.lazyPut(
    //   () => ScrollController(),
    // );
    // Get.lazyPut(() => OrderController());
  }
}
