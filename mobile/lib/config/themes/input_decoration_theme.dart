import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_app/config/colors.dart';

class BBInputDecorationTheme {
  static final lightInputDecorationTheme = InputDecorationTheme(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: BBColors.black),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: BBColors.black),
    ),
    hintStyle: TextStyle(color: BBColors.black, fontSize: 16.sp),
  );
}
