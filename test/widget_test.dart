import 'package:flutter_test/flutter_test.dart';
import 'package:ejary/main.dart';

void main() {
  testWidgets('Ejary app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const EjaryApp());
    expect(find.byType(EjaryApp), findsOneWidget);
  });
}
