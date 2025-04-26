import 'package:flutter/material.dart';
import 'package:programming_questions/core/theme/dimens.dart';
import 'package:programming_questions/core/theme/text_style.dart';
import 'package:programming_questions/model/question_model.dart';

class Savollar extends StatelessWidget {
  const Savollar({super.key, required this.item});

  final QuestionModel item;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        margin: AppDimens.m20,
        child: SizedBox(
          width: AppDimens.d300,
          height: AppDimens.d100,
          child: Center(
            child: Text(item.question, style: AppTextStyle.questionsText),
          ),
        ),
      ),
    );
  }
}
