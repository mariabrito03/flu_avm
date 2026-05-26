import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
   // await tester.pumpWidget(const MainApp());
    await tester.pumpAndSettle(); // Wait for navigation to complete

    // Navigate to the counter screen
    await tester.tap(find.text('Contador'));
    await tester.pumpAndSettle();

    // Verify that our counter starts at 0.
    expect(find.text('Valor: 0'), findsOneWidget);
    expect(find.text('Valor: 1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('Valor: 0'), findsNothing);
    expect(find.text('Valor: 1'), findsOneWidget);
  });
}
