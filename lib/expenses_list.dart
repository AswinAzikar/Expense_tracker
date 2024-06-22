import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpesnsesList extends StatelessWidget {
  const ExpesnsesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Text(expenses[index].title),
    );
  }
}
