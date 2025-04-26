import 'package:flutter/material.dart';
import 'package:programming_questions/core/theme/theme.dart';

bool? value;

class AppCheckButton extends StatefulWidget {
  final String data;
  final void Function() onTap;
  AppCheckButton({super.key, required this.data, required this.onTap});

  @override
  State<AppCheckButton> createState() => _AppCheckButtonState();
}

class _AppCheckButtonState extends State<AppCheckButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimens.d300,
      height: AppDimens.d50,
      child: OutlinedButton(
        style: AppButtonStyle.selectButtonStyle,
        onPressed: () {
          setState(() {
            index++;
          });
        },
        child: Text(widget.data, style: AppTextStyle.languageText),
      ),
    );
  }
}
