import 'package:get/get.dart';

class Product {
  // int id;
  String description;
  String productImage;
  int price;
  String productName;
  String category;
  int discount;
  bool isSale;
  int oldPrice;
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
    this.description = json['description'];
    this.price = json['price'];
    this.discount = json['discount'];
    this.isSale = json['isSale'];
    this.category = json['category'];
    this.productImage = json['productImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.productName;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['isSale'] = this.isSale;
    data['category'] = this.category;
    data['productImage'] = this.productImage;
    return data;
  }
}
