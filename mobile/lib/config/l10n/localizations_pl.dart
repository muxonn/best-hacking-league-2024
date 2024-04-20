import 'localizations.dart';

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Back Buddy';

  @override
  String homePageWelcomeText(String name) {
    return 'Cześć, $name';
  }

  @override
  String get homePageTodaySession => 'Dzisiejsza sesja';

  @override
  String get homePageGoodPosture => 'Dobra postura';

  @override
  String get homePageBadPosture => 'Zła postura';

  @override
  String get homePageBreakTime => 'Czas przerwy';
}
