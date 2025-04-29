import 'package:programming_questions/core/theme/theme.dart';
import 'package:programming_questions/core/widgets/app_bar.dart';
import 'package:programming_questions/core/widgets/app_button.dart';
import 'package:programming_questions/pages/home.dart';

bool lastIndex = false;
bool last = false;
int counter = 1;

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  final ScrollController controller = ScrollController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final dataController = appProvider.dataController;
    final length = dataController.items.length;
    if (length == 0) {
      return IfListEmpty(controller: controller);
    }

    final item = dataController.items[appProvider.questionIndex];

    return Scaffold(
      appBar: appBar(context),
      backgroundColor: AppColors.backroundColor,
      body: Padding(
        padding: AppDimens.p16,
        child: Column(
          children: [
            LanguageTextWidget(languageText: selectedLanguage.toUpperCase()),
            CountQuestionText(
              index: appProvider.questionIndex + 1,
              length: length,
            ),
            SizedBox(
              height: AppDimens.d25,
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
            last != true ? Savollar(item: item) : const Text(''),
            appProvider.showLink
                ? Padding(
                  padding: AppDimens.p4,
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
                  child: SizedBox(height: AppDimens.d40),
                ),

            // javob
            ...item.variants.map((v) {
              return last != true
                  ? Padding(
                    padding: AppDimens.p8,
                    child: SizedBox(
                      width: AppDimens.d300,
                      height: AppDimens.d60,
                      child: OutlinedButton(
                        style: AppButtonStyle.selectButtonStyle,
                        onPressed: () {
                          counter++;
                          if (counter == length) {
                            last = true;
                          }
                          appProvider.checkAnswerAndIncrementIndex(
                            dataController
                                .items[appProvider.questionIndex]
                                .variants,
                            dataController
                                .items[appProvider.questionIndex]
                                .correctAnswer,
                            v,
                          );
                        },
                        child: Text(v, style: AppTextStyle.questionsText),
                      ),
                    ),
                  )
                  : const Text('');
            }),
            AppDimens.h30,
            const ResultPageButton(),
          ],
        ),
      ),
    );
  }
}

class IfListEmpty extends StatelessWidget {
  const IfListEmpty({super.key, required this.controller});

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      controller: controller,
      child: Scaffold(
        backgroundColor: AppColors.backroundColor,
        body: Center(
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Savollar topilmadi\n Ortga qaytish uchun yozuv usiga bosing",
              style: AppTextStyle.languageText,
            ),
          ),
        ),
      ),
    );
  }
}
