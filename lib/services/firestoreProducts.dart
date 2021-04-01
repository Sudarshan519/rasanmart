import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rasanmart/models/category_model.dart';
import 'package:rasanmart/models/orderModel.dart';
import 'package:rasanmart/models/productModel.dart';

class ProductFromFirebase extends GetxService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference referencelike =
      FirebaseFirestore.instance.collection("likes");
  // addlike() {
  //   try {
  //     referencelike.doc().set({
  //       'productid': "1",
  //       'userid': FirebaseAuth.instance.currentUser.uid,
  //     });
  //     print('added like');
  //   } catch (e) {
  //     Get.snackbar('Hi', 'i am a ${e.toString()} snackbar');
  //   }
  // }

  // readlike() async {
  //   int count;
  //   var data = await referencelike.get();
  //   data.docs.forEach((element) {
  //     count++;
  //   });
  // }

  // getuserlike() async {
  //   var data = await referencelike
  //       .where("userid", isEqualTo: FirebaseAuth.instance.currentUser.uid)
  //       .get();
  //   if (data != null && data.isBlank)
  //     data.docs.forEach((element) {
  //       print(element.id);
  //       return element.id;
  //     });
  //   else
  //     return;
  // }

  // removelike() async {
  //   String id = await getuserlike();
  //   if (id != null) referencelike.doc(id).delete();
  // }

  addOrder(OrderModelModel order) async {
    // print(order.products);
    // print(order);
    // jsonEncode(order.products);
    // print(jsonEncode(order.products));
    orderReference
        .add({
          'id': order.id,
          'address': order.address,
          'contact': order.contact,
          'city': order.city,
          'cart': jsonEncode(order.products)
        })
        .whenComplete(() => Get.snackbar('Completed', 'message'))
        .catchError((error) => print("Failed to add user: $error"));
  }

  CollectionReference orderReference =
      FirebaseFirestore.instance.collection("productorders");

  CollectionReference productReference =
      FirebaseFirestore.instance.collection("products");

  Future<List<Product>> fetchProduct() async {
    try {
      var data = await productReference.get();
      data.docs.forEach((element) {
        // print(element.id);
      });
      return data.docs.map<Product>((e) => Product.fromJson(e.data())).toList();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future searchProduct(String prodName) async {
    var data = await productReference
        .where('category', isEqualTo: prodName.toLowerCase())
        .get();
    data.docs.forEach((element) {
      print(element.id);
    });
    return data.docs.map<Product>((e) => Product.fromJson(e.data())).toList();
  }
}

Future<void> uploadCategory() async {
  CollectionReference productReference =
      FirebaseFirestore.instance.collection("productCategory");
  try {
    productReference.doc().set(Category(
            categoryName: 'Glocery',
            categoryImage:
                'gs://mechanic-finder-f3fee.appspot.com/Categories/glocery.PNG')
        .toJson());
  } catch (e) {
    print(e.toString());
    return null;
  }
}

Future<List<Product>> testuploadProduct() async {
  CollectionReference productReference =
      FirebaseFirestore.instance.collection("products");
  try {
    productReference.doc().set(Product(
            productName: 'DummyProduct',
            description:
                "If the document does not exist, it will be created. If the document does exist, its contents will be overwritten with the newly provided data, unless you specify that the data should be merged into the existing document, as follows:",
            productImage:
                'https://cdn.sstatic.net/Img/teams/teams-illo-free-sidebar-promo.svg?v=47faa659a05e',
            discount: 0,
            price: 123,
            isSale: true)
        .toJson());
    return null;
  } catch (e) {
    print(e.toString());
    return null;
  }
}

ProductFromFirebase firebaseProduct = ProductFromFirebase();
