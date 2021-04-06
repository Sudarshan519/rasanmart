import 'package:get/get.dart';
import 'package:rasanmart/utils/localization.dart';

import '../authController.dart';
import '../languageController.dart';
import '../networkController.dart';
import '../orderController.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyController>(() => MyController());
    
   Get.lazyPut(() => AuthController());
   Get.lazyPut(() => NetworkController());
   Get.lazyPut(()=>LanguageController());
  // Get.lazyPut(() => OrderController());
  }
}