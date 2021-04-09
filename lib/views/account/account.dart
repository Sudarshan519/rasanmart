import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rasanmart/app/modules/CompleteProfile/views/complete_profile_view.dart';
import 'package:rasanmart/controller/authController.dart';
import 'package:rasanmart/controller/userController.dart';
import 'package:rasanmart/utils/app_theme.dart';
import 'package:rasanmart/views/login/login.dart';
import 'package:rasanmart/views/widgets/const.dart';

import '../../controller/languageController.dart';

class AccountContent extends StatelessWidget {
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        //leading: Icon(Icons.arrow_back),
        backgroundColor: Theme.of(context).backgroundColor,
        // leading: InkWell(
        //   onTap: () {
        //     Get.back();
        //   },
        //   child: Icon(Icons.arrow_back, color: Colors.white),
        // ),
        title: Text(
          'account'.tr,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: authController.user == null
            ? InkWell(
                child: Center(
                    child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).backgroundColor,
                    primary: Theme.of(context).primaryColor),
                onPressed: () {
                  Get.to(Login());
                },
                child: Text('Sign in'),
              )))
            : SingleChildScrollView(
                // physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, bottom: 10, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                CircleAvatar(
                                  backgroundImage: NetworkImage(authController
                                              .user.photoURL ??
                                          'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60') ??
                                      Icon(Icons.person),
                                  backgroundColor: Colors.grey.shade400,
                                  radius: 40,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Obx(
                                        () => Text(
                                            authController.user.email ??
                                                'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
                                            style: kTitleStyle.copyWith(
                                                color: Colors.black)),
                                      ),
                                      Text(
                                        '9484848484',
                                        style: subtitleStyle.copyWith(
                                            color: Colors.black),
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          primary: Colors.red,
                                          backgroundColor:
                                              Theme.of(context).buttonColor,
                                          // shape: RoundedRectangleBorder(
                                          //     borderRadius:
                                          //         BorderRadius.circular(20)),
                                        ),
                                        child: Text('Edit'),
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (_) {
                                                return CustomAlertDialog();
                                              });
                                        },
                                      ),
                                    ]),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SpaceBox(),
                    Text(
                      'Account ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Card(
                      child: ListTile(
                        onTap: () {
                          Get.to(Profile());
                        },
                        leading: Icon(Icons.person),
                        title: Text(
                          'profile'.tr,
                          style: titleStyle,
                        ),
                      ),
                    ),
                    SpaceBox(),
                    SpaceBox(),
                    Text(
                      'settings'.tr,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Card(
                      child: ListTile(
                        onTap: () {
                          showModalBottomSheet<void>(
                            backgroundColor: Colors.transparent,
                            //     bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.black54)
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                padding: EdgeInsets.only(
                                    left: 30, top: 20, right: 20),
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Text(
                                          'Select You Language',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        Container(
                                          height: 20,
                                          child: InkWell(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: Icon(Icons.close,
                                                size: 10,
                                                color: Colors.grey[600]),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),

                                    Container(
                                      height: 20,
                                      child: InkWell(
                                        onTap: () {
                                          languageController
                                              .selectedIndex.value = 0;
                                          languageController.changeLanguage(
                                              'en', 'US');
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              'English',
                                              style: TextStyle(
                                                  color: Colors.grey[800],
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Spacer(),
                                            Obx(
                                              () => (languageController
                                                          .selectedIndex
                                                          .value ==
                                                      0
                                                  ? Icon(Icons.check_circle,
                                                      color: Colors.green)
                                                  : Text('')),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 20),
                                    Container(
                                      height: 20,
                                      child: InkWell(
                                        onTap: () {
                                          languageController
                                              .selectedIndex.value = 1;
                                          languageController.changeLanguage(
                                              'hi', 'IN');
                                        },
                                        child: Row(children: [
                                          Text(
                                            'Nepali',
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Spacer(),
                                          Obx(
                                            () => (languageController
                                                        .selectedIndex.value ==
                                                    1
                                                ? Icon(Icons.check_circle,
                                                    color: Colors.green)
                                                : Text('')),
                                          )
                                          //   Icon(Icons.check_circle,color:Colors.green)
                                        ]),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 20,
                                      child: InkWell(
                                        onTap: () {
                                          languageController
                                              .selectedIndex.value = 2;
                                        },
                                        child: Row(children: [
                                          Text(
                                            'Hindi',
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Spacer(),
                                          Obx(
                                            () => (languageController
                                                        .selectedIndex.value ==
                                                    2
                                                ? Icon(Icons.check_circle,
                                                    color: Colors.green)
                                                : Text('')),
                                          )
                                          // Icon(Icons.check_circle,color:Colors.green)
                                        ]),
                                      ),
                                    ),

                                    // const Text('Modal BottomSheet'),
                                    // ElevatedButton(
                                    //   child: const Text('Close BottomSheet'),
                                    //   onPressed: () => Navigator.pop(context),
                                    // )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        leading: Icon(
                          Icons.language,
                        ),
                        title: Text(
                          'Language',
                          style: subtitleStyle,
                        ),
                      ),
                    ),
                    SpaceBox(),
                    Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.logout,
                          color: Colors.grey,
                        ),
                        title: Text('logout'.tr,
                            style: subtitleStyle.copyWith(color: Colors.black)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                        child: Text('Version 7.4.1',
                            style: subtitleStyle.copyWith(color: Colors.grey)))
                  ],
                ),
              ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Profile'),
      //   actions: [],
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  Text('Profile'),
            // Container(
            //   height: 300,
            //   color: Colors.red,
            // ),
            // Text('Profile'),
            Container(
                alignment: Alignment.center,
                height: 300,
                color: Colors.red,
                child: Stack(children: [
                  Container(
                    height: 150,
                    color: Colors.white,
                  ),
                  Center(
                    child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
                        )),
                  ),
                  Positioned(
                      right: 30,
                      top: 40,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back),
                      )),
                  Positioned(
                      right: 30,
                      top: 40,
                      child: InkWell(
                        onTap: () {
                          Get.to(CompleteprofileView(isUpdate: true));
                        },
                        child: CircleAvatar(
                          child: Icon(Icons.edit),
                        ),
                      ))
                ])),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text('Name'),
                SizedBox(height: 10),
                Text(userController.user.value.name),
                Divider(),
                SizedBox(height: 20),
                Text('Email'),
                SizedBox(height: 10),
                Text(userController.user.value.email),
                Divider(),
                SizedBox(height: 20),
                Text('Address'),
                SizedBox(height: 10),
                Text(
                    '${userController.user.value.street},${userController.user.value.city}'),
                Divider(),
                SizedBox(height: 20),
                Text('Phone'),
                SizedBox(height: 10),
                Text('${userController.user.value.phone}'),
                SizedBox(height: 20),
                Text('')
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomAlertDialog extends StatefulWidget {
  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  final authController = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController phone = TextEditingController();
  String photoUrl;
  File _image;

  final picker = ImagePicker();
  bool fromGallery = true;
  pickImage(bool fromGallery) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null)
      setState(() {
        _image = File(pickedFile.path);
      });
    else {}
  }

  uploadImage() async {
    final _firebaseReference = FirebaseStorage.instance
        .ref()
        .child('users/${authController.user.uid}/profilePicture.png');
    UploadTask uploadTask = _firebaseReference.putFile(_image);
    uploadTask.whenComplete(
        () => _firebaseReference.getDownloadURL().then((value) async => {
              // print(value)
              await authController.updateUser(username.text, email.text, value)
            }));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).backgroundColor,
      title: Text(
        'Update Profile',
        style: TextStyle(color: Colors.blueGrey),
      ),
      content: Form(
        key: _formKey,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          TextFormField(
            decoration: InputDecoration(
                labelText: "Email",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: Colors.white),
                ),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(width: 1, color: Colors.white)),
                labelStyle:
                    AppTheme.subheadingStyle.copyWith(color: Colors.grey),
                contentPadding: EdgeInsets.zero,
                prefixIcon: Icon(Icons.email),
                hintText: "abc@gmail.com",
                border: OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(10),
                )),
            controller: email,
            validator: (v) {
              if (!GetUtils.isEmail(v)) {
                return 'provide a valid email';
              }
              return null;
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: "Username",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: Colors.white),
                ),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(width: 1, color: Colors.white)),
                labelStyle:
                    AppTheme.subheadingStyle.copyWith(color: Colors.white),
                contentPadding: EdgeInsets.zero,
                prefixIcon: Icon(Icons.email),
                hintText: "abc",
                border: OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(10),
                )),
            controller: username,
            validator: (v) {
              if (v.length < 3) {
                return 'provide a valid name';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () async {
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: Text('Select you image'),
                      content: Column(
                        children: [
                          ListTile(
                            onTap: () {
                              pickImage(true);
                            },
                            title: Text('Gallery'),
                          ),
                          ListTile(
                              onTap: () {
                                pickImage(false);
                              },
                              title: Text('Camera'))
                        ],
                      ),
                    );
                  });
            },
            child: _image == null
                ? Row(
                    children: [
                      Icon(
                        Icons.add_a_photo,
                        color: Colors.grey,
                      ),
                      Text('Select Photo')
                    ],
                  )
                : Text(''),
          ),
          _image == null
              ? Text(
                  'No image selected.',
                  style: TextStyle(color: Colors.grey),
                )
              : Image.file(_image),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('Cancel')),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      print(email.text);
                      print(username.text);
                      authController.setLoading(false);
                      await uploadImage();
                    }
                  },
                  child: Obx(() => authController.loading.value
                      ? Text('Saving')
                      : Text('Submit'))),
            ],
          )
        ]),
      ),
    );
  }
}
