import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_app/config/colors.dart';

class PodiumTile extends StatelessWidget {
  const PodiumTile({super.key, required this.name, required this.points});

  final String name;
  final int points;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: BBColors.white,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3.sp, vertical: 2.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: BBColors.lightPurple,
          ),
          child: Text(
            points.abs().toString(),
            style: TextStyle(
              color: BBColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
