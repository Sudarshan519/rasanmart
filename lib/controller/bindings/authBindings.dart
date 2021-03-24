import 'package:get/get.dart';
import 'package:rasanmart/controller/authController.dart';

import '../userController.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<UserController>(() => UserController());
  }
}
