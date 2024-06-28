import 'package:expense_tracker/constants.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.sizeOf(context).height;
    double screenwidth = MediaQuery.sizeOf(context).width;
    return Card(
      color: AppColors.green,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Text(
              expense.title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            SizedBox(height: .03 * screenheight),
            Row(
              children: [
                Text(
                  '₹${" ${expense.amount.toStringAsFixed(2)}"}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      CategoryIcons[expense.category],
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 0.02 * screenwidth,
                    ),
                    Text(
                      expense.formattedDate,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
