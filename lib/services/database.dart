import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';

class Database {
  final Firestore _firestore = Firestore.instance;
  Future<bool> createNewUSer(UserModel user) async {
    try {
      await _firestore.collection("users").document(user.id).setData({
        "name": user.name,
        "email": user.email,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection("users").document(uid).get();
      return UserModel.fromDocumentSnapshot(doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
