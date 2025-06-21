import 'package:programming_questions/core/theme/theme.dart';
import 'package:programming_questions/pages/result.dart';
import 'package:programming_questions/pages/splash_screen.dart';

import '../../pages/error_page.dart';

sealed class AppRoutes{
  static final routes=GoRouter(
    errorBuilder: (context, state) {
      return const NoInternetPage();
    },
      initialLocation: AppRoutePath.splash,
      routes: [
        GoRoute(path: AppRoutePath.splash,name: AppRouteName.splash,builder: (context,state)=> const SplashPage()),
        GoRoute(path: AppRoutePath.error,name: AppRouteName.error,builder: (context,state)=> const NoInternetPage()),
        GoRoute(path: AppRoutePath.result,name: AppRouteName.result,builder: (context,state)=> const ResultScreen()),
        GoRoute(path: AppRoutePath.question,name: AppRouteName.question,builder: (context,state)=> const Questions()),
        GoRoute(path: AppRoutePath.questionsWithAi,name: AppRouteName.questionsWithAi,builder: (context,state)=> const Questions()),
    GoRoute(
      path: AppRoutePath.home,
      name: AppRouteName.home,
      builder: (context, state) {
        final index = int.tryParse(state.pathParameters['index'] ?? '0') ?? 0;
        return Home(selectedIndex: index);
      },
    ),

      ]);
}