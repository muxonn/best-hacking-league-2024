import 'package:flutter/material.dart';
import 'package:office_app/config/colors.dart';
import 'package:office_app/config/themes/text_button_theme.dart';

class BBTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: BBColors.white,
    textButtonTheme: BBTextButtonTheme.textButtonTheme,
  );
}
