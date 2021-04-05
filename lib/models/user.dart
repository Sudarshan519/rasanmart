import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  String email;
  String street;
  String phone;
  String city;
  UserModel({this.id, this.name, this.email});

  UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc.id;
    name = doc["name"];
    email = doc["email"];
    city = doc["city"];
    phone = doc["phone"];
    street = doc["street"];
  }
}
