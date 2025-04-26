import 'package:flutter/material.dart';
import 'package:programming_questions/core/theme/theme.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar());
  }

  PreferredSize _appBar() {
    var scrollController;
    return PreferredSize(
      preferredSize: AppDimens.h300,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: AppColors.green,
          borderRadius: BorderRadius.circular(AppDimens.d30),
        ),
        child: Column(
          children: [
            const SizedBox(height: AppDimens.d50),
            Text("Quiz result $correct", style: AppTextStyle.languageText),
          ],
        ),
      ),
    );
  }
}
