import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:temperature_conversion_app/temperature_conversion_screen.dart'; // Adjust this import according to your file structure

void main() {
  testWidgets('Temperature conversion test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: TemperatureConversionScreen()));

    // Verify that the text field and dropdown are present
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(DropdownButton<String>), findsOneWidget);

    // Enter a temperature value
    await tester.enterText(find.byType(TextField), '32');

    // Tap the convert button
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that the converted temperature is displayed
    expect(find.text('32.00 °F => 0.00 °C'), findsOneWidget);
  });
}
