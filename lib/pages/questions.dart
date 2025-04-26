import 'package:flutter/material.dart';
import 'package:programming_questions/core/theme/theme.dart';

int index = 0;

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  final controller = DataController();
  late int length;

  int index = 0;
  bool showLink = false;

  @override
  Widget build(BuildContext context) {
    int length = controller.items.length;

    return Scaffold(
      appBar: appBar(),
      backgroundColor: AppColors.backroundColor,
      body: Padding(
        padding: AppDimens.p16,
        child: FutureBuilder(
          future: controller.initilize(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Xatolik: ${snapshot.error}"));
            } else if (controller.items.isEmpty) {
              return const Center(child: Text("Savollar topilmadi"));
            } else {
              final item = controller.items[index];
              return Column(
                children: [
                  /// qaysi tilni tanlasa shu dasturlash tili keladi
                  const LanguageTextWidget(languageText: AppStrings.dart),
                  CountQuestionText(index: index, length: length),

                  /// todo rangli  indicatorlar  qaysi savolni topib qaysini topmaganini belgilidi
                  SizedBox(
                    height: AppDimens.d50,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int i = 0; i < controller.items.length; i++)
                          SmallquestionCounter(index: index, i: i),
                      ],
                    ),
                  ),
                  Savollar(item: item),
                  if (showLink)
                    /// show link buttoni
                    OutlinedButton(
                      onPressed: () => openUrl(item.infoLink),
                      child: const Text(
                        "Batafsil o‘qish",
                        style: AppTextStyle.infoButton,
                      ),
                    ),
                  const SizedBox(height: 20),
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
                            setState(() {
                              index++;
                            });
                          },
                          child: Text(v, style: AppTextStyle.questionsText),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  AppBar appBar() {
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
            icon: Icon(
              showLink ? Icons.link_off : Icons.link,
              color: Colors.redAccent,
            ),
          ),
        ),
      ],
    );
  }
}
