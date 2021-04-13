import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';

class CloudUser {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<bool> createNewUSer(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "name": user.name,
        "email": user.email,
        "city": user.city,
        "street": user.street,
        "phone": user.phone,
      });
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<UserModel> getUser() async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser.uid)
          .get();
      if(doc.exists)
    {  UserModel user = UserModel.fromDocumentSnapshot(doc);
    //  print(user.name);
     return user;}
     else
     {  await _firestore
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser.uid)
          .set({
            "id":FirebaseAuth.instance.currentUser.uid,
            "email":FirebaseAuth.instance.currentUser.email,
            "name":"",
            "city":"",
            "street":"",
            "zip":"",
          });
          getUser();}
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
