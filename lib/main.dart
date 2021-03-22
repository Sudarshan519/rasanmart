import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:rasanmart/controller/authController.dart';
import 'package:rasanmart/controller/bindings/authBindings.dart';
import './controller/userController.dart';
import 'controller/dashBoardController.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
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

class Home extends StatelessWidget {
  final controller = Get.find<UserController>().user;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        'Welcome ${controller.name} \n You can add items shop here',
        textAlign: TextAlign.center,
      )),

      //bottomNavigationBar: DashboardPage()
    );
  }
}

class DashboardPage extends GetWidget<AuthController> {
  final DashboardController c = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Home",
          ),
          centerTitle: true,
        ),
        body: Obx(() {
          switch (c.selectedIndex.value) {
            case 0:
              return RaisedButton(
                onPressed: () {
                  Get.snackbar('e.message',' e.details');
                  controller.signOut();
                },
                child: Text('Signout'),
              );
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
              // GetX<UserController>(builder: (_) {
              // //  print(_.user.id);
              //   return _.user != null
              //       ?
              // UserAccountsDrawerHeader(
              //accountName: Text(controller.user.displayName) ?? Text('')

              GetX<UserController>(builder: (_) {
                print(_.user.name);
                return UserAccountsDrawerHeader(
                        accountName: Text(_.user.name),
                        accountEmail: Text(_.user.email)) ??
                    Text('');
              }

                  //  accountEmail: Text(controller.user.email)),
                  //     : CircularProgressIndicator();
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
              print(c.selectedIndex);
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
