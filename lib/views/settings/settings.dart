import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasanmart/controller/authController.dart';
import 'package:rasanmart/views/widgets/const.dart';
import '../../controller/languageController.dart';

class SettingsPage extends StatelessWidget {
  final authController = Get.find<AuthController>();
  final style =
      TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
          title: Text(
            'settings'.tr,
            style: appbarStyle,
          ),
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   'account'.tr,
              //   style: TextStyle(color: Colors.grey),
              // ),
              // Card(
              //   child: ListTile(
              //     onTap: () {
              //       Get.to(AccountContent());
              //     },
              //     leading: Icon(Icons.person),
              //     title: Text(
              //       'profile'.tr,
              //       style: subtitleStyle,
              //     ),
              //   ),
              // ),
              Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.email),
                        title: Text(
                          'sudarshan@gmail.cm',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                );
              }),
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
                          padding:
                              EdgeInsets.only(left: 30, top: 20, right: 20),
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
                                          size: 10, color: Colors.grey[600]),
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
                                    languageController.selectedIndex.value = 0;
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
                                                    .selectedIndex.value ==
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
                                    languageController.selectedIndex.value = 1;
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
                                    languageController.selectedIndex.value = 2;
                                    languageController.changeLanguage(
                                        'ne', "NE");
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
                    'language'.tr,
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
                  title: Text('logout'.tr, style: subtitleStyle.copyWith()),
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
        ));
  }
}
