import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_app/config/colors.dart';
import 'package:office_app/views/main_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.only(
          top: 60,
          bottom: 30,
          left: 30.w,
          right: 30.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: 100.sp,
                child: Image.asset("assets/img/main-logo.png"),
              ),
            ),
            const SizedBox(height: 30),
            Wrap(
              runSpacing: 10,
              //TODO: Add forms logic
              children: [
                TextFormField(
                  cursorColor: BBColors.lightPurple,
                  style: TextStyle(color: BBColors.white),
                  decoration: const InputDecoration(hintText: "Email"),
                ),
                TextFormField(
                  cursorColor: BBColors.lightPurple,
                  style: TextStyle(color: BBColors.white),
                  decoration: const InputDecoration(hintText: "Password"),
                  obscureText: true,
                ),
              ],
            ),
            const SizedBox(height: 60),
            SizedBox(
              width: 200.w,
              //TODO: Add login logic
              child: ElevatedButton(
                onPressed: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: MainPage(),
                    withNavBar: false, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
                child: Text(
                  "Log In",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
