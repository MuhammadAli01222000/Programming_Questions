

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:programming_questions/pages/home.dart';

void main() {
  testWidgets('SplashPage UI test: appBar scroll, button and 4 selections', (WidgetTester tester) async {
   // await tester.pumpWidget(createWidgetUnderTest());

    // 1. AppBar scroll mavjudligini tekshirish
    final scrollableAppBar = find.byType(ListView);
    expect(scrollableAppBar, findsOneWidget);

    // 2. Tugma mavjudligini tekshirish
    final iconButton = find.byType(IconButton);
    expect(iconButton, findsWidgets); // trailing va til tanlashlar ko‘p bo'lishi mumkin

    // 3. 4 ta tanlov mavjudligini tekshirish (GestureDetector)
    final gestureDetectors = find.byType(GestureDetector);
    expect(gestureDetectors, findsAtLeastNWidgets(4));

    // 4. 1-elementni bosish va navigatsiyani test qilish
    await tester.tap(gestureDetectors.at(0));
    await tester.pumpAndSettle(); // animation va navigation tugashini kutish

    // 5. Endi siz Home sahifaga o‘tgansizmi, uni aniqlash (masalan: Text yoki boshqa widget orqali)
    expect(find.byType(Home), findsOneWidget); // Agar `Home` import qilingan bo‘lsa
  });
}
