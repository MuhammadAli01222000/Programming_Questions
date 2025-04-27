import 'package:programming_questions/core/theme/theme.dart';

int correct = 0;

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final dataController = appProvider.dataController;
    final length = dataController.items.length;

    if (length == 0) {
      return const Scaffold(
        backgroundColor: AppColors.backroundColor,
        body: Center(child: Text("Savollar topilmadi")),
      );
    }

    final item = dataController.items[appProvider.questionIndex];

    return Scaffold(
      appBar: appBar(context),
      backgroundColor: AppColors.backroundColor,
      body: Padding(
        padding: AppDimens.p16,
        child: Column(
          children: [
            const LanguageTextWidget(languageText: AppStrings.dart),
            CountQuestionText(
              index: appProvider.questionIndex + 1,
              length: length,
            ),
            SizedBox(
              height: AppDimens.d50,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < length; i++)
                    SmallquestionCounter(
                      index: appProvider.questionIndex,
                      i: i,
                    ),
                ],
              ),
            ),
            Savollar(item: item),
            appProvider.showLink
                ? Padding(
                  padding: AppDimens.p8,
                  child: OutlinedButton(
                    onPressed: () => openUrl(item.infoLink),
                    child: const Text(
                      "Batafsil o‘qish",
                      style: AppTextStyle.infoButton,
                    ),
                  ),
                )
                : const Padding(
                  padding: AppDimens.p8,
                  child: SizedBox(height: AppDimens.d50),
                ),

            ...item.variants.map((v) {
              return Padding(
                padding: AppDimens.p8,
                child: SizedBox(
                  width: AppDimens.d300,
                  height: AppDimens.d50,
                  child: OutlinedButton(
                    style: AppButtonStyle.selectButtonStyle,
                    onPressed: () {
                      appProvider.checkAnswerAndIncrementIndex(
                        dataController
                            .items[appProvider.questionIndex]
                            .variants,
                        dataController
                            .items[appProvider.questionIndex]
                            .correctAnswer,
                      );
                    },
                    child: Text(v, style: AppTextStyle.questionsText),
                  ),
                ),
              );
            }),
            AppDimens.h30,
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutesName.resultScreen);
              },
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.green),
              ),
              child: const Center(
                child: Text('Result page', style: AppTextStyle.languageText),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    return AppBar(
      leading: IconButton(
        onPressed: () => AppRoutes.back(context),
        icon: const Icon(Icons.arrow_back, color: AppColors.white),
      ),
      backgroundColor: AppColors.backroundColor,
      actions: [
        IconButton(
          onPressed: () {
            appProvider.toggleShowLink();
          },
          icon: appProvider.showLink ? AppIcons.link : AppIcons.linkOff,
        ),
      ],
    );
  }
}
