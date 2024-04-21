import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_app/config/colors.dart';

class BBInputDecorationTheme {
  static final inputDecorationTheme = InputDecorationTheme(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: BBColors.white),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: BBColors.white),
    ),
    hintStyle: TextStyle(color: BBColors.white, fontSize: 12.sp),
  );
}
