// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:provider/provider.dart';
// import 'package:programming_questions/pages/splash_screen.dart';
// import 'package:programming_questions/provider/l10n_provider.dart';
// import 'package:programming_questions/provider/app_provider.dart';
// import 'package:programming_questions/pages/with_network/network_provider.dart';
// import 'package:programming_questions/pages/home.dart';
//
// void main() {
//   testWidgets('SplashPage UI test: scroll, button and selection', (WidgetTester tester) async {
//     Widget createWidgetUnderTest() {
//       return MultiProvider(
//         providers: [
//           ChangeNotifierProvider(create: (_) => AppProvider()),
//           ChangeNotifierProvider(create: (_) => LanguageController(const Locale('en'))),
//           ChangeNotifierProvider(create: (_) => NetworkStatus()),
//         ],
//         child: const MaterialApp(
//           home: SplashPage(),
//         ),
//       );
//     }
//
//     await tester.pumpWidget(createWidgetUnderTest());
//
//     expect(find.byType(ListView), findsWidgets);
//
//     expect(find.byType(IconButton), findsWidgets);
//
//     final gestureDetectors = find.byType(GestureDetector);
//     expect(gestureDetectors, findsAtLeastNWidgets(4));
//
//     await tester.tap(gestureDetectors.at(0));
//     await tester.pumpAndSettle();
//
//     expect(find.byType(Home), findsOneWidget);
//   });
// }
