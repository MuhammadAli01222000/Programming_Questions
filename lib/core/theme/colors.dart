import 'package:flutter/material.dart';

sealed class AppColors {
  static const backroundColor = Color(0xFF0B2545);

  /// splash screen color
  static const black = Color.fromARGB(255, 39, 34, 34);
  static const white = Color.fromARGB(255, 246, 239, 239);
  static const white70 = Colors.white70;
  static const green = Color.fromARGB(255, 42, 201, 124);
  static const blue = Color.fromARGB(255, 24, 193, 226);
  static const yellow = Colors.yellowAccent;
  static const red = Colors.redAccent;

  /// button color
  static const tranparent = Colors.transparent;
  static const mCard = Color(0xFF89CFF0);
  static const homeCard = Color(0xFF00C896);
  static const colorList = [
    Color.fromARGB(255, 30, 209, 179),
    Color.fromARGB(255, 88, 170, 207),

    Color.fromARGB(255, 249, 209, 50),
    Color.fromARGB(255, 49, 219, 191),
  ];

  /// text style
  static const colorButton = [
    Colors.greenAccent,
    Colors.amberAccent,
    Colors.redAccent,
  ];
}

class AppThemeLightAndDark {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.blue,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.mCard,
      foregroundColor: AppColors.tranparent,
    ),
    textTheme: const TextTheme(bodyMedium: TextStyle(color: AppColors.white)),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backroundColor,
    primaryColor: Colors.deepPurple,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
  );
}
