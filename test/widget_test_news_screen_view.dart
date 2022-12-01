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
    "Test if title is displayed.",
    (WidgetTester tester) async {
      await tester.pumpWidget(widgetUnderTest());
      await tester.pump(const Duration(milliseconds: 2000));
      expect(find.text("Flutter Tests"), findsOneWidget);
    },
  );

  testWidgets(
    "Test if loading is displayed while waiting for articles.",
    (WidgetTester tester) async {
      await tester.pumpWidget(widgetUnderTest());
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump(const Duration(milliseconds: 2000));
    },
  );

  testWidgets(
    "Test if articles are displayed.",
    (WidgetTester tester) async {
      await tester.pumpWidget(widgetUnderTest());
      await tester.pump(const Duration(milliseconds: 2000));
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(Card), findsWidgets);
    },
  );
}
