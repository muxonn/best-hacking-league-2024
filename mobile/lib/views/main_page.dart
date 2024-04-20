import 'package:flutter/material.dart';
import 'package:office_app/config/l10n/extensions.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(context.text.homePageTodaySession),
      ),
    );
  }
}
