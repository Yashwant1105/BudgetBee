import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:expense_tracker/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Full app flow: Login to Expenses screen',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);

    await tester.enterText(
        find.byType(TextField).first, "yashwantsahoo05@gmail.com");
    await tester.enterText(find.byType(TextField).last, "123456");

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 5));
    await tester.pumpAndSettle();

    expect(find.text('BudgetBee: Expense Tracker'), findsOneWidget);
  });
}
