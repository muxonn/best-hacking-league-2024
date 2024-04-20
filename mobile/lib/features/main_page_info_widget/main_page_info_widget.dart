import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_app/config/colors.dart';

class MainPageInfoWidget extends StatelessWidget {
  const MainPageInfoWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.points});

  final String title;
  final String subtitle;
  final String points;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.h, bottom: 30.h),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: BBColors.deepPurple,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      width: double.infinity,
      height: 100.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: BBColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2.h),
                RichText(
                  softWrap: true,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: BBColors.white,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: subtitle),
                      const TextSpan(text: " "),
                      TextSpan(
                          text: points,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Image.asset("assets/img/Podcast.png"),
          ),
        ],
      ),
    );
  }
}
