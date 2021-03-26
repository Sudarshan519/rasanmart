import 'package:flutter/material.dart';
import 'package:rasanmart/utils/app_theme.dart';

class CustomTextButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String text;
  const CustomTextButton({Key key, this.onPressed, this.icon, this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Column(
          children: [
            if (icon != null) Icon(icon),
            Text(
              text,
              style: AppTheme.subheadingStyle,
            ),
          ],
        ));
  }
}
