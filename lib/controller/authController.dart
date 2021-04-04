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
signup(String email,String password) async {
  try {
  UserCredential user=await  _auth.createUserWithEmailAndPassword(email: email, password: password);
  if(user!=null)
  showSnackbar("User created successfulle", 'Logging in');

  }on FirebaseAuthException catch (e) {

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


showSnackbar(String title,String message){
  Get.snackbar(title, message);
}