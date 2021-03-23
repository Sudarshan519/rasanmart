import 'package:get/get.dart';
import '../models/user.dart';

class UserController extends GetxController {
  Rx<UserModel> _userModel = UserModel().obs;
  void onInit() {
    super.onInit();
    // _firebaseUser.bindStream(_auth.onAuthStateChanged);
  }

  // UserController(UserController userController);
  UserModel get user =>
      _userModel.value ?? UserModel(name: 'slkef', email: 's@gmail.com');
  set user(UserModel value) => this._userModel.value = value;
  void clear() {
    _userModel.value = UserModel();
  }
}
