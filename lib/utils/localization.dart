import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello',
          'language': 'Language',
          'home': "Home",
          'rasan': "Rasan",
          'profile': 'Profile',
          'mart': "Mart",
          'account': "Account",
          'logout': "Log Out",
          'flutter': "Flutter",
          'settings': "Settings"
        },
        'hi_IN': {
          'hello': 'नमस्ते',
          'home': "घर",
          'language': 'भाषा',
          'rasan': 'रासन',
          'mart': 'मार्ट',
          'profile': 'पाश्र्वचित्र',
          'account': "खाता",
          'logout': "बाहिर निस्कनु/आउनुहोस्",
          "flutter": "हलचल",
          'settings': "सेटिङ"
        },
        'fr_Fr': {'hello': 'Bonjour', 'home': "Homa", 'language': 'I dont know'}
      };
}

// class Internationaliztion extends GetWidget {
//   final myController = Get.put(MyController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'hello'.tr,
//             style: TextStyle(fontSize: 24, color: Colors.grey),
//           ),
//           TextButton(
//               onPressed: () {
//                 myController.changeLanguage('en', 'US');
//               },
//               child: Text('Nepali')),
//           TextButton(
//               onPressed: () {
//                 myController.changeLanguage('hi', 'IN');
//               },
//               child: Text('Nepali')),
//           TextButton(
//               onPressed: () {
//                 myController.changeLanguage('fr', 'Fr');
//               },
//               child: Text('Nepali'))
//         ],
//       ),
//     ));
//   }
// }

class MyController extends GetxController {
  void changeLanguage(String s, String ss) {
    var locale = Locale(s, ss);
    Get.updateLocale(locale);
  }
}
