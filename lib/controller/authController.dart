import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> firebaseUser = Rx<User>();
  User get user => firebaseUser.value;
  var loading = false.obs;
  void setLoading(value) {
    loading.value = false;
  }

 
  @override
  void onInit() {
    super.onInit();

    firebaseUser.bindStream(_auth.authStateChanges());
  }

  

  updateUser(String name, String email, String photoUrl) {
    loading.value = true;
    user.updateEmail(email);
    user.updateProfile(displayName: name, photoURL: photoUrl);
    loading.value = false;
  }

  
}

final authController=Get.put(AuthController());