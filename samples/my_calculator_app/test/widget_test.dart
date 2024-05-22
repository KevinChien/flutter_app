import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_calculator_app/calculator.dart';

void main() {
  testWidgets('Calculator UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Calculator()));

    expect(find.text('Calculator'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Calculate'), findsOneWidget);
    expect(find.text('Result: 0.0'), findsOneWidget);
    expect(find.text('View History'), findsOneWidget);
  });
}
