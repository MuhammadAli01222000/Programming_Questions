import 'package:programming_questions/core/theme/theme.dart';

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
    /// user qaysi tilni tanlagan bo'lsa o'sha tilni aniqlas
    if (widget.selectedIndex == 0) {
      selectedLanguage = "dart";
    } else if (widget.selectedIndex == 1) {
      selectedLanguage = "java";
    } else if (widget.selectedIndex == 2) {
      selectedLanguage = "javascript";
    } else if (widget.selectedIndex == 3) {
      selectedLanguage = "python";
    }
/// controldan  til va darajani aniqlash
    futureData = appProvider.dataController.initialize(
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
                '${AppLocalizations.of(context)?.error}: ${snapshot.error}',
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
                 context.pop();
                },
                icon: AppIcons.home,
              ),
            ),
            backgroundColor: AppColors.backroundColor,
            body: SingleChildScrollView(
              controller: controller,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppDimens.h100,
                    Container(
                      padding:AppDimens.p24p20,
                      margin: AppDimens.m32,
                      decoration: BoxDecoration(
                        color: AppColors.homeCard,
                        borderRadius: AppDimens.c20,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),

                      width: AppDimens.d300,
                      height: AppDimens.d150,
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.selectLevel,
                          style: AppTextStyle.languageText,
                        ),
                      ),
                    ),

                    AppDimens.h100,
                    for (int i = 0; i < AppStrings.levelProgramist.length; i++)
                      Padding(
                        padding: AppDimens.p8,
                        child: AppCheckButton(
                          color: AppColors.colorButton[i],
                          data: AppStrings.levelProgramist[i],
                          onTap: () async {
                            final appProvider = Provider.of<AppProvider>(
                              context,
                              listen: false,
                            );
                            setState(() {
                              levelProgrammer = i;
                            });
                            await appProvider.dataController.initialize(
                              selectedLanguage,
                              levelProgrammer,
                            );
                            context.pushNamed(AppRouteName.question);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder:
                            //         (BuildContext context) => const Questions(),
                            //   ),
                            // );
                          },
                        ),
                      ),
                    AppDimens.h100,
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
