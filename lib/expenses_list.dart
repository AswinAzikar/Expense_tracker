import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/models/widgets/expenses_list/expense_Item.dart';
import 'package:flutter/material.dart';

class ExpesnsesList extends StatelessWidget {
  const ExpesnsesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => ExpenseItem(expense: expenses[index]),
    );
  }
}
