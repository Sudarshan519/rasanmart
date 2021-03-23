import 'package:get/get.dart';
import 'package:rasanmart/models/productModel.dart';

class CartController extends GetxController {
  var istrue = false.obs;
  int get count => cartItems.length;
  var cartItems = List<Product>.empty(growable: true).obs;
  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + item.qty * item.price);
  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;

  addToCart(Product product) {
    if (!checkItems(product)) {
      cartItems.add(product);
    } else if (cartItems.contains(product)) {
      product.increment();
      print(product.qty.value);
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
      product.decrement();
      // print(product.qty.value);
    }
  }
}
