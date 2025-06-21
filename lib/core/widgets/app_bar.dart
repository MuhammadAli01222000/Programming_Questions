import 'package:programming_questions/core/theme/theme.dart';

AppBar appBar(BuildContext context) {
  final appProvider = Provider.of<AppProvider>(context, listen: false);
  return AppBar(
    leading: IconButton(
      onPressed: () => context.pop(),
      icon: const Icon(Icons.arrow_back, color: AppColors.white),
    ),
    backgroundColor: AppColors.backroundColor,
    actions: [
      IconButton(
        onPressed: () {
          appProvider.toggleShowLink();
        },
        icon: appProvider.showLink ? AppIcons.linkOff : AppIcons.link,
      ),
    ],
  );
}
