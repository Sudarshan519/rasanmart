import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Product {
  int id;
  String description;
  String productImage;
  int price;
  String productName;
  String category;
  int discount;
  bool isSale;
  int oldPrice;
  Timestamp dateTime;
  int totalFavourite;
  Product(
      {this.id,
      this.productName,
      this.description,
      this.productImage,
      this.price,
      this.category,
      this.isSale,
      this.discount,
      this.dateTime,
      this.totalFavourite,
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
    this.id = json['id']??0;
    this.productName = json['name']??"";
    this.description = json['description'] ?? '';
    this.price = json['price'] ?? 0;
    this.discount = json['discount'] ?? 0;
    this.totalFavourite = json['totalfavourite'] ?? 0;
    this.isSale = json['isSale'] ?? false;
    this.qty.value = json['qty'] ?? 0;
    this.category = json['category']??"";
    this.dateTime = json['dateadded'] ?? Timestamp.now();
    this.productImage = json['productImage'] ??
        'https://tse3.mm.bing.net/th?id=OIP.6Hec0K-YQL1hL-sfqyPHBwAAAA&pid=Api&P=0&w=300&h=300';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.productName;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['isSale'] = this.isSale;
    data['category'] = this.category;
    data['productImage'] = this.productImage;
    data['qty'] = this.qty;
    return data;
  }
}
