import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_app/config/colors.dart';
import 'package:office_app/config/constants/sizes.dart';
import 'package:office_app/config/l10n/extensions.dart';
import 'package:office_app/features/application/current_user/cubit/current_user_cubit.dart';
import 'package:office_app/features/application/current_user/current_user_repository.dart';
import 'package:office_app/features/application/current_user/models/current_user.dart';

import 'package:office_app/features/circular_chart/circular_chart_widget.dart';
import 'package:office_app/features/home_page_bottom_stats/widgets/home_page_bottom_stats.dart';
import 'package:office_app/features/main_page_info_widget/main_page_info_widget.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  static final headerStyle = TextStyle(
    color: BBColors.black,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
  );

  CurrentUser? getState(CurrentUserCubitState state) {
    if (state is CurrentUserCubitLoaded) {
      return state.user;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    useMemoized(() {
      Timer.periodic(
        Duration(seconds: 10),
        (timer) async {
          context.read<CurrentUserCubit>().fetchCurrentUser();
        },
      );
    });

    return Scaffold(
      backgroundColor: BBColors.white,
      body: BlocBuilder<CurrentUserCubit, CurrentUserCubitState>(
        builder: (context, state) {
          final currentState = getState(state);

          return state is CurrentUserCubitLoaded
              ? Padding(
                  padding: BBSizes.mainPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.text.homePageWelcomeText("Francesco"),
                        style: headerStyle,
                      ),
                      //TODO: Logic
                      buildMainPageInfo(context, currentState!.currentPosture,
                          currentState.points),
                      Text(
                        context.text.homePageTodaySession,
                        style: headerStyle,
                      ),
                      SizedBox(height: 15.h),
                      CircularChartWidget(
                        goodMinutes: currentState.goodTime,
                        badMinutes: currentState.badTime,
                        breakMinutes: currentState.breakTime,
                      ),
                      HomePageBottomStats(
                        goodMinutes: currentState.goodTime,
                        badMinutes: currentState.badTime,
                        breakMinutes: currentState.breakTime,
                      ),
                    ],
                  ),
                )
              : Center(
                  child: Container(
                    height: 110,
                    width: 200,
                    child: Center(
                      child:
                          CircularProgressIndicator(color: Colors.deepPurple),
                    ),
                  ),
                );
        },
      ),
    );
  }

  Widget buildMainPageInfo(BuildContext context, String posture, int points) {
    if (posture == "correct") {
      return MainPageInfoWidget(
        title: context.text.homePageWidgetGood,
        subtitle: context.text.homePageWidgetSubTitle,
        points: context.text.homePageWidgetPoints(points),
        color: BBColors.greenStatus,
      );
    }

    if (posture == "incorrect") {
      return MainPageInfoWidget(
        title: context.text.homePageWidgetBad,
        subtitle: context.text.homePageWidgetSubTitle,
        points: context.text.homePageWidgetPoints(points),
        color: BBColors.pinkStatus,
      );
    }

    return MainPageInfoWidget(
      title: context.text.homePageWidgetBreakTime,
      subtitle: context.text.homePageWidgetSubTitle,
      points: context.text.homePageWidgetPoints(points),
      color: BBColors.deepPurple,
    );
  }
}
