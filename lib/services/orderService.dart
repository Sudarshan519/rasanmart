import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rasanmart/models/productModel.dart';
import 'package:rasanmart/views/widgets/product.dart';

class OrderService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference orderReference =
      FirebaseFirestore.instance.collection("orders");
  //.doc("U0oabTvdaiZqrBFbgQrlrmdfs7h1");

  placeOrder(String prod) {
    orderReference
        .add({'id': FirebaseAuth.instance.currentUser.uid, 'prod': prod});
  }

  getOrder() async {
    List<Products> cartItems = [];
    var data = await orderReference
        .where('id', isEqualTo: "U0oabTvdaiZqrBFbgQrlrmdfs7h1")
        .get();
    data.docs.forEach((doc) {
      var prod = doc.data()['product'];
      List<Product> order = jsonDecode(prod);
      print(order);
      // prod.forEach((element) {
      // });
      // print(doc.data()['product']);
    });
  }
}

final orderService = OrderService();
