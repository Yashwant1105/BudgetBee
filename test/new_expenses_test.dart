import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/new_expenses.dart';
import 'package:expense_tracker/model/expense.dart';

void main() {
  testWidgets('New expense form loads correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: NewExpenses(onAddExpense: (Expense e) {})),
    ));

    expect(find.byType(TextField), findsNWidgets(2));

    expect(find.byIcon(Icons.calendar_month), findsOneWidget);

    expect(find.byType(DropdownButton<Category>), findsOneWidget);

    expect(find.text('Save Expense'), findsOneWidget);
  });
}
