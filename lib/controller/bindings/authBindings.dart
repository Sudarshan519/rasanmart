import 'package:get/get.dart';
import 'package:rasanmart/controller/authController.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
  Get.lazyPut<AuthController>(() => AuthController());
  }
}
