import 'package:expense_tracker/constans.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

//callback function
  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
      initialDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount < 0;

    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid input"),
          content: const Text("Please make sure all the fields are filled."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            )
          ],
        ),
      );
      return;
    }

    widget.onAddExpense(
      Expense(
          date: _selectedDate!,
          title: _titleController.text,
          amount: enteredAmount,
          category: _selectedCategory),
    );

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry padding = calculatePadding(context);
    double screenheight = MediaQuery.sizeOf(context).height;
    double screenwidth = MediaQuery.sizeOf(context).width;

    // double leftPadding = screenwidth * 0.05;
    // double topPadding = screenheight * 0.12;
    // double rightPadding = screenwidth * 0.05;
    // double bottomPadding = screenheight * 0.05;

    return Padding(
      padding: padding,
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
              Expanded(
                child: TextField(
                  controller: _amountController,
                  maxLength: 5,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    prefixText: '₹',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: AppColors.green,
                        width: 1.0,
                      ),
                    ),
                    label: const Text(
                      "Amount",
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
              ),
              SizedBox(
                width: .1 * screenwidth,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _selectedDate == null
                        ? ' No date selected'
                        : formatter.format(_selectedDate!),
                  ),
                  IconButton(
                    onPressed: _presentDatePicker,
                    icon: const Icon(
                      Icons.calendar_month,
                    ),
                  )
                ],
              ))
            ],
          ),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map((Category) => DropdownMenuItem(
                          value: Category,
                          child: Text(
                            Category.name.toUpperCase(),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const Spacer(),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(AppColors.green),
                  foregroundColor: WidgetStateProperty.all(Colors.black),
                ),
                onPressed: _submitExpenseData,
                child: const Text(
                  "save",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 0.02 * screenwidth,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 44, 43, 42)),
                  foregroundColor: WidgetStateProperty.all(Colors.red),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "cancel",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  EdgeInsetsGeometry calculatePadding(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double leftPadding = screenWidth * 0.05;
    double topPadding = screenHeight * 0.12;
    double rightPadding = screenWidth * 0.05;
    double bottomPadding = screenHeight * 0.05;

    return EdgeInsets.fromLTRB(
        leftPadding, topPadding, rightPadding, bottomPadding);
  }
}
