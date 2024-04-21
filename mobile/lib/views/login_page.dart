import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_app/config/colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
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
                child: Image.asset("assets/img/alt-main-logo.png"),
              ),
            ),
            const SizedBox(height: 30),
            Wrap(
              runSpacing: 10,
              //TODO: Add forms logic
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: "Email"),
                ),
                TextFormField(
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
                onPressed: () {},
                child: const Text(
                  "Log In",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
