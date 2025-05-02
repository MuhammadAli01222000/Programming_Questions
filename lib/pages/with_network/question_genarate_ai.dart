import 'package:programming_questions/core/widgets/app_bar.dart';
import 'package:programming_questions/core/theme/theme.dart';
import 'package:programming_questions/pages/erro_page.dart';
import 'package:programming_questions/pages/home.dart';
import 'package:programming_questions/pages/with_network/network_provider.dart';
import '../../core/widgets/app_button.dart';
import '../../model/question_model.dart';

List<QuestionModel> result = [];

class QuestionGenarateAi extends StatefulWidget {
  const QuestionGenarateAi({super.key});

  @override
  State<QuestionGenarateAi> createState() => _QuestionGenarateAiState();
}

class _QuestionGenarateAiState extends State<QuestionGenarateAi> {
  late Future<List<QuestionModel>> _futureQuestions;
  int count = 0;
  bool last = false;
  @override
  void initState() {
    super.initState();
    _futureQuestions =
        Provider.of<NetworkStatus>(
          context,
          listen: false,
        ).generateContentWithGemini();
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    final network = Provider.of<NetworkStatus>(context);
    // final correct = result[count].correctAnswer;

    // internet bor yoki yoqligi
    if (!network.hasConnection) {
      return const NoInternetPage();
    }
    return Scaffold(
      appBar: appBar(context),
      backgroundColor: AppColors.backroundColor,
      body: Padding(
        padding: AppDimens.p8,
        child: FutureBuilder<List<QuestionModel>>(
          future: _futureQuestions,
          builder: (context, snapshot) {
            /// load
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.white),
              );
            }
            // eroor
            else if (snapshot.hasError) {
              return Center(child: Text("Xato yuz berdi: ${snapshot.error}"));
            }
            // Ma'lumotlar mavjud bo‘lsa
            else if (snapshot.hasData) {
              final result = snapshot.data!;

              if (result.length < 20) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.white),
                );
              }

              int length = result.length;

              return Padding(
                padding: AppDimens.p16,
                child: Column(
                  children: [
                    LanguageTextWidget(
                      languageText: selectedLanguage.toUpperCase(),
                    ),

                    CountQuestionText(index: count + 1, length: length),
                    SizedBox(
                      height: AppDimens.d25,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (int i = 0; i < length; i++)
                            SmallquestionCounter(index: count, i: i),
                        ],
                      ),
                    ),
                    last != true
                        ? Text(
                          result[count].question,
                          style: AppTextStyle.questionsText,
                        )
                        : const Text(''),

                    appProvider.showLink
                        ? Padding(
                          padding: AppDimens.p4,
                          child: OutlinedButton(
                            onPressed: () => openUrl(result[count].infoLink),
                            child: const Text(
                              "Batafsil o‘qish",
                              style: AppTextStyle.infoButton,
                            ),
                          ),
                        )
                        : const SizedBox(height: 56),
                    ...result[count].variant.map((v) {
                      return last != true
                          ? Padding(
                            padding: AppDimens.p8,
                            child: SizedBox(
                              width: AppDimens.d300,
                              height: AppDimens.d60,
                              child: OutlinedButton(
                                style: AppButtonStyle.selectButtonStyle,
                                onPressed: () {
                                  setState(() {
                                    // check answer
                                    setState(() {
                                      if (v == result[count].correctAnswer) {
                                        appProvider.correctAnswers++;
                                      } else {
                                        appProvider.wrong++;
                                      }
                                      count++;

                                      if (count >= result.length) {
                                        last = true;
                                        // appProvider.correctAnswers = 0;
                                        //appProvider.wrong = 0;
                                        count =
                                            result.length -
                                            1; // countni oxirgi elementga tenglashtirish
                                      }
                                    });
                                  });
                                },
                                child: Text(
                                  v,
                                  style: AppTextStyle.questionsText,
                                ),
                              ),
                            ),
                          )
                          : const SizedBox();
                    }).toList(),

                    const SizedBox(height: 74),
                    const ResultPageButton(),
                  ],
                ),
              );
            } else {
              return const Center(child: Text("Natijalar topilmadi"));
            }
          },
        ),
      ),
    );
  }
}
