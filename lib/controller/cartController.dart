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
    //  print(cartItems.toJson());
    listenCart();
    super.onInit();
    //cartStorage.delete();
  }

  listenCart() async {
    List<dynamic> prod = await readStorage();
    // List<Product> product;
    print(prod);
    if (prod == null) {
      writeStorage('cart');

      //readStorage();
    } else {
      prod.forEach((element) {
        // cartItems.add(Product.fromJson(element));
print(element)  ;
        addToCart(Product.fromJson(element));
      });
    }
  }

  countItems(Product product) {
    cartItems.forEach((element) {
      if (element.id == product.id)
        return element.qty;
      else
        return null;
    });
  }

  writeStorage(String cart) async {
    var resJson = cartItems.toJson();
    //print(resJson);
    await cartStorage.write(cart, resJson);
  }

  readStorage() async {
    final prod = await cartStorage.read('cart');
    // print(prod);
    try {
      if (prod != null)
        return prod;
      else
        writeStorage('cart');
    } catch (e) {
      writeStorage('cart');
    }
  }

  addToCart(Product product) {
    if (!checkItems(product)) {
      cartItems.add(product);
      product.increment();
    } else if (cartItems.contains(product)) {
      product.increment();
      // cartStorage.remove('cart');
    }
    writeStorage('cart');
  }

  checkItems(Product product) {
    bool istrue = false;
    cartItems.forEach((element) {
      if (element.id == product.id)
        istrue = true;
      else
        istrue = false;
    });
    return istrue;
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
    writeStorage('cart');
  }
}
