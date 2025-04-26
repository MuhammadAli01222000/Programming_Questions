import 'package:flutter/material.dart';
import 'package:programming_questions/core/theme/colors.dart';
import 'package:programming_questions/core/theme/dimens.dart';
import 'package:programming_questions/core/theme/theme.dart';
import 'package:programming_questions/core/widgets/check_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = ScrollController();
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backroundColor,
        leading: IconButton(
          onPressed: () {
            AppRoutes.back(context);
          },
          icon: AppIcons.home,
        ),
      ),
      backgroundColor: AppColors.backroundColor,
      body: SingleChildScrollView(
        controller: controller,
        child: Padding(
          padding: AppDimens.p8,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppDimens.h100,
                const SizedBox(
                  width: AppDimens.d300,
                  height: AppDimens.d150,
                  child: Card(
                    color: AppColors.green,
                    child: Center(
                      child: Text(
                        "Darajangizni tanlang",
                        style: AppTextStyle.languageText,
                      ),
                    ),
                  ),
                ),
                AppDimens.h100,
                for (int i = 0; i < AppStrings.levelProgramist.length; i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppCheckButton(
                      data: AppStrings.levelProgramist[i],
                      onTap: () {},
                    ),
                  ),

                AppDimens.h100,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
