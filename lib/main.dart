import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rasanmart/controller/authController.dart';
import 'package:rasanmart/controller/bindings/allControllerBinding.dart';
import 'package:rasanmart/utils/app_theme.dart';
import 'utils/app_theme.dart';
import 'utils/localization.dart';
import 'views/dashboard/dashboard_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
//  await firebaseProduct.fetchProduct();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      locale: Locale('en', 'US'), //Get.device local
      fallbackLocale: Locale('en', 'US'), //if wrong or not avaivable is chosen
      translations: Messages(),
      initialBinding: AllControllerBinding(),
      defaultTransition: Transition.leftToRightWithFade,
      home: Root(),
    );
  }
}

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<AuthController>(
      init: AuthController(),
      builder: (_) {
        if (_.loading.value) {
          return CircularProgressIndicator();
        }

        return  DashboardPage();
      },
    );
  }
}

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Account'),
    );
  }
}
