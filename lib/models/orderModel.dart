import 'productModel.dart';

class OrderModelModel {
  int id;
  String address;
  String city;
  int phone;
  String contact;

  List<Product> products;

  OrderModelModel({this.id, this.products,this.phone,this.city,this.address,this.contact});

  OrderModelModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.products = json['products'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['products'] = this.products;
    data['address'] = this.address;
    data['city'] = this.city;
    data['phone'] = this.phone;
    return data;
  }
}
