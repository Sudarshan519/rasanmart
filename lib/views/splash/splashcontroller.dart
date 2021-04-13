import 'dart:async';

import 'package:get/get.dart';
import 'package:rasanmart/controller/authController.dart';
import 'package:rasanmart/views/home/home.dart';
import 'package:rasanmart/views/login/login.dart';

class SplashController extends GetxController {
  final splashDelay = 3;
  final versionName = 'V1.0'.obs;
  // final authcontroller = Get.put(MainauthController(), permanent: true);
//  final logInfo = Get.put(AccountController());

  @override
  void onInit() {
    _loadWidget();
    //Get.put(CartController(), permanent: true);
    // Get.put(NotificationController(), permanent: true);
    // if (authcontroller.firebaseAuth.currentUser != null)
    // logInfo.isLogOut.value = false;

    super.onInit();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigation);
  }

  void navigation() {
    if (AuthController().user != null) {
      Get.off(() => Home());
    } else {
      Get.off(() => LoginView());
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
