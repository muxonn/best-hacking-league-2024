import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_app/config/colors.dart';
import 'package:office_app/config/constants/sizes.dart';
import 'package:office_app/config/l10n/extensions.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:office_app/features/languages/cubit/language_cubit.dart';
import 'package:office_app/views/login_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BBColors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: BBSizes.mainPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: 100.sp,
                  child: Image.asset("assets/img/alt-main-logo.png"),
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 32.h,
                child: LiteRollingSwitch(
                  onTap: () {},
                  onDoubleTap: () {},
                  onSwipe: () {},
                  onChanged: (p0) {
                    context.read<LanguageCubit>().switchLanguage();
                  },
                  textOn: "PL",
                  colorOn: BBColors.deepPurple,
                  colorOff: BBColors.deepPurple,
                  textOff: "EN",
                  textOnColor: BBColors.white,
                  textOffColor: BBColors.white,
                  iconOn: Icons.south_america,
                  iconOff: Icons.south_america,
                  width: 90.w,
                ),
              ),
              SizedBox(height: 6.h),
              SizedBox(
                height: 32.h,
                width: 90.w,
                child: ElevatedButton(
                  onPressed: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: LoginPage(),
                      withNavBar: false, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    backgroundColor: BBColors.deepPurple,
                    elevation: 0,
                  ),
                  child: Text(
                    context.text.logOut,
                    style: TextStyle(color: BBColors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
