import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasanmart/controller/authController.dart';
import 'package:rasanmart/utils/app_theme.dart';
import 'package:rasanmart/views/signup.dart/signup.dart';
import 'package:rasanmart/views/widgets/const.dart';
import 'package:rasanmart/views/widgets/custom_textfield.dart';

import 'forgotpass.dart';

final style = TextStyle(color: Colors.white);

// class Login extends GetWidget<AuthController> {
//   final TextEditingController email = TextEditingController();
//   final TextEditingController password = TextEditingController();
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).backgroundColor,
//       key: scaffoldKey,
//       // appBar: AppBar(
//       //   title: Text("Log In"),
//       //   centerTitle: true,
//       // ),
//       body: SafeArea(
//           child: Form(
//         key: _formKey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Align(
//               alignment: Alignment.topRight,
//               child: InkWell(
//                 onTap: () {
//                   Get.back();
//                 },
//                 child: Icon(
//                   Icons.close,
//                   color: Theme.of(context).primaryColor,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         alignment: Alignment.center,
//                         child: CircleAvatar(
//                           radius: 100,
//                           backgroundColor: Colors.red.shade900,
//                           backgroundImage: AssetImage("assets/logo.png"),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       'Log In',
//                       style: headingStyle.copyWith(
//                           color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       height: 40,
//                     ),
//                     TextFormField(
//                       style: style,
//                       decoration: InputDecoration(
//                           labelText: "Email",
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(4)),
//                             borderSide:
//                                 BorderSide(width: 1, color: Colors.white),
//                           ),
//                           focusedErrorBorder: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(4)),
//                               borderSide:
//                                   BorderSide(width: 1, color: Colors.white)),
//                           labelStyle: AppTheme.subheadingStyle
//                               .copyWith(color: Colors.white),
//                           contentPadding: EdgeInsets.zero,
//                           prefixIcon: Icon(Icons.email),
//                           hintText: "abc@gmail.com",
//                           border: OutlineInputBorder(
//                             borderSide: new BorderSide(color: Colors.teal),
//                             borderRadius: BorderRadius.circular(10),
//                           )),
//                       controller: email,
//                       validator: (v) {
//                         if (!v.isEmail) {
//                           return 'provide a valid email';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(
//                       height: 40,
//                     ),
//                     TextFormField(
//                       style: style,
//                       decoration: InputDecoration(
//                           fillColor: Colors.white,
//                           labelText: "Password",
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(4)),
//                             borderSide:
//                                 BorderSide(width: 1, color: Colors.white),
//                           ),
//                           focusedErrorBorder: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(4)),
//                               borderSide:
//                                   BorderSide(width: 1, color: Colors.white)),
//                           labelStyle: AppTheme.subheadingStyle
//                               .copyWith(color: Colors.white),
//                           contentPadding: EdgeInsets.zero,
//                           prefixIcon: Icon(Icons.remove_red_eye),
//                           hintText: "Abc@***",
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10))),
//                       controller: password,
//                       obscureText: true,
//                       validator: (v) {
//                         if (v.isEmpty) {
//                           return 'Cannot be emtpy';
//                         } else if (v.length < 6) {
//                           return "Password should be atleast 6 characters";
//                         } else if (v.length > 15) {
//                           return "Password should not be greater than 15 characters";
//                         } else
//                           return null;
//                       },
//                     ),
//                     SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Container(
//                           width: MediaQuery.of(context).size.width / 2 - 40,
//                           child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10)),
//                                   primary: Colors.yellow[900],
//                                   onSurface: Colors.white,
//                                   onPrimary: Colors.white),
//                               onPressed: () {
//                                 if (_formKey.currentState.validate()) {
//                                   controller.login(email.text, password.text);
//                                   Get.snackbar(
//                                       'Validating data', 'loading ...');
//                                 }
//                               },
//                               child: Obx(() => controller.loading.value
//                                   ? Center(
//                                       child: CircularProgressIndicator(
//                                           backgroundColor: Colors.red.shade900),
//                                     )
//                                   : Text("Log In"))),
//                         ),
//                         Container(
//                           width: MediaQuery.of(context).size.width / 2 - 40,
//                           child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10)),
//                                   primary: Colors.yellow[900],
//                                   onSurface: Colors.white,
//                                   onPrimary: Colors.white),
//                               onPressed: () {
//                                 Get.to(SignUp());
//                               },
//                               child: Text("Sign Up")),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       )),
//     );
//   }
// }

class LoginView extends GetView {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
                  'Log In',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    hintText: 'Email', inputBorder: OutlineInputBorder()),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    hintText: 'Password', inputBorder: OutlineInputBorder()),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (v) {}),
                    Text('Remember me'),
                    Spacer(),
                    InkWell(
                        onTap: () {
                          Get.to(ForgotpassView());
                        },
                        child: Text('Forgot Password'))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    //Get.to(LoginsuccessView());
                  },
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
                          Get.to(SignupView());
                        },
                        child: Text('Dont have account ? Sign Up')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
