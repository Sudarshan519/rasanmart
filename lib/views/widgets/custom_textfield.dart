import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasanmart/utils/app_theme.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final Function validator;
  final TextEditingController controller;

  const CustomTextField({Key key, this.label, this.hintText, this.validator, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: label,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.white),
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Colors.white)),
          labelStyle: AppTheme.subheadingStyle.copyWith(color: Colors.white),
          contentPadding: EdgeInsets.zero,
          prefixIcon: Icon(Icons.email),
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.teal),
            borderRadius: BorderRadius.circular(10),
          )),
      controller: controller,
      validator: validator,
    );
  }
}
