import 'package:flutter/material.dart';
import 'package:programming_questions/core/config/app_routes.dart';
import 'package:programming_questions/pages/splash_screen.dart';
import 'package:programming_questions/pages/with_network/network_provider.dart';
import 'package:programming_questions/provider/app_provider.dart';
import 'package:provider/provider.dart';

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
        //themeMode: ThemeMode.,
        routes: AppRoutes.routes,
        debugShowCheckedModeBanner: false,
        home: const SplashPage(),
      ),
    );
  }
}
