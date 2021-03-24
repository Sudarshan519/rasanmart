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
    listenCart();
    super.onInit();
    //cartStorage.delete();
  }

  listenCart() async {
    List<dynamic> prod = await readStorage();
    // List<Product> product;
    prod.forEach((element) {
      cartItems.add(Product.fromJson(element));
    });
  }

  writeStorage(String cart) async {
    var resJson = cartItems.toJson();

    await cartStorage.write(cart, resJson);
  }

  readStorage() async {
    final prod = await cartStorage.read('cart');
    if (!prod.isNullOrBlank)
      return prod;
    else
      return [];
  }

  addToCart(Product product) {
    if (!checkItems(product)) {
      cartItems.add(product);
      product.increment();
      writeStorage('cart');
    } else if (cartItems.contains(product)) {
      product.increment();
     // cartStorage.remove('cart');
    }
  }

  checkItems(Product product) {
    if (!cartItems.contains(product)) {
      return false;
    } else if (cartItems.contains(product)) {
      return true;
    }
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
  }
}
