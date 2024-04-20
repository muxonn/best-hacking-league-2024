import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_app/config/l10n/localizations.dart';
import 'package:office_app/config/theme.dart';
import 'package:office_app/features/languages/cubit/language_cubit.dart';
import 'package:office_app/features/languages/data/languages.dart';
import 'package:office_app/views/main_page.dart';

void main() {
  runApp(const MainApp());

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubit(),
      child: ScreenUtilInit(
        designSize: const Size(320, 568),
        minTextAdapt: true,
        splitScreenMode: true,
        child: BlocBuilder<LanguageCubit, BBLanguages>(
          builder: (context, state) {
            return MaterialApp(
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              // Handle language change
              locale: state == BBLanguages.en
                  ? const Locale('en')
                  : const Locale('pl'),
              home: const MainPage(),
              theme: BBTheme.theme,
              debugShowCheckedModeBanner: false,
            );
          },
        ),
      ),
    );
  }
}
