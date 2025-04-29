import 'package:flutter/material.dart';
import 'package:programming_questions/core/theme/theme.dart';

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
                            AppStrings.infoProgrammingLanguage[i],
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
