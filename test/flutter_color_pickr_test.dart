import 'package:flutter/material.dart';
import 'package:flutter_color_pickr/flutter_color_pickr.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('colorPickr', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FlutterColorPickr(onTap: (_) {}),
        ),
      ),
    );

    expect(find.text('Choose Color'), findsOneWidget);
  });
}
