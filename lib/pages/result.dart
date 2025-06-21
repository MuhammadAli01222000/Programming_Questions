import 'dart:ui';
import 'package:programming_questions/core/theme/theme.dart';
import 'package:programming_questions/pages/with_network/question_genarate_ai.dart';

import '../core/widgets/glass_card.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    int result = appProvider.correctAnswers * 5;

    return Scaffold(
      backgroundColor: AppColors.backroundColor,
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0f2027), Color(0xFF203a43), Color(0xFF2c5364)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 50),

                GlassCard(text: "${AppLocalizations.of(context)?.result} $result%"),
                const SizedBox(height: 40),
                GlassButton(
                  text: "${AppLocalizations.of(context)?.correct} ${appProvider.correctAnswers}",
                  color: Colors.green,
                ),
                const SizedBox(height: 20),
                GlassButton(
                  text: "${AppLocalizations.of(context)?.wrong} ${appProvider.wrong}",
                  color: Colors.red,
                ),
                const SizedBox(height: 20),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (BuildContext context) =>
                                const QuestionGenerateAi(),
                      ),
                    );
                  },
                  child: GestureDetector(
                    onTap: () {
                      appProvider.correctAnswers = 0;
                      appProvider.wrong = 0;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (BuildContext context) =>
                                  const QuestionGenerateAi(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.blue,Colors.red, ],
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          tileMode: TileMode.repeated,
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      width: 350,
                      height: 50,
                      child:  Center(
                        child: Text(
                          "${AppLocalizations.of(context)?.withAi}",
                          style: AppTextStyle.languageText,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    backgroundColor: Colors.deepPurpleAccent,
                    child: const Icon(Icons.home, color: AppColors.white),
                    onPressed: () {
                      /// screen da clear qilish
                      appProvider.reset();

                    context.goNamed(AppRouteName.splash);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GlassCard extends StatelessWidget {
  final String text;

  const GlassCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          width: double.infinity,
          height: 150,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 26,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
