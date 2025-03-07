import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import "package:expense_tracker/model/expense.dart";

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final void Function(Expense expense) onRemoveExpense;
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    if (expenses.isEmpty) {
      return const Center(
        child: Text("No expenses added yet!"),
      );
    }

    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) {
        final expense = expenses[index];
        return Dismissible(
          key: ValueKey(expense.ID), // Unique key for each item
          background: Container(
            color: Colors.red.withOpacity(0.8),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          direction: DismissDirection.endToStart, // Swipe left to delete
          onDismissed: (direction) {
            onRemoveExpense(expense); // Call the delete function
          },
          child: ExpenseItem(expense),
        );
      },
    );
  }
}
