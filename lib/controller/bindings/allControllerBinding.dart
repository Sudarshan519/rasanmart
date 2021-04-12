
import 'package:get/get.dart';
import 'package:rasanmart/utils/localization.dart';
import 'package:rasanmart/views/notification/notificationController.dart';

import '../authController.dart';
import '../languageController.dart';
import '../networkController.dart';
import '../productController.dart';
import '../userController.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyController>(() => MyController());
  //  Get.put(NotificationController());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => NetworkController());
    Get.lazyPut(() => LanguageController());
    Get.lazyPut(() => ProductController());
    Get.lazyPut(() => UserController());
    Get.lazyPut(() => NotificationController());
    // Get.lazyPut(
    //   () => ScrollController(),
    // );
    // Get.lazyPut(() => OrderController());
  }
}
