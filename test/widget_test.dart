import 'package:flutter_test/flutter_test.dart';
import 'package:test2_flutter/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(new MyApp());
    await tester.pump();
  });
}
