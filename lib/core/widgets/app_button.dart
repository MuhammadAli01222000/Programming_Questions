import 'package:programming_questions/core/theme/theme.dart';

class ResultPageButton extends StatelessWidget {
  const ResultPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          context.pushNamed( AppRouteName.result);
        },
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(AppColors.green),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimens.d12),
            ),
          ),
        ),
        child: const Center(
          child: Text('Result page', style: AppTextStyle.languageText),
        ),
      ),
    );
  }
}
