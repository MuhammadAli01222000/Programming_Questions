import 'package:flutter/material.dart';

sealed class AppDimens {
  static const d12 = 12.0;
  static const d15 = 15.0;
  static const d16 = 16.0;
  static const d20 = 20.0;

  static const d25 = 25.0;
  static const d30 = 30.0;
  static const d35 = 35.0;

  static const d40 = 40.0;

  static const d50 = 50.0;

  static const d150 = 150.0;
  static const d250 = 250.0;
  static const d300 = 300.0;
  static const h250 = Size.fromHeight(350);

  /// padding
  static const p16 = EdgeInsets.all(AppDimens.d16);

  /// margin
  static const m20 = EdgeInsets.symmetric(vertical: d20);
}
