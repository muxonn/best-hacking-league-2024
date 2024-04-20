import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_app/config/colors.dart';
import 'package:office_app/config/constants/sizes.dart';
import 'package:flutter_podium/flutter_podium.dart';
import 'package:office_app/config/l10n/extensions.dart';
import 'package:office_app/features/ranking/person_tile.dart';

class RankingPage extends HookWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTabController(initialLength: 3);
    final index = useState(0);

    //TODO: Add lists
    Widget person = PersonTile(
      position: 1,
      name: "Marek Jędraszewski",
      points: 1250,
    );

    controller.addListener(
      () {
        index.value = controller.index;
      },
    );

    if (index.value == 0) {
      person = PersonTile(
        position: 1,
        name: "Marek Jędraszewski",
        points: 1250,
      );
    } else {
      person = PersonTile(
        position: 2,
        name: "Warek Jędraszewski",
        points: 1250,
      );
    }

    return Scaffold(
      backgroundColor: BBColors.deepPurple,
      body: Padding(
        padding: BBSizes.mainPadding,
        child: Stack(
          children: [
            Column(
              children: [
                Center(
                  child: Text(
                    "Leaderboard",
                    style: TextStyle(
                      color: BBColors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  width: 220.w,
                  child: SegmentedTabControl(
                    controller: controller,
                    backgroundColor: BBColors.lightPurple,
                    tabs: [
                      SegmentTab(
                        label: context.text.februaryShort,
                        selectedTextColor: BBColors.deepPurple,
                        textColor: BBColors.white,
                      ),
                      SegmentTab(
                        label: context.text.marchShort,
                        selectedTextColor: BBColors.deepPurple,
                      ),
                      SegmentTab(
                        label: context.text.aprilShort,
                        selectedTextColor: BBColors.deepPurple,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Podium(
                  firstPosition: Text("1"),
                  secondPosition: Text("2"),
                  thirdPosition: Text("3"),
                  showRankingNumberInsteadOfText: true,
                  color: BBColors.lightPurple,
                  rankingTextColor: BBColors.white,
                  rankingFontSize: 30.sp,
                  height: 130.h,
                  width: 70.w,
                ),
              ],
            ),
            buildBottomModal(person),
          ],
        ),
      ),
    );
  }

  Widget buildBottomModal(Widget person) {
    return DraggableScrollableSheet(
      maxChildSize: 0.8,
      minChildSize: 0.5,
      initialChildSize: 0.5,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: BBColors.dirtyWhite,
            ),
            width: double.infinity,
            child: Wrap(
              runSpacing: 20,
              children: [
                for (int i = 0; i < 6; i++) person,
              ],
            ),
          ),
        );
      },
    );
  }
}
