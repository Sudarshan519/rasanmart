import 'package:get/state_manager.dart';

class ScrollController extends GetxController {
  var isloading = false.obs;
  @override
  void onInit() {
    super.onInit();
    //scroll();
  }

  void scroll() {
    isloading.toggle();
  }
}
