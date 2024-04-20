import 'localizations.dart';

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Back Buddy';

  @override
  String homePageWelcomeText(String name) {
    return 'Cześć, $name!';
  }

  @override
  String get homePageTodaySession => 'Dzisiejsza sesja';

  @override
  String get homePageGoodPosture => 'Dobra postura';

  @override
  String get homePageBadPosture => 'Zła postura';

  @override
  String get homePageBreakTime => 'Czas przerwy';

  @override
  String get homePageWidgetGood => 'Twoja postawa jest świetna, tak trzymaj!';

  @override
  String get homePageWidgetOK => 'Twoja postawa jest w porządku, ale zawsze może być lepiej!';

  @override
  String get homePageWidgetBad => 'Twoja postawa wymaga poprawy. Rozważ wprowadzenie pewnych zmian.';

  @override
  String get homePageWidgetSubTitle => 'Dzisiaj zdobyłeś już';

  @override
  String homePageWidgetPoints(int points) {
    return '$points punktów';
  }

  @override
  String get februaryShort => 'Lut';

  @override
  String get marchShort => 'Mar';

  @override
  String get aprilShort => 'Kwi';

  @override
  String get points => 'punkty';
}
