import 'package:flutter/material.dart';
import 'package:programming_questions/core/theme/colors.dart';
import 'package:programming_questions/core/theme/dimens.dart';
import 'package:programming_questions/core/theme/strings.dart';
import 'package:programming_questions/core/theme/text_style.dart';
import 'package:programming_questions/services/data_controller.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Future<void> _openUrl(String url) async {
    debugPrint("Trying to launch: $url");
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('xato boldi $url');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int length = controller.items.length;

    return Scaffold(
      appBar: _appBar(),
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
                  Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "${AppStrings.quetion}",
                            style: AppTextStyle.bigText,
                          ),
                          TextSpan(
                            text: " $index",
                            style: AppTextStyle.bigNumber,
                          ),
                          TextSpan(
                            text: "/$length",
                            style: AppTextStyle.greyNumber,
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// todo rangli  indicatorlar  qaysi savolni topib qaysini topmaganini belgilidi
                  SizedBox(
                    height: AppDimens.d50,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int i = 0; i < controller.items.length; i++)
                          Expanded(
                            child: SizedBox(
                              width: AppDimens.d40,
                              height: AppDimens.d15,
                              child: Card(
                                color: index == i ? Colors.green : Colors.grey,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Card(
                      elevation: 0,
                      color: Colors.transparent,
                      margin: AppDimens.m20,
                      child: SizedBox(
                        width: AppDimens.d300,
                        height: 150,
                        child: Center(
                          child: Text(
                            item.question,
                            style: AppTextStyle.questionsText,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (showLink)
                    /// show link buttoni
                    OutlinedButton(
                      onPressed: () => _openUrl(item.infoLink),
                      child: const Text(
                        "Batafsil o‘qish",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  const SizedBox(height: 20),
                  ...item.variants.map((v) {
                    return Padding(
                      /// variant buttoni
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: AppDimens.d300,
                        height: AppDimens.d50,
                        child: OutlinedButton(
                          style: ButtonStyle(
                            side: const WidgetStatePropertyAll(
                              BorderSide(color: AppColors.green, width: 4),
                            ),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  AppDimens.d16,
                                ),
                              ),
                            ),
                          ),
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

  AppBar _appBar() {
    return AppBar(
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

class LanguageTextWidget extends StatelessWidget {
  final String languageText;
  const LanguageTextWidget({super.key, required this.languageText});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(languageText, style: AppTextStyle.programmingLanguageText),
    );
  }
}
