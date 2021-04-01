import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void changevalue(index) => this.selectedIndex.value = index;
}

final dashboardController = Get.put(DashboardController());
