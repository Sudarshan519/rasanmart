import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rasanmart/controller/authController.dart';
import 'package:rasanmart/utils/app_theme.dart';
import 'package:rasanmart/views/widgets/const.dart';

class AccountContent extends StatelessWidget {
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 120,
                color: Colors.grey[200],
                child: Container(
                  color: Colors.grey[200],
                  width: double.infinity,
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(''),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(authController.user.photoURL) ??
                                    Icon(Icons.person),
                            backgroundColor: Colors.grey.shade400,
                            radius: 40,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Obx(
                                  () => Text(authController.user.email ?? '',
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
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
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
              Container(
                color: Colors.grey[200],
                height: height * .2,
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Text(
                      'Account ',
                      style: headingStyle,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.transparent,
                            child: Icon(Icons.person)),
                        SizedBox(width: 20),
                        Text(
                          'Profile',
                          style: titleStyle,
                        ),
                      ],
                    ),
                    Divider(color: Colors.white30),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.business, color: Colors.red),
                        SizedBox(width: 20),
                        Text(
                          'Business Profile',
                          style: titleStyle,
                        ),
                      ],
                    ),
                    // ListTile(
                    //     leading: Icon(Icons.business),
                    //     title: Text(
                    //       'Bussiness profile',
                    //       style: subtitleStyle,
                    //     )),
                    // Divider(),
                    // ListTile(
                    //     leading: Icon(Icons.star), title: Text('Saved Address')),
                  ],
                ),
              ),
              SpaceBox(),
              // Container(
              //   color: Colors.grey[200],
              //   padding: EdgeInsets.only(top: 20),
              //   height: height * .4,
              //   child: Column(
              //     children: [
              //       Text('Account ', style: headingStyle),
              //       Row(
              //         children: [
              //           CircleAvatar(
              //               radius: 20,
              //               backgroundColor: Colors.transparent,
              //               child: Icon(Icons.person)),
              //           SizedBox(
              //             width: 20,
              //           ),
              //           Text(
              //             'Profile',
              //             style: titleStyle,
              //           ),
              //         ],
              //       ),
              //       Divider(
              //         color: Colors.white54,
              //       ),
              //       ListTile(
              //           leading: Icon(Icons.business, color: Colors.red[400]),
              //           title: Text(
              //             'Bussiness profile',
              //             style: titleStyle,
              //           )),
              //       Divider(
              //         color: Colors.white30,
              //       ),
              //       ListTile(
              //           leading: Icon(Icons.star),
              //           title: Text(
              //             'Saved Address',
              //             style: titleStyle,
              //           )),
              //     ],
              //   ),
              // ),
              SpaceBox(),
              Container(
                color: Colors.grey[200],
                height: height * .3,
                child: Column(
                  children: [
                    Text('Settings '),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        CircleAvatar(
                            radius: 10, child: Icon(Icons.person, size: 10)),
                        SizedBox(width: 20),
                        Text(
                          'Language',
                          style: subtitleStyle,
                        ),
                      ],
                    ),
                    // Divider(),
                    // ListTile(
                    //     leading: Icon(Icons.business),
                    //     title: Text('Bussiness profile', style: subtitleStyle)),
                    Divider(),
                    ListTile(
                        leading: Icon(Icons.star),
                        title: Text('Saved Address',
                            style:
                                subtitleStyle.copyWith(color: Colors.black))),
                  ],
                ),
              ),
              SpaceBox(),
              Container(
                color: Colors.grey[200],
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.grey,
                  ),
                  title: Text('Log out',
                      style: subtitleStyle.copyWith(color: Colors.black)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text('Version 7.4.1',
                      style: subtitleStyle.copyWith(color: Colors.white)))
            ],
          ),
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
