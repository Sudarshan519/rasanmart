
import 'package:get/get.dart';

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


final scrollController=Get.put(ScrollController());