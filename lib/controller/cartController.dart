import 'dart:convert';

import 'package:get/get.dart';
import 'package:rasanmart/models/productModel.dart';
import 'package:rasanmart/services/getStorage.dart';

class CartController extends GetxController {
  var istrue = false.obs;
  int get count => cartItems.length;
  var cartItems = List<Product>.empty(growable: true).obs;
  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + item.qty * item.price);

  @override
  void onInit() {
    super.onInit();
    readStorage();
  }

  getItems(Product product) {
    int qty = 0;
    cartItems.forEach((element) {
      if (element.id == product.id) {
        qty = element.qty.value;
      }
    });
    return qty;
  }

  writeStorage() async {
    var resJson = cartItems.toJson();
    print(resJson);
    if (resJson != [])
      await cartStorage.write('cart', resJson);
    else
      print('Put some value');
  }

  readStorage() async {
    List<dynamic> prod = await cartStorage.read('cart');
    prod.forEach((element) {
      print(element);
      cartItems.add(Product.fromJson(element));
    });
    print(cartItems.length);
  }

  addToCart(Product product) {
    if (!checkItems(product)) {
      cartItems.add(product);
      product.increment();
    } else {
      product.increment();

      print(product.qty.value);
    }
    writeStorage();
  }

  checkItems(Product product) {
    bool isFound = false;
    // if (!cartItems.contains(product)) {
    //   isFound = false;
    // } else {
    cartItems.forEach((element) {
      if (element.id == product.id) {
        isFound = true;
      }
    });
    // }
    return isFound;
  }

  removefromCart(Product product) {
    if (!cartItems.contains(product)) {
      // cartItems.add(product);
    } else if (cartItems.contains(product)) {
      if (product.qty <= 1) {
        // product.qty.value = 0;
        product.decrement();
        cartItems.remove(product);
      } else
        product.decrement();
      // print(product.qty.value);
    }
    writeStorage();
  }
}
