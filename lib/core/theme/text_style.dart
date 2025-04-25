import 'package:flutter/material.dart';
import 'package:programming_questions/core/theme/colors.dart';
import 'package:programming_questions/core/theme/dimens.dart';
import 'package:programming_questions/pages/questions.dart';

sealed class AppTextStyle {
  static const bigText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
  static const questionsText = TextStyle(
    fontSize: AppDimens.d15,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
}
