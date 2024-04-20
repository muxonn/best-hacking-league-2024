import 'localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Back Buddy';

  @override
  String homePageWelcomeText(String name) {
    return 'Hello, $name!';
  }

  @override
  String get homePageTodaySession => 'Today\'s session';

  @override
  String get homePageGoodPosture => 'Good posture';

  @override
  String get homePageBadPosture => 'Bad posture';

  @override
  String get homePageBreakTime => 'Break time';

  @override
  String get homePageWidgetGood => 'Your posture is great, keep it up!';

  @override
  String get homePageWidgetOK => 'Your posture is fine, but it could always be better!';

  @override
  String get homePageWidgetBad => 'Your posture needs improvement. Consider making some adjustments';

  @override
  String get homePageWidgetSubTitle => 'Today you\'ve already earned';

  @override
  String homePageWidgetPoints(int points) {
    return '$points points';
  }

  @override
  String get februaryShort => 'Feb';

  @override
  String get marchShort => 'Mar';

  @override
  String get aprilShort => 'Apr';

  @override
  String get points => 'points';
}
