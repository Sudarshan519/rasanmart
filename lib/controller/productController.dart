import 'package:get/get.dart';
import 'package:rasanmart/models/productModel.dart';
import 'package:rasanmart/services/firestoreProducts.dart';

class ProductController extends GetxController {
  var products = List<Product>.empty(growable: true).obs;
  var isloading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    isloading.toggle();
    List<Product> productlist = await ProductFromFirebase().fetchProduct();
    products = productlist.obs;
    isloading.toggle();
  }
}
