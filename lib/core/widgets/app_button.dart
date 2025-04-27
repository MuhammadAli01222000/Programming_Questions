import 'package:programming_questions/core/theme/theme.dart';

class ResultPageButton extends StatelessWidget {
  const ResultPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutesName.resultScreen);
      },
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.green),
      ),
      child: const Center(
        child: Text('Result page', style: AppTextStyle.languageText),
      ),
    );
  }
}
