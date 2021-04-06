import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../views/dashboard/dashboard_page.dart';

class AuthService extends GetxService {
  final auth = FirebaseAuth.instance;
  Future<void> createUser(String name, String email, String password) async {
    try {
      UserCredential _authResult = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (_authResult == null) {
        Get.snackbar("Error creating user", "message");
      } else
        Get.to(DashboardPage(), transition: Transition.downToUp);
      //create user in firestore
      // UserModel _user =
      //     UserModel(id: _authResult.user.uid, name: name, email: email);
      // if (await Database().createNewUSer(_user)) {
      //user created successfully
      //Get.find<UserController>().user = _user;}

    } on FirebaseAuthException catch (e) {
      showSnackbar(e.code, e.message);
    } on PlatformException catch (e) {
      Get.snackbar(
        "Error creating user",
        "${e.message}",
      );
    }
  }

  signInAnonymously() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();
    return userCredential.user.uid;
  }

  Future<void> login(String email, String password) async {
    try {
      // Get.find<UserController>().user =
      //     await Database().getUser(_authResult.user.uid);
      UserCredential authResult = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (authResult != null) {
        Get.to(DashboardPage());
      } else {
        
      }
    } on FirebaseAuthException catch (e) {
      showSnackbar(e.code, e.message);
    } on PlatformException catch (e) {
      Get.snackbar(e.message, e.details);
    }
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
      // Get.find<UserController>().clear();
    } on PlatformException catch (e) {
      Get.snackbar("Signing out", e.message);
    }
  }

  Future<AuthService> init() async {
    return this;
  }
}

final authService = AuthService();

showSnackbar(String title, String message) {
  Get.snackbar(title, message,
      backgroundColor: Colors.green, colorText: Colors.white);
}
