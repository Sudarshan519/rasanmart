import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../models/user.dart';
import '../services/database.dart';
import '../controller/userController.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<FirebaseUser> _firebaseUser = Rx<FirebaseUser>();
  FirebaseUser get user => _firebaseUser.value;
  // String get uid => _firebaseUser.value?.uid;
  // String get name => _firebaseUser.value?.displayName;
  @override
  // ignore: must_call_super
  void onInit() {
    _firebaseUser.bindStream(_auth.onAuthStateChanged);
  }

  Future<void> createUser(String name, String email, String password) async {
    try {
      AuthResult _authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      //create user in firestore
      UserModel _user =
          UserModel(id: _authResult.user.uid, name: name, email: email);
      if (await Database().createNewUSer(_user)) {
        //user created successfully
        Get.find<UserController>().user = _user;
      }
    } on PlatformException catch (e) {
      Get.snackbar("Error creating user", e.message);
    }
  }

  Future<void> login(String email, String password) async {
    try {
      AuthResult _authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.find<UserController>().user =
          await Database().getUser(_authResult.user.uid);
    } on PlatformException catch (e) {
      Get.snackbar("Error logging in", e.message);
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      Get.find<UserController>().clear();
    } on PlatformException catch (e) {
      Get.snackbar("Signing out", e.message);
    }
  }
}
