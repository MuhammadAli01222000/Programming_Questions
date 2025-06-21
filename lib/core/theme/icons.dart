import 'package:programming_questions/core/theme/theme.dart';

sealed class AppIcons {
  static final Widget uzb = SvgPicture.asset(
    'assets/l10_png/flag-for-flag-uzbekistan-svgrepo-com.svg',
    width: AppDimens.d35,
    height: AppDimens.d35,
  );
  static final Widget rus = SvgPicture.asset(
    'assets/l10_png/flag-ru-svgrepo-com.svg',
    width: AppDimens.d35,
    height: AppDimens.d35,
  );
  static final Widget xitoy = SvgPicture.asset(
    'assets/l10_png/flag-for-flag-china-svgrepo-com.svg',
    width: AppDimens.d35,
    height: AppDimens.d35,
  );
  static final Widget hind = SvgPicture.asset(
    'assets/l10_png/india-svgrepo-com.svg',
    width: AppDimens.d35,
    height: AppDimens.d35,
  );
  static final Widget ingliz = SvgPicture.asset(
    'assets/l10_png/united-kingdom-uk-svgrepo-com.svg',
    width: AppDimens.d35,
    height: AppDimens.d35,
  );
  static final Widget gmail = SvgPicture.asset(
    'assets/brand/icons8-gmail.svg',
    width: 100,
    height: 100,
  );

  static const home = Icon(
    Icons.home,
    color: AppColors.white,
    size: AppDimens.d35,
  );

  static const link = Icon(
    Icons.lightbulb,
    color: AppColors.yellow,
    size: AppDimens.d35,
  );

  static const linkOff = Icon(
    Icons.lightbulb,
    color: Colors.grey,
    size: AppDimens.d35,
  );
  static const arena=Icon(Icons.bar_chart,color: AppColors.white,);
  static const user=Icon(Icons.account_circle_sharp,color: AppColors.white,);
}
