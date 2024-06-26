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
    final expenseIndex = _registeredExprenses.indexOf(expense);
    setState(() {
      _registeredExprenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text("Expense deleted."),
        action: SnackBarAction(
          label: 'undo',
          textColor: Colors.red,
          onPressed: () {
            setState(() {
              _registeredExprenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent =
        Center(child: Text("No expense found Start adding some!"));
    if (_registeredExprenses.isNotEmpty) {
      mainContent = ExpesnsesList(
        expenses: _registeredExprenses,
        onRemoveExpense: _removeExpense,
      );
    }

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
            child: mainContent,
          )
        ],
      ),
    );
  }
}
