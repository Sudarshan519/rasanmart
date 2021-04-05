// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rasanmart/utils/app_theme.dart';

// class AllProducts extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
//             onPressed: () {
//               Get.back();
//             }),
//         backgroundColor: Theme.of(context).bottomAppBarColor,
//         title: Text(
//           "",
//           style: AppTheme.headingStyle,
//         ),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 20,
//           ),
//           searchController.text.isBlank
//               ? Text(
//                   'Enter value greater than 3 ',
//                   style: AppTheme.title,
//                 )
//               : Text(
//                   'Items found ${search.length}',
//                   style: AppTheme.title,
//                 ),
//           SizedBox(height: 20),
//           Container(
//               // color: Colors.green,
//               height: 300,
//               child: searchController.text.isBlank
//                   ? Container()
//                   : GridView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: search.length,
//                       itemBuilder: (_, int i) {
//                         return ProductContent(search[i]);
//                       },
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 1,
//                         mainAxisSpacing: 30,
//                         //  mainAxisExtent: 150.0,
//                       ),
//                     ))
//         ],
//       ),
//     );
//   }
// }
