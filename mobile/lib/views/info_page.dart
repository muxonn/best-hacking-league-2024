import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_app/config/colors.dart';
import 'package:office_app/config/constants/sizes.dart';
import 'package:office_app/config/l10n/extensions.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:office_app/features/languages/cubit/language_cubit.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BBColors.deepPurple,
      body: Container(
        padding: BBSizes.mainPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: 100.sp,
                child: Image.asset("assets/img/main-logo.png"),
              ),
            ),
            LiteRollingSwitch(
              onTap: () {},
              onDoubleTap: () {},
              onSwipe: () {},
              onChanged: (p0) {
                context.read<LanguageCubit>().switchLanguage();
              },
              textOn: "PL",
              colorOn: BBColors.lightPurple,
              colorOff: BBColors.lightPurple,
              textOff: "EN",
              textOnColor: BBColors.white,
              textOffColor: BBColors.white,
              iconOn: Icons.south_america,
              iconOff: Icons.south_america,
              width: 80.w,
            ),
            Text(
              textAlign: TextAlign.justify,
              context.text.infoText,
              style: TextStyle(
                color: BBColors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Blutus Team",
                  style: TextStyle(
                    color: BBColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10.w),
                SizedBox(
                  width: 40.sp,
                  child: Image.asset("assets/img/bhl.png"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
