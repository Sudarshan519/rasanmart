import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rasanmart/models/productModel.dart';

class ProductFromFirebase {
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
