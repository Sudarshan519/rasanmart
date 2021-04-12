import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rasanmart/services/authService.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

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
