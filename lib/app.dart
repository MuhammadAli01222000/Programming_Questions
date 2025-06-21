import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:programming_questions/core/config/app_routes.dart';
import 'package:programming_questions/pages/splash_screen.dart';
import 'package:programming_questions/pages/with_network/network_provider.dart';
import 'package:programming_questions/provider/app_provider.dart';
import 'package:programming_questions/provider/l10n_provider.dart';
import 'package:provider/provider.dart';

import 'core/routes/app_route.dart';
import 'l10n/app_localizations.dart';

class ProgrammingQuestions extends StatelessWidget {
  const ProgrammingQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppProvider()),
        ChangeNotifierProvider(
          create: (context) => LanguageController(Locale("en")),
        ),
        ChangeNotifierProvider(create: (_) => NetworkStatus()),
      ],
      child: Consumer<LanguageController>(
        builder: (context, langController, _) {
          return MaterialApp.router(
            routerConfig: AppRoutes.routes,
            locale: langController.currentLocale,
            supportedLocales: const [
              Locale('en'),
              Locale('ru'),
              Locale('zh'),
              Locale('uz'),
              Locale('hi'),
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
