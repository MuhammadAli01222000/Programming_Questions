import 'package:programming_questions/core/theme/theme.dart';

int selectedIndex = 0;
String l10n = "uz";
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int _currentImageIndex = 0;
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width;
    final languageController = context.read<LanguageController>();
    print(languageController.currentLocale);
    l10n=languageController.currentLocale.toString();
    return Scaffold(
      backgroundColor: AppColors.backroundColor,
      appBar: _appBar(size),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:AppDimens.p8,
            child: ListTile(
              leading: Text(
                AppLocalizations.of(context)!.selectLanguage,
                style: AppTextStyle.smallText
              ),
              trailing: Consumer<LanguageController>(
                builder: (context, langController, _) {
                  return IconButton(
                    padding: AppDimens.p25,
                    icon:
                        langController.currentLocale.languageCode == "uz"
                            ? AppIcons.uzb
                            : langController.currentLocale.languageCode == "en"
                            ? AppIcons.ingliz
                            : AppIcons.rus,
                    onPressed: () {
                      l10n= langController.currentLocale.languageCode;

                      showModalBottomSheet(
                        context: context,
                        builder: (context) => _buildLanguageModal(context),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          SizedBox(
            width: size - 3,
            height: AppDimens.d400,
            child: Padding(
              padding: AppDimens.p16,
              child: GridView.builder(
                itemCount: listImageUrl.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppDimens.d20,
                  mainAxisSpacing: AppDimens.d20,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: AppDimens.d150,
                    height: AppDimens.d50,
                    decoration: BoxDecoration(
                      color: AppColors.colorList[index],
                      borderRadius: AppDimens.c20,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.d16,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          selectedIndex = index;
                          _currentImageIndex = index;
                          context.pushNamed(
                            AppRouteName.home,
                            pathParameters: {
                              "index": "$selectedIndex",
                            },
                          );
                        },
                        child: Image.asset(
                          listImageUrl[index],
                          height: AppDimens.d50,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageModal(BuildContext context) {
    final languageController = context.read<LanguageController>();

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text("Uzbek"),
            leading: IconButton(
              icon: AppIcons.uzb,
              onPressed: () {
                languageController.changeLocal(const Locale("uz"));
                context.pop();
              },
            ),
          ),
          ListTile(
            title: const Text("English"),
            leading: IconButton(
              icon: AppIcons.ingliz,
              onPressed: () {
                languageController.changeLocal(const Locale("en"));
                context.pop();
              },
            ),
          ),
          ListTile(
            title: const Text("Russian"),
            leading: IconButton(
              icon: AppIcons.rus,
              onPressed: () {
                languageController.changeLocal(LanguageController.ru);
                context.pop();
              },
            ),
          ),
AppDimens.h20,
        ],
      ),
    );
  }

  PreferredSize _appBar(double size) {
    return PreferredSize(
      preferredSize: AppDimens.h300,
      child: Container(
        padding: const EdgeInsets.only(top: AppDimens.d40, left: AppDimens.d12),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: AppColors.backroundColor,
          borderRadius: BorderRadius.circular(AppDimens.d30),
        ),
        child: ListView.builder(
          controller: scrollController,
          physics: const PageScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: listImageUrl.length,
          itemBuilder: (context, index) {
            return ScrollProgrammingLanguage(size: size, imageIndex: index);
          },
        ),
      ),
    );
  }
}
