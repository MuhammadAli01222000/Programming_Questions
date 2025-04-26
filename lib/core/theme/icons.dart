import 'package:flutter/material.dart';
import 'package:programming_questions/core/theme/theme.dart';

sealed class AppIcons {
  static const home = Icon(
    Icons.home,
    color: AppColors.white,
    size: AppDimens.d35,
  );

  static const link = Icon(
    Icons.lightbulb,
    color: AppColors.yellow,
    size: AppDimens.d35,
  );

  static const linkOff = Icon(
    Icons.lightbulb,
    color: Colors.grey,
    size: AppDimens.d35,
  );
}
