import 'package:programming_questions/core/theme/theme.dart';
class LanguageController extends ChangeNotifier {
  static const uz = Locale('uz');
  static const en = Locale('en');
  static const ru = Locale('ru');
  static const zh = Locale('zh');
  static const hi = Locale('hi');

  Locale _currentLocale;

  LanguageController(this._currentLocale);

  Locale get currentLocale => _currentLocale;

  void changeLocal(Locale newLocale) {
    print(newLocale.countryCode);
    _currentLocale = newLocale;
    notifyListeners();
  }
}
