import 'package:flutter/material.dart';
import 'package:rasanmart/utils/app_theme.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final Function validator;
  final IconData icon;
  final TextEditingController controller;

  const CustomTextField(
      {Key key,
      this.label,
      this.hintText,
      this.validator,
      this.controller,
      this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
     // cursorColor: Colors.red,
     // cursorHeight: 15,
      decoration: InputDecoration(
          labelText: label,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          errorStyle: TextStyle(color: Colors.red),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Colors.grey)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Colors.red)),
          labelStyle: AppTheme.subheadingStyle.copyWith(color: Colors.grey),
          //contentPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.only(left: 10, right: 20),
          suffixIcon: Icon(icon),
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.teal),
            borderRadius: BorderRadius.circular(10),
          )),
      controller: controller,
      validator: (v) {
        if (v.isEmpty) return 'Enter valid value';
        else return '';
      },
    );
  }
}
