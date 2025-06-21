import '../core/theme/theme.dart';

Future<void> openUrl(String url) async {
  debugPrint("Trying to launch: $url");
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    debugPrint('xato boldi $url');
  }
}