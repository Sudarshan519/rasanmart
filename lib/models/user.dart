import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  String email;
  String street;
  String phone;
  String city;
  String zip;
  UserModel(
      {this.id,
      this.name,
      this.email,
      this.street,
      this.city,
      this.phone,
      this.zip});

  UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc.id;
    name = doc["name"];
    email = doc["email"];
    city = doc["city"];
    phone = doc["phone"];
    street = doc["street"];
    zip = doc['zip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['street'] = this.street;
    data['zip'] = this.zip;
    data['city'] = this.city;
    return data;
  }

  UserModel.fromJson(Map<String, dynamic> doc) {
    id = doc["id"];
    name = doc["name"];
    email = doc["email"];
    city = doc["city"];
    phone = doc["phone"];
    street = doc["street"];
  }
}
