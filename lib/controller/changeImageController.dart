import 'package:get/get.dart';

class ImageController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void changevalue(index) => this.selectedIndex.value = index;
}
