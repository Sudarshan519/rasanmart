// import 'package:flutter/material.dart';
// import 'package:rasanmart/utils/app_theme.dart';

// class CustomTextField extends StatelessWidget {
//   final String label;
//   final String hintText;
//   final Function validator;
//   final IconData icon;
//   final TextEditingController controller;
//   final TextInputType textInputType;
//   const CustomTextField(
//       {Key key,
//       this.label,
//       this.hintText,
//       this.validator,
//       this.controller,
//       this.icon,
//       this.textInputType})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       // cursorColor: Colors.red,
//       // cursorHeight: 15,
//       keyboardType: textInputType,
//       decoration: InputDecoration(

//           labelText: label,
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(4)),
//             borderSide: BorderSide(width: 1, color: Colors.grey),
//           ),
//           errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(4)),
//             borderSide: BorderSide(width: 1, color: Colors.grey),
//           ),
//           errorStyle: TextStyle(color: Colors.red),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(4)),
//               borderSide: BorderSide(width: 1, color: Colors.grey)),
//           focusedErrorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(4)),
//               borderSide: BorderSide(width: 1, color: Colors.red)),
//           labelStyle: AppTheme.subheadingStyle.copyWith(color: Colors.grey),
//           //contentPadding: EdgeInsets.zero,
//           contentPadding: EdgeInsets.only(left: 10, right: 20),
//           suffixIcon: Icon(icon),
//           hintText: hintText,
//           border: OutlineInputBorder(
//             borderSide: new BorderSide(color: Colors.teal),
//             borderRadius: BorderRadius.circular(10),
//           )),
//       controller: controller,
//       validator: (v) {
//         if (v.isEmpty)
//           return 'Enter valid value';
//         else
//           return null;
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final InputBorder inputBorder;
  final Color hintcolor;
  final Function ontap;
  final bool obscureText;

  const CustomTextField(
      {Key key,
      this.controller,
      this.hintText,
      this.inputBorder,
      this.hintcolor,
      this.ontap,
      this.obscureText = false, TextInputType textInputType})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (v) {
          if (v.isEmpty) return '$hintText cannot be Empty';
          //email validation
          if (hintText.toLowerCase() == 'email') {
            if (v.isEmail) return null;
            return 'Invalid email';
          }

          if (hintText.toLowerCase() == 'city' ||
              hintText.toLowerCase() == 'street') {
            if (v.length < 3)
              return 'Enter a valid $hintText';
            else
              return null;
          }

          //validate phone
          if (hintText.toLowerCase() == 'phone') {
            if (v.isPhoneNumber) {
              return null;
            } else
              return 'invalid phone number';
          }
          //validate zip
          if (hintText.toLowerCase() == 'zip') {
            if (v.isNum) {
              return null;
            } else
              return 'invalid';
          } else
            return null;
        },
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
            hintText: hintText,
            labelStyle: TextStyle(color: hintcolor),
            labelText: hintText,
            border: inputBorder));
  }
}
