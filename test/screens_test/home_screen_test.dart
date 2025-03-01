import 'package:bose_ecommerce_animation/model/bose_mode.dart';
import 'package:bose_ecommerce_animation/screens/home_screen.dart';
import 'package:bose_ecommerce_animation/widget/home_grid_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HomeScreen Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomeScreen(),
      ),
    );

    expect(find.byType(Icon), findsNWidgets(2));
    expect(find.text("Wireless\nHeadphones"), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 600));
    await tester.pump(const Duration(milliseconds: 1200));
    await tester.pump(const Duration(milliseconds: 2000));

    await tester.drag(find.byType(GridView), const Offset(0, -300));
    await tester.pumpAndSettle();

    expect(find.byType(HomeGridItemWidget), findsNWidgets(BoseModelListClass.boseModelList.length));

    expect(find.text("Wireless\nHeadphones"), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back_ios_new), findsOneWidget);
    expect(find.byIcon(Icons.search_rounded), findsOneWidget);
  });
}
