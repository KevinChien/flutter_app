import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_calculator_app/history.dart';

void main() {
  testWidgets('History UI Test', (WidgetTester tester) async {
    final List<String> history = ['2+2 = 4', '5*5 = 25', '10/2 = 5'];
    await tester.pumpWidget(MaterialApp(home: History(history: history)));

    expect(find.text('History'), findsOneWidget);
    expect(find.text('2+2 = 4'), findsOneWidget);
    expect(find.text('5*5 = 25'), findsOneWidget);
    expect(find.text('10/2 = 5'), findsOneWidget);
  });
}
