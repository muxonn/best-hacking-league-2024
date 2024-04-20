import 'localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Back Buddy';

  @override
  String homePageWelcomeText(String name) {
    return 'Hello, $name';
  }

  @override
  String get homePageTodaySession => 'Today\'s session';

  @override
  String get homePageGoodPosture => 'Good posture';

  @override
  String get homePageBadPosture => 'Bad posture';

  @override
  String get homePageBreakTime => 'Break time';
}
