import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rasanmart/controller/userController.dart';
import 'package:rasanmart/services/authService.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  Rx<User> firebaseUser;
  User get user => firebaseUser.value;
  var loading = false.obs;
  void setLoading(value) {
    loading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    firebaseUser = _auth.currentUser.obs;
    firebaseUser.bindStream(_auth.authStateChanges());
  }

  //login
  login(String email, String password) async {
    try {
      loading.value = true;
      await authService.login(email, password);

      loading.value = false;
      
    } catch (e) {}
    UserController().getUser();
  }

  //signup
  signup(String email, String password) async {
    try {
      loading.value = true;
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      loading.value = false;
      if (user != null) showSnackbar("User created successfulle", 'Logging in');
    } on FirebaseAuthException catch (e) {
      showSnackbar(e.code, e.message);
    } catch (e) {
      print(e);
    }
  }

  //google sign in
  signinWithGoogle() async {
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    UserCredential authResult = await _auth.signInWithCredential(credential);
    if (authResult.user != null) {
      Get.snackbar('Sign in ', "Completed Successfully");
 // bool docexist;
      var doc = await FirebaseFirestore.instance
          .collection("users")
          .doc(_auth.currentUser.uid)
          .get();
      if (doc.exists) {
      } else
        await FirebaseFirestore.instance
            .collection('users')
            .doc(_auth.currentUser.uid)
            .set({
          "email": authResult.user.uid,
          'name': authResult.user.displayName,
          'phone': "",
          "street": '',
          'zip': '',
          'city': ''
        });
    }
  }

  updateUser(String name, String email, String photoUrl) {
    loading.value = true;
    user.updateEmail(email);
    user.updateProfile(displayName: name, photoURL: photoUrl);
    loading.value = false;
  }
}

showSnackbar(String title, String message) {
  Get.snackbar(title, message);
}
