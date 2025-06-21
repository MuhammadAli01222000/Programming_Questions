import 'package:programming_questions/core/theme/theme.dart';
import 'package:programming_questions/pages/with_network/network_provider.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppProvider()),
          ChangeNotifierProvider(create: (_) => NetworkStatus()),
        ],
        child: const ProgrammingQuestions(),
      ),
    );
  });
}
