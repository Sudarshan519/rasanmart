import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:rasanmart/controller/authController.dart';
import 'package:rasanmart/controller/bindings/authBindings.dart';
import 'package:rasanmart/utils/app_theme.dart';
import 'controller/dashBoardController.dart';
import 'views/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        //   Get.put<UserController>(UserController());
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: scaffoldKey,
      appBar: AppBar(
        title: Text("Log In"),
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: "Email"),
              controller: email,
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Password"),
              controller: password,
              obscureText: true,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.login(email.text, password.text);
                },
                child: Text("Log In")),
            ElevatedButton(
                onPressed: () {
                  Get.to(SignUp());
                },
                child: Text("Sign Up")),
          ],
        ),
      )),
    );
  }
}

class SignUp extends GetWidget<AuthController> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: "Name"),
              controller: name,
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Email"),
              controller: email,
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Password"),
              controller: password,
              obscureText: true,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.createUser(name.text, email.text, password.text);
                },
                child: Text("Sign Up")),
            ElevatedButton(
                onPressed: () {
                  Get.to(Login());
                },
                child: Text("Log In")),
          ],
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
                  accountName: null, accountEmail: Text(controller.user.email)),

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
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Home'),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log out'),
              ),
              ListTile(
                  onTap: () {
                    controller.signOut();
                  },
                  leading: Icon(Icons.logout),
                  title: Text('Log Out'))
            ],
          ),
        ),
        bottomNavigationBar: Obx(() {
          return BottomNavigationBar(
            onTap: (index) {
              c.changevalue(index);
              //  print(c.selectedIndex);
            },
            currentIndex: c.selectedIndex.value ?? 0,
            items: [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.cat),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person),
                label: 'Account',
              ),
            ],
          );
        }));
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

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Categories'),
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Account'));
  }
}
