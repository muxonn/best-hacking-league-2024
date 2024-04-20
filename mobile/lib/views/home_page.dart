import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_app/config/colors.dart';
import 'package:office_app/config/constants/sizes.dart';
import 'package:office_app/config/l10n/extensions.dart';
import 'package:office_app/features/main_page_info_widget/main_page_info_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final headerStyle = TextStyle(
    color: BBColors.black,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BBColors.white,
      body: Padding(
        padding: BBSizes.mainPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.text.homePageWelcomeText("Francesco"),
              style: headerStyle,
            ),
            MainPageInfoWidget(
              title: context.text.homePageWidgetGood,
              subtitle: context.text.homePageWidgetSubTitle,
              points: context.text.homePageWidgetPoints(2040),
            ),
            Text(
              context.text.homePageTodaySession,
              style: headerStyle,
            ),
          ],
        ),
      ),
    );
  }
}
