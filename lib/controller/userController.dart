import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../models/user.dart';

class UserController extends GetxController {
  var userPhoto = ''.obs;
  final picker = ImagePicker();
  var img = null.obs;
  void changePhoto(String photo) {
    this.userPhoto.value = photo;
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      img = File(pickedFile.path).obs;
    } else {
      print('No image selected.');
    }
  }

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

final userController=Get.put(UserController());