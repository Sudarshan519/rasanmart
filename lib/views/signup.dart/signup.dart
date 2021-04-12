import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasanmart/controller/authController.dart';
import 'package:rasanmart/services/authService.dart';
import 'package:rasanmart/utils/app_theme.dart';
import 'package:rasanmart/views/login/login.dart';
import 'package:rasanmart/views/widgets/custom_textfield.dart';

// class SignUp extends GetWidget<AuthController> {
//   final TextEditingController name = TextEditingController();
//   final TextEditingController email = TextEditingController();
//   final TextEditingController password = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).backgroundColor,
//       appBar: AppBar(
//         leading: InkWell(
//             onTap: () {
//               Get.back();
//             },
//             child: Icon(Icons.arrow_back, color: Colors.white)),
//         backgroundColor: Theme.of(context).backgroundColor,
//         title: Text("Sign Up",
//             style: TextStyle(color: Theme.of(context).primaryColor)),
//         centerTitle: true,
//       ),
//       body: Center(
//           child: Padding(
//         padding: const EdgeInsets.all(18.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               // TextFormField(
//               //   decoration: InputDecoration(
//               //     fillColor: Colors.white,
//               //     prefixIcon: Icon(Icons.home,
//               //         color: Theme.of(context).backgroundColor),
//               //     labelText: "Name",
//               //     enabledBorder: OutlineInputBorder(
//               //       borderRadius: BorderRadius.all(Radius.circular(4)),
//               //       borderSide: BorderSide(width: 1, color: Colors.white),
//               //     ),
//               //     focusedErrorBorder: OutlineInputBorder(
//               //         borderRadius: BorderRadius.all(Radius.circular(4)),
//               //         borderSide: BorderSide(width: 1, color: Colors.white)),
//               //     labelStyle:
//               //         AppTheme.subheadingStyle.copyWith(color: Colors.white),
//               //     contentPadding: EdgeInsets.zero,
//               //     hintText: "Name",
//               //     border: OutlineInputBorder(
//               //       borderRadius: BorderRadius.circular(10),
//               //     ),
//               //   ),
//               //   controller: name,
//               // ),
//               // SizedBox(
//               //   height: 20,
//               // ),
//               TextFormField(
//                 decoration: InputDecoration(
//                     labelText: "Email",
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(4)),
//                       borderSide: BorderSide(width: 1, color: Colors.white),
//                     ),
//                     focusedErrorBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(4)),
//                         borderSide: BorderSide(width: 1, color: Colors.white)),
//                     labelStyle:
//                         AppTheme.subheadingStyle.copyWith(color: Colors.white),
//                     contentPadding: EdgeInsets.zero,
//                     prefixIcon: Icon(Icons.email),
//                     hintText: "abc@gmail.com",
//                     border: OutlineInputBorder(
//                       borderSide: new BorderSide(color: Colors.teal),
//                       borderRadius: BorderRadius.circular(10),
//                     )),
//                 controller: email,
//                 validator: (v) {
//                   if (!v.isEmail) {
//                     return 'provide a valid email';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                     fillColor: Colors.white,
//                     labelText: "Password",
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(4)),
//                       borderSide: BorderSide(width: 1, color: Colors.white),
//                     ),
//                     focusedErrorBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(4)),
//                         borderSide: BorderSide(width: 1, color: Colors.white)),
//                     labelStyle:
//                         AppTheme.subheadingStyle.copyWith(color: Colors.white),
//                     contentPadding: EdgeInsets.zero,
//                     prefixIcon: Icon(Icons.remove_red_eye),
//                     hintText: "Abc@***",
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10))),
//                 controller: password,
//                 obscureText: true,
//                 validator: (v) {
//                   if (v.isEmpty) {
//                     return 'Cannot be emtpy';
//                   } else if (v.length < 6) {
//                     return "Password should be atleast 6 characters";
//                   } else if (v.length > 15) {
//                     return "Password should not be greater than 15 characters";
//                   } else
//                     return null;
//                 },
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 height: 40,
//                 width: double.infinity,
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         primary: Colors.red,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10))),
//                     onPressed: () {
//                       if (_formKey.currentState.validate())
//                         authService.createUser(
//                             name.text, email.text, password.text);
//                     },
//                     child: Text("Sign Up")),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 height: 40,
//                 width: double.infinity,
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         primary: Colors.red,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10))),
//                     onPressed: () {
//                       Get.back();
//                       // authService.createUser(
//                       //     name.text, email.text, password.text);
//                     },
//                     child: Text("Back to Log In")),
//               ),
//             ],
//           ),
//         ),
//       )),
//     );
//   }
// }

class SignupView extends GetView<AuthController> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.grey[200],
                    child: FlutterLogo(
                      size: 90,
                    ),
                    //      backgroundImage: AssetImage("assets/logo.png"),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Sign Up',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: email,
                  inputBorder: OutlineInputBorder(),
                  hintText: 'Email',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    controller: password, inputBorder: OutlineInputBorder()),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (v) {}),
                    Text('Remember me'),
                    Spacer(),
                    Text('Forgot Password')
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {},
                  child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: double.infinity,
                      child: Text('Continue')),
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.red.shade800,
                      primary: Theme.of(context).scaffoldBackgroundColor),
                ),
                SizedBox(height: 30),
                Center(
                    child: InkWell(
                        onTap: () {
                          Get.to(LoginView());
                        },
                        child: Text('Already have account ? Sign In')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
