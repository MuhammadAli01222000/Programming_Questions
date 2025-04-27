import 'package:flutter/material.dart';
import 'package:programming_questions/core/config/app_routes_name.dart';
import 'package:programming_questions/pages/questions.dart';
import 'package:programming_questions/pages/result.dart';

sealed class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
        AppRoutesName.questionsScreen: (context) => const Questions(),
        AppRoutesName.resultScreen: (context) => const ResultScreen(),
      };
  static void back(context) => Navigator.pop(context);
}
