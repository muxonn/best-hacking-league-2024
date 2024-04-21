import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_app/config/colors.dart';
import 'package:office_app/config/constants/sizes.dart';
import 'package:office_app/config/l10n/extensions.dart';
import 'package:office_app/features/circular_chart/circular_chart_widget.dart';
import 'package:office_app/features/home_page_bottom_stats/widgets/home_page_bottom_stats.dart';
import 'package:office_app/features/main_page_info_widget/main_page_info_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final headerStyle = TextStyle(
    color: BBColors.black,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
  );

  Future<void> refresh() async {
    await Future.delayed(const Duration(seconds: 2));
  }

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
            //TODO: Logic
            MainPageInfoWidget(
              title: context.text.homePageWidgetGood,
              subtitle: context.text.homePageWidgetSubTitle,
              points: context.text.homePageWidgetPoints(2040),
              color: BBColors.greenStatus,
            ),
            Text(
              context.text.homePageTodaySession,
              style: headerStyle,
            ),
            SizedBox(height: 15.h),
            const CircularChartWidget(
              goodMinutes: 160,
              badMinutes: 100,
              breakMinutes: 50,
            ),
            const HomePageBottomStats(
              goodMinutes: 160,
              badMinutes: 100,
              breakMinutes: 50,
            ),
          ],
        ),
      ),
    );
  }
}
