import 'package:flutter/material.dart';
import 'package:programming_questions/core/config/app_routes.dart';
import 'package:programming_questions/pages/home.dart';
import 'package:programming_questions/pages/splash_screen.dart';

class ProgrammingQuestions extends StatelessWidget {
  const ProgrammingQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
