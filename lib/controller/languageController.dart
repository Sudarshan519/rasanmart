import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  RxInt selectedIndex = 0.obs;
  void changeLanguage(String s, String ss) {
    var locale = Locale(s, ss);
    Get.updateLocale(locale);
  }

  void changevalue(index) => this.selectedIndex.value = index;
}

final languageController = Get.put(LanguageController());
