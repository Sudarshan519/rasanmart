// import 'package:flutter/material.dart';
// import 'package:rasanmart/models/productModel.dart';

// class ProductDetail extends StatefulWidget {
//   final Product product;
//   ProductDetail(this.product);

//   // IconData _selectedIcon;
//   // final List<IconData> icons = [
//   //   Icons.home,
//   //   Icons.shopping_cart,
//   //   Icons.access_alarm
//   // ];
//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   setIcon();
//   // }

//   // setIcon() {
//   //   setState(() {
//   //     _selectedIcon = icons[0];
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               IconButton(
//                 icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               Center(
//                 child: Text(
//                   widget.product.name,
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                   alignment: Alignment.center,
//                   //  color: Colors.green,
//                   child: Icon(_selectedIcon, size: 300)),
//               SizedBox(height: 10),
//               Row(children: [
//                 ...icons.map((p) => InkWell(
//                       onTap: () {
//                         setState(() {
//                           _selectedIcon = p;
//                         });
//                       },
//                       child: Container(
//                           margin: const EdgeInsets.all(15.0),
//                           padding: const EdgeInsets.all(3.0),
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.blueAccent),
//                             borderRadius: BorderRadius.circular(3),
//                           ),
//                           child: Icon(p, size: 80)),
//                     )),
//                 // InkWell(
//                 //   onTap: (){
//                 //     _selectedIcon=icon[i]
//                 //   },
//               ]),
//               Row(
//                 children: [
//                   Text(
//                     'NRs. ${widget.product.price}',
//                     style: TextStyle(
//                         color: Colors.red,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     'NRs. 50',
//                     style: TextStyle(
//                       decoration: TextDecoration.lineThrough,
//                       color: Colors.red,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 'Prodcut Description',
//                 style: style,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 widget.product.description,
//                 maxLines: 4,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Qty',
//                     style: style,
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.red,
//                     ),
//                     height: 20,
//                     child: Row(
//                       children: [
//                         Icon(Icons.remove),
//                         Container(
//                             color: Colors.white,
//                             child: Text(
//                               '1',
//                               style: style,
//                             )),
//                         Icon(Icons.add)
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 'Price (NRs.)   ${widget.product.price}',
//                 style: style,
//               )
//             ],
//           ),
//         ),
//       ),
//     ));
//   }


// }
