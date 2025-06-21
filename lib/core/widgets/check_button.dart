import 'package:programming_questions/core/theme/theme.dart';

bool? value;

class AppCheckButton extends StatefulWidget {
  final Color color;
  final String data;
  final void Function() onTap;
  AppCheckButton({
    super.key,
    required this.data,
    required this.onTap,
    required this.color,
  });

  @override
  State<AppCheckButton> createState() => _AppCheckButtonState();
}

class _AppCheckButtonState extends State<AppCheckButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.d15),
      child: InkWell(
        borderRadius: AppDimens.c30,

        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: AppDimens.c30,
            border: Border.all(color: widget.color, width: 2),
            gradient: LinearGradient(
              colors: [
                widget.color.withOpacity(0.1),
                widget.color.withOpacity(0.05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),

          width: AppDimens.d300,
          height: AppDimens.d50,
          child: MaterialButton(
            onPressed: widget.onTap,
            child: Text(widget.data, style: AppTextStyle.languageText),
          ),
        ),
      ),
    );
  }
}
