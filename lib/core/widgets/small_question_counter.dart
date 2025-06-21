import 'package:flutter/material.dart';
import 'package:programming_questions/core/theme/dimens.dart';

class SmallQuestionCounter extends StatelessWidget {
  const SmallQuestionCounter({super.key, required this.index, required this.i});

  final int index;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: AppDimens.d40,
        height: AppDimens.d15,
        child: Card(color: (index >= i) ? Colors.green : Colors.grey),
      ),
    );
  }
}
