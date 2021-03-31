import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasanmart/controller/authController.dart';
import 'package:rasanmart/services/authService.dart';
import 'package:rasanmart/utils/app_theme.dart';
import 'package:rasanmart/views/signup.dart/signup.dart';
import 'package:rasanmart/views/widgets/const.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.close,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage("assets/logo.png"),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
                            authService.login(email.text, password.text);
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
