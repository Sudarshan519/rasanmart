import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rasanmart/controller/authController.dart';
import 'package:rasanmart/controller/bindings/authBindings.dart';
import 'package:rasanmart/services/firestoreProducts.dart';
import 'package:rasanmart/utils/app_theme.dart';
import 'package:rasanmart/views/account.dart';
import 'package:rasanmart/views/cart_page.dart';
import 'package:rasanmart/views/categories_page.dart';
import 'package:rasanmart/views/widgets/const.dart';
import 'controller/dashBoardController.dart';
import 'controller/userController.dart';
import 'services/getStorage.dart';
import 'utils/app_theme.dart';
import 'views/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  await firebaseProduct.fetchProduct();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: AuthBinding(),
      home: Root(),
    );
  }
}

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user?.uid != null) {
          return DashboardPage();
        } else {
          return Login();
        }
      },
    );
    // return Obx(() {
    //   return (Get.find<AuthController>().user != null) ? Home() : Login();
    // });
  }
}

class Login extends GetWidget<AuthController> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      key: scaffoldKey,
      // appBar: AppBar(
      //   title: Text("Log In"),
      //   centerTitle: true,
      // ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Log In',
                style: headingStyle.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
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
                        AppTheme.subheadingStyle.copyWith(color: Colors.white),
                    contentPadding: EdgeInsets.zero,
                    prefixIcon: Icon(Icons.email),
                    hintText: "abc@gmail.com",
                    border: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal),
                      borderRadius: BorderRadius.circular(10),
                    )),
                controller: email,
                validator: (v) {
                  if (!v.isEmail) {
                    return 'provide a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    labelText: "Password",
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
                    prefixIcon: Icon(Icons.remove_red_eye),
                    hintText: "Abc@***",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: password,
                obscureText: true,
                validator: (v) {
                  if (v.isEmpty) {
                    return 'Cannot be emtpy';
                  } else if (v.length < 6) {
                    return "Password should be atleast 6 characters";
                  } else if (v.length > 15) {
                    return "Password should not be greater than 15 characters";
                  } else
                    return null;
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 40,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            primary: Colors.yellow[900],
                            onSurface: Colors.white,
                            onPrimary: Colors.white),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Get.snackbar('Validating data', 'loading ...');
                            controller.login(email.text, password.text);
                          }
                        },
                        child: Text("Log In")),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 40,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            primary: Colors.yellow[900],
                            onSurface: Colors.white,
                            onPrimary: Colors.white),
                        onPressed: () {
                          Get.to(SignUp());
                        },
                        child: Text("Sign Up")),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}

class SignUp extends GetWidget<AuthController> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text("Sign Up",
            style: TextStyle(color: Theme.of(context).primaryColor)),
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.home,
                      color: Theme.of(context).backgroundColor),
                  labelText: "Name",
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
                  hintText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: name,
              ),
              SizedBox(
                height: 20,
              ),
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
                        AppTheme.subheadingStyle.copyWith(color: Colors.white),
                    contentPadding: EdgeInsets.zero,
                    prefixIcon: Icon(Icons.email),
                    hintText: "abc@gmail.com",
                    border: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal),
                      borderRadius: BorderRadius.circular(10),
                    )),
                controller: email,
                validator: (v) {
                  if (!v.isEmail) {
                    return 'provide a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    labelText: "Password",
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
                    prefixIcon: Icon(Icons.remove_red_eye),
                    hintText: "Abc@***",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: password,
                obscureText: true,
                validator: (v) {
                  if (v.isEmpty) {
                    return 'Cannot be emtpy';
                  } else if (v.length < 6) {
                    return "Password should be atleast 6 characters";
                  } else if (v.length > 15) {
                    return "Password should not be greater than 15 characters";
                  } else
                    return null;
                },
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      if (_formKey.currentState.validate())
                        controller.createUser(
                            name.text, email.text, password.text);
                    },
                    child: Text("Sign Up")),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      controller.createUser(
                          name.text, email.text, password.text);
                    },
                    child: Text("Log In")),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class DashboardPage extends GetWidget<AuthController> {
  final DashboardController c = Get.put(DashboardController());
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // appBar: AppBar(
      //   title: Text(
      //     "Home",
      //   ),
      //   centerTitle: true,
      // ),
      body: Obx(() {
        switch (c.selectedIndex.value) {
          case 0:
            return Home(
              scaffoldKey: scaffoldKey,
            );
            //  RaisedButton(
            //   onPressed: () {
            //     Get.snackbar('e.message', ' e.details');
            //     controller.signOut();
            //   },
            //   child: Text('Signout'),
            // );
            break;
          case 1:
            return CategoriesPage();
          case 2:
            return AccountPage();
          default:
            return Home();
        }
      }),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              accountName: null,
              accountEmail: Text(controller.user.email),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.redAccent,
                child: Icon(Icons.person),
              ),
            ),

            // GetX<UserController>(builder: (_) {
            //   print(_.user.name);
            //   return UserAccountsDrawerHeader(
            //           accountName: Text(_.user.name),
            //           accountEmail: Text(_.user.email)) ??
            //       Text('');
            // }

            //  accountEmail: Text(controller.user.email)),
            //     : CircularProgressIndicator();
            //  ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => Get.to(CartPage()),
            ),
            // ListTile(
            //   leading: Icon(Icons.home),
            //   title: Text('Home'),
            // ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Get.to(
                  AccountContent(),
                );
              },
            ),
            ListTile(
                leading: Icon(Icons.category),
                title: Text('Categories'),
                onTap: () {
                  Get.to(CategoriesPage());
                }),
            ListTile(
                onTap: () {
                  cartStorage.clear();
                  controller.signOut();
                },
                leading: Icon(Icons.logout),
                title: Text('Log Out'))
          ],
        ),
      ),
      // bottomNavigationBar: Obx(() {
      //   return BottomNavigationBar(
      //     onTap: (index) {
      //       c.changevalue(index);
      //       //  print(c.selectedIndex);
      //     },
      //     currentIndex: c.selectedIndex.value ?? 0,
      //     items: [
      //       BottomNavigationBarItem(
      //         icon: Icon(CupertinoIcons.home),
      //         label: 'Home',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(FontAwesomeIcons.tags),
      //         label: 'Categories',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(CupertinoIcons.person),
      //         label: 'Account',
      //       ),
      //     ],
      //   );
      // }),
    );
  }
}

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Account'),
    );
  }
}
