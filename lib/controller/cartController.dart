import 'package:get/get.dart';
import 'package:rasanmart/models/productModel.dart';
import 'package:rasanmart/services/getStorage.dart';

class CartController extends GetxController {
  var istrue = false.obs;
  int get count => cartItems.length;
  var cartItems = List<Product>.empty(growable: true).obs;
  double get totalPrice =>
      cartItems.fold(100, (sum, item) => sum + item.qty * item.price);

  double get discount => cartItems.fold(
      0, (sum, item) => sum + item.qty * item.discount / 100 * item.price);

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
    // print(resJson);
    if (resJson != [])
      await cartStorage.write('cart', resJson);
    else
      print('Put some value');
  }

  readStorage() async {
    List<dynamic> prod = await cartStorage.read('cart');
   if(prod!=null)
    prod.forEach((element) {
      //print(element);

      cartItems.add(Product.fromJson(element));
    });
    // print(cartItems.length);
  }

  addToCart(Product product) {
    if (!checkItems(product)) {
      cartItems.add(product);
      product.increment();
    } else {
      product.increment();
    }
    writeStorage();
  }

  checkItems(Product product) {
    bool isFound = false;
    cartItems.forEach((element) {
      //product.qty = element.qty;
      if (element.id == product.id) {
        product.qty = element.qty;
        isFound = true;
      }
    });
    return isFound;
  }

  removefromCart(Product product) {
    int index;
    cartItems.forEach((element) {
      if (element.id == product.id) {
        if (product.qty.value <= 1) {
          product.decrement();
          index = cartItems.indexOf(element);
        } else
          product.decrement();
      }
    });
    if (index != null) cartItems.removeAt(index);

    writeStorage();
  }

  deleteItem(Product product) {
    cartItems.forEach((element) {
      if (element.id == product.id) {
        cartItems.remove(element);
        product.qty.value = 0;
        Get.back();
      }
    });
  }
}

final cartController = CartController();
