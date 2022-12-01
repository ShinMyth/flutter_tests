import 'package:flutter_test/flutter_test.dart';
import 'package:tests/screens/news_screen/news_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  Widget widgetUnderTest() {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return const MaterialApp(
          home: NewsScreenView(),
        );
      },
    );
  }

  testWidgets(
    "Test if tapping on the first article excerpt opens the full article.",
    (WidgetTester tester) async {
      await tester.pumpWidget(widgetUnderTest());
      await tester.pump(const Duration(milliseconds: 2000));
      expect(find.text("Flutter Tests"), findsOneWidget);
      await tester.tap(find.byType(ListTile).first);
      await tester.pumpAndSettle();
      expect(find.byType(Divider), findsOneWidget);
    },
  );
}
