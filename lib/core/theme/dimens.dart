import 'package:flutter/material.dart';
sealed class AppDimens {
  static const d8 = 8.0;

  static const d12 = 12.0;
  static const d15 = 15.0;
  static const d16 = 16.0;
  static const d20 = 20.0;

  static const d25 = 25.0;
  static const d30 = 30.0;
  static const d35 = 35.0;

  static const d40 = 40.0;

  static const d50 = 50.0;
  static const d60 = 65.0;
  static const d90 = 90.0;

  static const d100 = 100.0;

  static const d150 = 150.0;
  static const d250 = 250.0;
  static const d300 = 300.0;
  static const d400 = 400.0;

  /// padding
  static const p16 = EdgeInsets.all(AppDimens.d16);
  static const p8 = EdgeInsets.all(AppDimens.d8);
  static const p4 = EdgeInsets.all(4);
  static const p25=EdgeInsetsGeometry.only(left: 25);
  static const p24p20=  EdgeInsets.symmetric(
    horizontal: 24,
    vertical: 20,
  );

  /// margin
  static const m20 = EdgeInsets.symmetric(vertical: d20);
  static const m32= EdgeInsets.symmetric(horizontal: 32);

  /// circular
  static final c16 = BorderRadius.circular(AppDimens.d16);

  static final c20 = BorderRadius.circular(AppDimens.d20);

  static final c30 = BorderRadius.circular(AppDimens.d30);

  /// height
  static const h30 = SizedBox(height: 30);
  static const h20 = SizedBox(height: 20);

  static const h100 = SizedBox(height: 100);
  static const h300 = Size.fromHeight(320);
}
