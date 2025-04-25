import 'package:flutter/material.dart';
import 'package:programming_questions/core/theme/colors.dart';

sealed class AppTextStyle {
  static const bigText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
}
