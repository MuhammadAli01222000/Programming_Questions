import 'package:flutter/material.dart';
import 'package:programming_questions/core/theme/colors.dart';

bool? value;

class AppCheckButton extends StatefulWidget {
  AppCheckButton({super.key});

  @override
  State<AppCheckButton> createState() => _AppCheckButtonState();
}

class _AppCheckButtonState extends State<AppCheckButton> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      shape: CircleBorder(),
      activeColor: AppColors.green,

      value: value,
      onChanged: (check) {
        check = value;
        setState(() {});
      },
    );
  }
}
