import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/state_manager.dart';
import 'package:rasanmart/models/category_model.dart';
import 'package:rasanmart/models/productModel.dart';

class ProductFromFirebase extends GetxService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<Product>> fetchProduct() async {
    CollectionReference productReference =
        FirebaseFirestore.instance.collection("products");
    try {
      var data = await productReference.get();

      return data.docs.map<Product>((e) => Product.fromJson(e.data())).toList();
    } catch (e) {
      print(e.toString());
      return null;
    }
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
  } catch (e) {
    print(e.toString());
    return null;
  }
}

ProductFromFirebase firebaseProduct = ProductFromFirebase();
