import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class AppTheme {
//b00000
  static double iconsize = 16;
  static Color lightBackgroundColor = HexColor('#B30000');
  static Color lightPrimaryColor = Colors.red.shade900;
  static Color lightAccentColor = Colors.blueGrey[50];
  static Color lightBtnColor = HexColor('#F78A04');
  static Color lightSalesolor = Colors.teal[300];
  static Color lightcounterbtnColor = Colors.grey[300];

  static Color darkBackgroundColor = const Color(0xFF1A2127);
  static Color darkPrimaryColor = const Color(0xFF1A2127);
  static Color darkAccentColor = Colors.blueGrey.shade600;
  static Color darkParticlesColor = const Color(0x441C2A3D);
  static final headingStyle = TextStyle(
    fontSize: 20,
    color: Colors.black87,
  );
  static final subheadingStyle =
      TextStyle(fontSize: 16, color: lightBackgroundColor);
  static final title = TextStyle(fontSize: 14, color: Colors.grey);
  static final subtitle = TextStyle(fontSize: 12, color: Colors.red);
  const AppTheme._();

  static final lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: lightPrimaryColor,
      accentColor: lightAccentColor,
      backgroundColor: lightBackgroundColor,
      errorColor: lightPrimaryColor
      // visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkPrimaryColor,
    accentColor: darkAccentColor,
    errorColor: lightBackgroundColor,
    //const Color(0xFFB00020),
    backgroundColor: darkBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

extension ThemeExtras on ThemeData {
//Color get btnColor => AppTheme.lightBtnColor;
}
