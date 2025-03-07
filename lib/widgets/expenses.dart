import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expense_tracker/widgets/expenses_list/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/new_expenses.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
        scaffoldBackgroundColor: const Color.fromARGB(241, 8, 9, 9),
      ),
      home: const Expenses(),
    ),
  );
}

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> registeredExpenses = [];

  void addExpense() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpenses(onAddExpense: _addExpenses));
  }

  void removeExpense(Expense expense) {
    final expenseIndex = registeredExpenses.indexOf(expense);
    setState(() {
      registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          duration: const Duration(seconds: 5),
          content: const Text("Expense deleted."),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                registeredExpenses.insert(expenseIndex, expense);
              });
            },
          )),
    );
  }

  void _addExpenses(Expense expense) {
    setState(() {
      registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text("No expenses found, start adding some!",
          style: TextStyle(color: Color.fromARGB(255, 52, 208, 255))),
    );

    if (registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: registeredExpenses,
        onRemoveExpense: removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 8, 9, 9),
        title: Text(
          'BudgetBee: Expense Tracker',
          style: GoogleFonts.inter(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            foreground: Paint()
              ..shader = const LinearGradient(
                colors: [
                  Color.fromARGB(255, 251, 207, 77),
                  Color.fromARGB(255, 255, 94, 97)
                ],
              ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
          ),
        ),
        actions: [
          IconButton(
            onPressed: addExpense,
            icon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [
                    Color.fromARGB(75, 222, 98, 98),
                    Color.fromARGB(255, 251, 165, 111)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcIn,
              child: const Icon(
                Icons.add,
                weight: 100,
                size: 40,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: const Color.fromARGB(241, 8, 9, 9),
        child: width < 600
            ? Column(
                children: [
                  Chart(expenses: registeredExpenses),
                  Expanded(child: mainContent),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: Chart(expenses: registeredExpenses),
                  ),
                  Expanded(child: mainContent),
                ],
              ),
      ),
    );
  }
}
