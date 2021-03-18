import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasanmart/controller/authController.dart';
import 'package:rasanmart/controller/bindings/authBindings.dart';
import './controller/userController.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user?.uid != null) {
          return Home();
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

class Home extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            GetX<UserController>(builder: (_) {
              return _.user != null
                  ? UserAccountsDrawerHeader(
                      accountName: Text(_.user.name)

                      //  GetX<UserController>(builder: (_){
                      //   print(_.user.name);
                      //  return Text(_.user.name);
                      //}
                      ,
                      accountEmail: Text(_.user.email))
                  : CircularProgressIndicator();
            }),
            ListTile(onTap: (){
              controller.signOut();
            },
            leading: Icon(Icons.logout),title: Text('Log Out'))
          ],
        ),
      ),
    
    
     
    );
  }
}
