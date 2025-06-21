import 'package:programming_questions/core/theme/theme.dart';
class CountQuestionText extends StatelessWidget {
  const CountQuestionText({
    super.key,
    required this.index,
    required this.length,
  });

  final int index;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          children: [
            const TextSpan(
              text: "${AppStrings.quetion}",
              style: AppTextStyle.bigText,
            ),
            TextSpan(text: " $index", style: AppTextStyle.bigNumber),
            TextSpan(text: "/$length", style: AppTextStyle.greyNumber),
          ],
        ),
      ),
    );
  }
}
