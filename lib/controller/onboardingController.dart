import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasanmart/views/dashboard/dashboard_page.dart';
// import 'package:get/state_manager.dart';
// import 'package:get/utils.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      //go to home page
      Get.to(DashboardPage());
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<String> onboardingPages = [
    'Order your items\n Now you can order any items any time\n right from your mobile',
    'Order your items\n Now you can order any items any time\n right from your mobile',
    'Order your items\n Now you can order any items any time\n right from your mobile'
  ];
}

final _controller = OnboardingController();
