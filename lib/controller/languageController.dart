import 'package:get/get.dart';

class LanguageController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void changevalue(index) => this.selectedIndex.value = index;
}

final languageController=Get.put(LanguageController());