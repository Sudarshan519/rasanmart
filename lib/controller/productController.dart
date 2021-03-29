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

  searchItems(String query) {
    List<Product> prod = [];
    products.forEach((element) {
      if (element.productName.toLowerCase().contains(query.toLowerCase()) ||
          element.description.toLowerCase().contains(query.toLowerCase())) {
        prod.add(element);
      }
    });
    print(prod.toString());
    return prod;
  }

  void fetchProducts() async {
    isloading.toggle();
    List<Product> productlist = await ProductFromFirebase().fetchProduct();
    products = productlist.obs;
    isloading.toggle();
  }
}
