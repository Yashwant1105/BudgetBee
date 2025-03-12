import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/model/expense.dart';

void main() {
  testWidgets('Expenses list shows items and supports deletion',
      (WidgetTester tester) async {
    final expense = Expense(
      title: "Lunch",
      amount: 150.0,
      date: DateTime.now(),
      category: Category.food,
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ExpensesList(
          expenses: [expense],
          onRemoveExpense: (_) {},
        ),
      ),
    ));

    expect(find.text("Lunch"), findsOneWidget);

    await tester.drag(find.text("Lunch"), const Offset(-500, 0));
    await tester.pumpAndSettle();
  });
}
