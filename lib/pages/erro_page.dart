import 'package:programming_questions/core/theme/theme.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Internet ulanmagan",
              style: AppTextStyle.programmingLanguageText,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Qayta urinib ko‘rish"),
            ),
          ],
        ),
      ),
    );
  }
}
