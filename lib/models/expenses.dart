import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExprenses = [
    Expense(
        date: DateTime.now(),
        title: "Course",
        amount: 18.4,
        category: Category.work),
    Expense(
        date: DateTime.now(),
        title: "Cinema",
        amount: 15.7,
        category: Category.leisure),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("the chart"),
          Expanded(
            child: ExpesnsesList(expenses: _registeredExprenses),
          )
        ],
      ),
    );
  }
}
