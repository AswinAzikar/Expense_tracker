import 'package:expense_tracker/constants.dart';
import 'package:flutter/material.dart';

import 'models/expenses.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const Expenses(),
    );
  }
}
