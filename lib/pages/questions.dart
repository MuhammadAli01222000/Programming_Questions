import 'package:programming_questions/core/theme/theme.dart';

int index = 1, correct = 0;

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  bool showLink = false;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final dataController = appProvider.dataController;
    int length = dataController.items.length;
    print('Length $length');
    return Scaffold(
      appBar: appBar(context),
      backgroundColor: AppColors.backroundColor,
      body: Padding(
        padding: AppDimens.p16,
        child: FutureBuilder(
          future: dataController.initilize(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Xatolik: ${snapshot.error}"));
            } else if (dataController.items.isEmpty) {
              return const Center(child: Text("Savollar topilmadi"));
            } else {
              // hozirgi savol
              final item = dataController.items[appProvider.questionIndex];

              return Column(
                children: [
                  /// qaysi tilni tanlasa shu dasturlash tili keladi
                  const LanguageTextWidget(languageText: AppStrings.dart),
                  CountQuestionText(index: index, length: length),

                  SizedBox(
                    height: AppDimens.d50,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int i = 0; i < dataController.items.length; i++)
                          SmallquestionCounter(
                            index: appProvider.questionIndex,
                            i: i,
                          ),
                      ],
                    ),
                  ),
                  Savollar(item: item),
                  if (showLink)
                    /// show link buttoni
                    Padding(
                      padding: AppDimens.p8,
                      child: OutlinedButton(
                        onPressed: () => openUrl(item.infoLink),
                        child: const Text(
                          "Batafsil o‘qish",
                          style: AppTextStyle.infoButton,
                        ),
                      ),
                    ),
                  ...item.variants.map((v) {
                    return Padding(
                      /// variant buttoni
                      padding: AppDimens.p8,
                      child: SizedBox(
                        width: AppDimens.d300,
                        height: AppDimens.d50,
                        child: OutlinedButton(
                          style: AppButtonStyle.selectButtonStyle,
                          onPressed: () {
                            if (index == dataController.items.length - 1)
                              index++;
                            print("Index $index");
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
                  }).toList(),
                  AppDimens.h30,
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutesName.resultScreen);
                    },
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(AppColors.green),
                    ),
                    child: const Center(child: Text('')),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    // Added context here
    return AppBar(
      leading: IconButton(
        onPressed: () => AppRoutes.back(context),
        icon: Icon(Icons.arrow_back, color: AppColors.white),
      ),
      backgroundColor: AppColors.backroundColor,
      actions: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {
              setState(() => showLink = !showLink);
            },
            icon: showLink ? AppIcons.link : AppIcons.linkOff,
          ),
        ),
      ],
    );
  }
}
