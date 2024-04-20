import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_app/config/colors.dart';

class CircularChartWidget extends StatelessWidget {
  const CircularChartWidget({
    super.key,
    required this.goodMinutes,
    required this.badMinutes,
    required this.breakMinutes,
  });

  final double goodMinutes;
  final double badMinutes;
  final double breakMinutes;

  String minutesToHours(double totalMinutes) {
    // Convert total minutes to hours and minutes
    int hours = totalMinutes ~/ 60;
    int minutes = totalMinutes.toInt() % 60;

    // Format hours and minutes as strings with leading zeros if necessary
    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    return '$hoursStr:$minutesStr h';
  }

  @override
  Widget build(BuildContext context) {
    List<CircularStackEntry> data = <CircularStackEntry>[
      CircularStackEntry(
        <CircularSegmentEntry>[
          CircularSegmentEntry(goodMinutes, BBColors.greenStatus,
              rankKey: 'Good posture'),
          CircularSegmentEntry(badMinutes, BBColors.pinkStatus,
              rankKey: 'Bad posture'),
          CircularSegmentEntry(breakMinutes, BBColors.deepPurple,
              rankKey: 'Break time'),
        ],
        rankKey: 'Quality time',
      ),
    ];
    final GlobalKey<AnimatedCircularChartState> chartKey =
        GlobalKey<AnimatedCircularChartState>();

    return Center(
      child: AnimatedCircularChart(
        key: chartKey,
        size: Size(120.w, 120.w),
        initialChartData: data,
        holeLabel: minutesToHours(goodMinutes + badMinutes + breakMinutes),
        labelStyle: TextStyle(
            color: BBColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp),
      ),
    );
  }
}
