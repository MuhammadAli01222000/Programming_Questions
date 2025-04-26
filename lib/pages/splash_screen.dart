import 'package:flutter/material.dart';
import 'package:programming_questions/core/theme/colors.dart';
import 'package:programming_questions/core/theme/dimens.dart';
import 'package:programming_questions/core/theme/strings.dart';
import 'package:programming_questions/core/theme/text_style.dart';
import 'package:programming_questions/pages/questions.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int _currentImageIndex = 0;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.backroundColor,
      appBar: _appBar(size),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              AppStrings.selectLanguage,
              style: AppTextStyle.languageText,
            ),
          ),
          SizedBox(
            width: size - 3,
            height: 400,
            child: GridView.builder(
              itemCount: listImageUrl.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: AppDimens.d150,
                  height: AppDimens.d50,
                  child: Card(
                    color: AppColors.green,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          _currentImageIndex = index;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (BuildContext context) => const Questions(),
                            ),
                          );
                        },
                        child: Image.asset(listImageUrl[index]),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  PreferredSize _appBar(double size) {
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
            SizedBox(height: AppDimens.d50),
            SingleChildScrollView(
              physics: ScrollPhysics(),
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              child: ScrollProgrammingLangugage(
                size: size,
                imageIndex: _currentImageIndex,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScrollProgrammingLangugage extends StatelessWidget {
  final int imageIndex;
  const ScrollProgrammingLangugage({
    super.key,
    required this.size,
    required this.imageIndex,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < listImageUrl.length; i++)
          SizedBox(
            width: size - 10,
            height: 280,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  listImageUrl[i],
                  fit: BoxFit.contain,
                  width: size - 20,
                  height: 110,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    AppStrings.listImageText[i],
                    style: AppTextStyle.languageText,
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
                            AppStrings.infoProgrammingLanguage[i],
                            style: AppTextStyle.languageText,
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
