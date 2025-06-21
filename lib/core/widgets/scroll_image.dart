import 'package:programming_questions/core/theme/theme.dart';


class ScrollProgrammingLanguage extends StatelessWidget {
  final int imageIndex;
  ScrollProgrammingLanguage({
    super.key,
    required this.size,
    required this.imageIndex,
  });

  final double size;

  final List<String> listImageUrl = [
    'assets/image_languages/img_2.png',
    'assets/image_languages/img_4.png',
    'assets/image_languages/img_5.png',
    'assets/image_languages/img.png',
  ];

  final List<String> listImageText = [
    'Dart',
    'Java',
    'JavaScript',
    'Python',
  ];

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    if (localizations == null) {
      return const SizedBox();
    }

    final List<String> infoProgrammingLanguages = [
      localizations.infoDart,
      localizations.infoJava,
      localizations.infoJavaScript,
      localizations.infoPython,
    ];

    return Row(
      children: [
        for (int i = 0; i < listImageUrl.length; i++)
          SizedBox(
            width: size - 10,
            height: AppDimens.d250,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  listImageUrl[i],
                  fit: BoxFit.contain,
                  width: size - 20,
                  height: AppDimens.d90,
                ),
                Padding(
                  padding: AppDimens.p8,
                  child: Text(
                    listImageText[i],
                    style: AppTextStyle.pl,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(
                          child: Text(
                            infoProgrammingLanguages[i],
                            style: AppTextStyle.tanlash,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}