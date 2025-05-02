import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:programming_questions/core/config/app_routes.dart';
import 'package:programming_questions/l10n/locales/l10.dart';
import 'package:programming_questions/pages/splash_screen.dart';
import 'package:programming_questions/pages/with_network/network_provider.dart';
import 'package:programming_questions/provider/app_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class ProgrammingQuestions extends StatelessWidget {
  const ProgrammingQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppProvider()),
        ChangeNotifierProvider(create: (_) => NetworkStatus()),
      ],
      child: MaterialApp(
        routes: AppRoutes.routes,
        supportedLocales: const [
          Locale('en'),
          Locale('zh'),
          Locale('uz'),
          Locale('hi'),
        ],
        localizationsDelegates: const [
          //  AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: Locale('en'),
        debugShowCheckedModeBanner: false,
        home: const SplashPage(),
      ),
    );
  }
}
