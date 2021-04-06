// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:rasanmart/models/productModel.dart';

// class OrderService {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   CollectionReference orderReference =
//       FirebaseFirestore.instance.collection("orders");
 

//   placeOrder(String prod) {
//     orderReference
//         .add({'id': FirebaseAuth.instance.currentUser.uid, 'prod': prod});
//   }

//   getOrder() async {
//     var data = await orderReference
//         .where('id', isEqualTo: "U0oabTvdaiZqrBFbgQrlrmdfs7h1").orderBy("timestamp",descending: false)
//         .get();
//     data.docs.forEach((doc) {
//       var prod = doc.data()['product'];
//       List<Product> order = jsonDecode(prod);
//       print(order);
//       // prod.forEach((element) {
//       // });
//       // print(doc.data()['product']);
//     });
//   }
// }

// final orderService = OrderService();
