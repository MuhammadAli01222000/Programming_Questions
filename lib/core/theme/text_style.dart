import 'package:programming_questions/core/theme/theme.dart';

sealed class AppTextStyle {
  static const bigText = TextStyle(
    fontSize: AppDimens.d40,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
  static const questionsText = TextStyle(
    fontSize: AppDimens.d16,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
  static const smallText = TextStyle(
    fontSize:18,
    color: AppColors.white,
  );
  static const bigNumber = TextStyle(
    fontSize: AppDimens.d50,
    fontWeight: FontWeight.bold,
  );
  static const programmingLanguageText = TextStyle(
    fontSize: AppDimens.d20,
    fontWeight: FontWeight.w400,
    color: Color.fromARGB(255, 80, 74, 74),
  );

  static const greyNumber = TextStyle(
    fontSize: AppDimens.d40,
    fontWeight: FontWeight.w400,
    color: Color.fromARGB(255, 59, 57, 57),
  );
  static const infoButton = TextStyle(
    color: Colors.blueAccent,
    decoration: TextDecoration.underline,
  );

  static const languageText = TextStyle(
    fontSize: 22,

    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const tanlash = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const pl = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
}
