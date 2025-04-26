import 'package:flutter/material.dart';
import 'package:programming_questions/core/theme/text_style.dart';

class LanguageTextWidget extends StatelessWidget {
  final String languageText;
  const LanguageTextWidget({super.key, required this.languageText});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(languageText, style: AppTextStyle.programmingLanguageText),
    );
  }
}
