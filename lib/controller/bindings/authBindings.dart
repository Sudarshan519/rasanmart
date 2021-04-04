import 'package:get/get.dart';
import 'package:rasanmart/controller/authController.dart';

import '../networkController.dart';
import '../networkController.dart';
import '../userController.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkController>(() => NetworkController());

    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<UserController>(() => UserController());
  }
}
