import 'package:flutter/material.dart';
import 'package:office_app/config/colors.dart';

class BBElevatedButtonTheme {
  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: BBColors.white,
      backgroundColor: BBColors.deepPurple,
      padding: EdgeInsets.symmetric(vertical: 10),
    ),
  );
}
