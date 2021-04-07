import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'productModel.dart';

class OrderModelModel {
  String id;
  String address;
  String city;
  int phone;
  String contact;
  String email;
  String status;
  Timestamp timeStamp;
  List<Product> products;

  OrderModelModel(
      {this.id,
      this.products,
      this.phone,
      this.city,
      this.address,
      this.contact,
      this.email,
      this.status,
      this.timeStamp});

  OrderModelModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    List<dynamic> prod = jsonDecode(json['cart']);
    List<Product> prodlist = [];
    prod.forEach((element) {
      prodlist.add(Product.fromJson(element));
    });
    this.products = prodlist;
    this.email = json['contact'] ?? 'no value';
    this.address = json['address'] ?? 'no value';
    this.city = json['city'] ?? 'novalue';
    this.phone = json['phone'] ?? 212313;
    this.status = json['status'] ?? 'sent';
    this.timeStamp = json['timestamp'] ?? Timestamp.now();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['products'] = this.products;
    data['address'] = this.address;
    data['contact'] = this.email;
    data['city'] = this.city;
    data['phone'] = this.phone;
    data['timestamp'] = Timestamp.now();
    return data;
  }
}
