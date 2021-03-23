import 'package:get/get.dart';

class Product {
  // int id;
  String description;
  String productImage;
  int price;
  String productName;
  String category;
  bool discount;
  bool isSale;

  Product(
      { //this.id,
      this.productName,
      this.description,
      this.productImage,
      this.price,
      this.category,
      this.isSale,
      this.discount,
      this.qty});
  var isFaourite = false.obs;
  var qty = 0.obs;
  void increment() {
    qty.value = qty.value + 1;
    print(qty.value);
  }

  void decrement() {
    if (qty.value >= 1) {
      qty.value = qty.value - 1;
    }
  }

  Product.fromJson(Map<String, dynamic> json) {
    //this.id = json['id'];
    this.productName = json['name'];
    //this.description = json['description'];
    this.price = json['price'];
    //this.discount = json['discount'];
    this.isSale = json['isSale'];
    this.category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.productName;
    return data;
  }
}
