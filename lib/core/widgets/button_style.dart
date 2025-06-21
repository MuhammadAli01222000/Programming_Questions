
import 'package:programming_questions/core/theme/theme.dart';
sealed class AppButtonStyle {
  static final selectButtonStyle = ButtonStyle(
    side: const WidgetStatePropertyAll(
      BorderSide(color: AppColors.green, width: 4),
    ),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(borderRadius: AppDimens.c16),
    ),
  );
}
