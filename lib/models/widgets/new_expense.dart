import 'package:expense_tracker/constans.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: AppColors.green,
                    width: 1.0,
                  ),
                ),
                label: const Text(
                  "Title",
                  style: TextStyle(color: Colors.white),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.green,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(AppColors.green),
                      foregroundColor: WidgetStateProperty.all(Colors.black),
                    ),
                    onPressed: () {
                      print(_titleController.text);
                    },
                    child: const Text("save"))
              ],
            )
          ],
        ),
      );
}
