import 'productModel.dart';

class OrderModelModel {
  int id;
  List<Product> products;

  OrderModelModel({this.id, this.products});

  OrderModelModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.products = json['products'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['products'] = this.products;
    return data;
  }
}
