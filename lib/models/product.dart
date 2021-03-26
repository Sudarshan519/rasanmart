import 'package:flutter/material.dart';

import 'productModel.dart';

class ProductModel {
  final Product product;
  final String productid;
  ProductModel({
    @required this.product,
    @required this.productid,
  });
  Map<String, dynamic> toMap() {
    return {
      'product': product,
      'productId': productid,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      product: Product.fromJson(map['product']),
      productid: map['productid'],
    );
  }
}
