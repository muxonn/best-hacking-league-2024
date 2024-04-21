import 'package:flutter/material.dart';
import 'package:office_app/config/colors.dart';

class BBElevatedButtonTheme {
  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: BBColors.deepPurple,
      backgroundColor: BBColors.white,
      padding: EdgeInsets.symmetric(vertical: 10),
    ),
  );
}
