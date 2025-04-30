import 'package:programming_questions/core/theme/theme.dart';
import 'package:programming_questions/pages/home.dart';

int selectedIndex = 0;

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
            child: Padding(
              padding: const EdgeInsets.all(AppDimens.d16),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (BuildContext context) =>
                                      Home(selectedIndex: index),
                            ),
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
            return ScrollProgrammingLangugage(size: size, imageIndex: index);
          },
        ),
      ),
    );
  }
}
