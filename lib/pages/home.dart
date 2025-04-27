import 'package:programming_questions/core/theme/theme.dart';
import 'package:programming_questions/core/widgets/check_button.dart';

String selectedLanguage = "";

class Home extends StatefulWidget {
  final int selectedIndex;

  const Home({super.key, required this.selectedIndex});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = ScrollController();
  late Future<void> futureData;
  int levelProgrammer = 0;
  @override
  void initState() {
    super.initState();
    final appProvider = Provider.of<AppProvider>(context, listen: false);

    if (widget.selectedIndex == 0) {
      selectedLanguage = "dart";
    } else if (widget.selectedIndex == 1) {
      selectedLanguage = "java";
    } else if (widget.selectedIndex == 2) {
      selectedLanguage = "javascript";
    } else if (widget.selectedIndex == 3) {
      selectedLanguage = "python";
    }

    futureData = appProvider.dataController.initilize(
      selectedLanguage,
      levelProgrammer,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            backgroundColor: AppColors.backroundColor,
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: AppColors.backroundColor,
            body: Center(
              child: Text(
                'Xatolik: ${snapshot.error}',
                style: AppTextStyle.languageText,
              ),
            ),
          );
        } else {
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
                      for (
                        int i = 0;
                        i < AppStrings.levelProgramist.length;
                        i++
                      )
                        Padding(
                          padding: AppDimens.p8,
                          child: AppCheckButton(
                            data: AppStrings.levelProgramist[i],
                            onTap: () {
                              setState(() {
                                levelProgrammer = i;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (BuildContext context) =>
                                          const Questions(),
                                ),
                              );
                            },
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
      },
    );
  }
}
