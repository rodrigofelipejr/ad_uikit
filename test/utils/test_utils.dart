import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

abstract class TestUtils {
  static Future<void> makeTestableWidget(WidgetTester tester, {required Widget child}) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: child)));
    await tester.pump();
  }
}
