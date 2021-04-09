import 'package:get/get.dart';

import 'package:rasanmart/app/modules/CompleteProfile/bindings/complete_profile_binding.dart';
import 'package:rasanmart/app/modules/CompleteProfile/views/complete_profile_view.dart';
import 'package:rasanmart/views/home/home.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => Home(),
      binding: CompleteProfileBinding(),
    ),
  ];
}
