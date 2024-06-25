import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/expenses_list.dart';
import 'package:expense_tracker/models/widgets/new_expense.dart';
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
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExprenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExprenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.sizeOf(context).height;
    // double screenwidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Expense Tracker",
          style: TextStyle(color: Colors.white, fontSize: 0.03 * screenheight),
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          //
          const Text("the chart"),
          Expanded(
            child: ExpesnsesList(
              expenses: _registeredExprenses,
              onRemoveExpense: _removeExpense,
            ),
          )
        ],
      ),
    );
  }
}
