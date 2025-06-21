import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_uz.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi'),
    Locale('ru'),
    Locale('uz'),
    Locale('zh')
  ];

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @question.
  ///
  /// In en, this message translates to:
  /// **'Question'**
  String get question;

  /// No description provided for @quiz.
  ///
  /// In en, this message translates to:
  /// **'Quiz'**
  String get quiz;

  /// No description provided for @python.
  ///
  /// In en, this message translates to:
  /// **'Python'**
  String get python;

  /// No description provided for @java.
  ///
  /// In en, this message translates to:
  /// **'Java'**
  String get java;

  /// No description provided for @javaScript.
  ///
  /// In en, this message translates to:
  /// **'JavaScript'**
  String get javaScript;

  /// No description provided for @dart.
  ///
  /// In en, this message translates to:
  /// **'Dart'**
  String get dart;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select a programming language'**
  String get selectLanguage;

  /// No description provided for @selectLevel.
  ///
  /// In en, this message translates to:
  /// **'Select your level'**
  String get selectLevel;

  /// No description provided for @levelJunior.
  ///
  /// In en, this message translates to:
  /// **'Junior'**
  String get levelJunior;

  /// No description provided for @levelMiddle.
  ///
  /// In en, this message translates to:
  /// **'Middle'**
  String get levelMiddle;

  /// No description provided for @levelSenior.
  ///
  /// In en, this message translates to:
  /// **'Senior'**
  String get levelSenior;

  /// No description provided for @infoDart.
  ///
  /// In en, this message translates to:
  /// **'Dart is a modern and fast programming language used for Flutter development.'**
  String get infoDart;

  /// No description provided for @infoJava.
  ///
  /// In en, this message translates to:
  /// **'Java is one of the most widely used programming languages in the world.'**
  String get infoJava;

  /// No description provided for @infoJavaScript.
  ///
  /// In en, this message translates to:
  /// **'JavaScript is an interactive programming language used for the web.'**
  String get infoJavaScript;

  /// No description provided for @infoPython.
  ///
  /// In en, this message translates to:
  /// **'Python is widely used in data analysis, artificial intelligence, and robotics.'**
  String get infoPython;

  /// No description provided for @resultPage.
  ///
  /// In en, this message translates to:
  /// **'View Results'**
  String get resultPage;

  /// No description provided for @correct.
  ///
  /// In en, this message translates to:
  /// **'Correct'**
  String get correct;

  /// No description provided for @wrong.
  ///
  /// In en, this message translates to:
  /// **'Incorrect'**
  String get wrong;

  /// No description provided for @result.
  ///
  /// In en, this message translates to:
  /// **'Your result'**
  String get result;

  /// No description provided for @info.
  ///
  /// In en, this message translates to:
  /// **'Read more'**
  String get info;

  /// No description provided for @withAi.
  ///
  /// In en, this message translates to:
  /// **'Questions generated with AI'**
  String get withAi;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'hi', 'ru', 'uz', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'hi': return AppLocalizationsHi();
    case 'ru': return AppLocalizationsRu();
    case 'uz': return AppLocalizationsUz();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
