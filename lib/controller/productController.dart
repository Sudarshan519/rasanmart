import 'package:get/get.dart';
import 'package:rasanmart/models/product.dart';
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
    List<ProductModel> productlist = await ProductFromFirebase().fetchProduct();
    print(productlist[0].product);
    List<Product> product = productlist.map((e) => e.product).toList();
    products = product.obs;
    isloading.toggle();
  }
}
