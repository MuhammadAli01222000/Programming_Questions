import 'package:flutter/material.dart';
import 'package:programming_questions/core/widgets/app_bar.dart';
import 'package:provider/provider.dart';
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

  @override
  void initState() {
    super.initState();
    _futureQuestions =
        Provider.of<NetworkStatus>(
          context,
          listen: false,
        ).generateContentWithGemini();
  }
  int count=0;

  @override
  Widget build(BuildContext context) {
    final network = Provider.of<NetworkStatus>(context);
    if (!network.hasConnection) {
      return const NoInternetPage();
    }

    final appProvider = Provider.of<AppProvider>(context);
    final dataController = appProvider.dataController;
    int length = list.length;

    return length!=count? Scaffold(
      appBar: appBar(context),
      backgroundColor: AppColors.backroundColor,
      body: Padding(
        padding: AppDimens.p8,
        child: FutureBuilder<List<QuestionModel>>(
          future: _futureQuestions,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(color: AppColors.white,));
            } else if (snapshot.hasError) {
              return Center(child: Text("Xato yuz berdi: ${snapshot.error}"));
            } else if (snapshot.hasData) {
              final result = snapshot.data!;

              return Padding(
                padding: AppDimens.p16,
                child: Column(
                  children: [
                    LanguageTextWidget(
                      languageText: selectedLanguage.toUpperCase(),
                    ),
                    CountQuestionText(
                      index: count + 1,
                      length: length,
                    ),
                    SizedBox(
                      height: AppDimens.d25,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (int i = 0; i < length; i++)
                            SmallquestionCounter(
                              index: count,
                              i: i,
                            ),
                        ],
                      ),
                    ),
                    last != true ? Text( result[count].question,style: AppTextStyle.questionsText,) : const Text(''),
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
                        : const Padding(
                          padding: AppDimens.p8,
                          child: SizedBox(height: AppDimens.d40),
                        ),

                    // javob
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
                                    count++;
                                  });
                                  if (counter == length) {
                                    last = true;
                                  }
                                },
                                child: Text(
                                  v,
                                  style: AppTextStyle.questionsText,
                                ),
                              ),
                            ),
                          )
                          : const Text('');
                    }),
                    AppDimens.h30,
                    const ResultPageButton(),
                  ],
                ),
              );
            } else {
              return const Center(child: Text("Natija topilmadi"));
            }
          },
        ),
      ),
    ):  Scaffold(appBar: AppBar(), body: Center(child: TextButton(onPressed: (){}, child: Text("Empty list"),),),);
  }
}
