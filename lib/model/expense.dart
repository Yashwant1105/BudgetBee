import "package:flutter/material.dart";
import "package:uuid/uuid.dart";
import "package:intl/intl.dart";

final formatter = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const uuid = Uuid();
const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.flight,
  Category.leisure: Icons.beach_access,
  Category.work: Icons.work
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.category,
      required this.date})
      : ID = uuid.v4();
  final String ID;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, this.expenses = const []});
  final Category category;
  final List<Expense> expenses;

  ExpenseBucket.forCategory(List<Expense>? allExpenses, this.category)
      : expenses = (allExpenses ?? [])
            .where((expense) => expense.category == category)
            .toList();

  double get totalExpenses {
    if (expenses.isEmpty) return 0; // ✅ Prevents null access
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
