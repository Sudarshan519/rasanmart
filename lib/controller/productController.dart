import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:rasanmart/models/productModel.dart';

class ProductController extends GetxController {
  List<Product> products = [];
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Rx<Product> _productModel = Product().obs;
  void onInit() {
    super.onInit();
    fetchProduct();
    // _firebaseUser.bindStream(_auth.onAuthStateChanged);
  }

  fetchProduct() async {
    CollectionReference productsfromFirebase =
        _firestore.collection("products");

    productsfromFirebase.get().then((value) => value.docs.fold(
        products,
        (products, element) => Product(
              name: element.data()['name'],
              //.description: 'dklsejfl',
            )));
    print(products.length.toString());
  }

  // ProductController(UserController userController);
  Product get product => _productModel.value;
  set user(Product value) => this._productModel.value = value;
  void clear() {
    _productModel.value = Product();
  }
}
