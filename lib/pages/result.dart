import 'package:programming_questions/core/theme/theme.dart';
import 'package:programming_questions/pages/splash_screen.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const SplashPage(),
            ),
          );
        },
        child: const Icon(Icons.home),
      ),
      appBar: _appBar(appProvider),
      backgroundColor: AppColors.backroundColor,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppDimens.h100,
          ResultShow(
            count: appProvider.correctAnswers,
            color: AppColors.green,
            name: 'Correct',
          ),
          AppDimens.h30,
          ResultShow(
            count: appProvider.wrong,
            color: AppColors.red,
            name: 'Wrong',
          ),

          AppDimens.h100,
        ],
      ),
    );
  }

  PreferredSize _appBar(AppProvider appProvider) {
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
            Padding(
              padding: const EdgeInsets.all(80.0),
              child: Text(
                "Quiz result ${appProvider.correctAnswers}",
                style: AppTextStyle.languageText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultShow extends StatelessWidget {
  final int count;
  final Color color;
  final String name;
  const ResultShow({
    super.key,
    required this.count,
    required this.color,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: AppDimens.d300,
        height: AppDimens.d60,
        child: Card(
          color: color,
          child: Center(
            child: Text("$name $count", style: AppTextStyle.languageText),
          ),
        ),
      ),
    );
  }
}
