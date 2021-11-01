import 'package:budget_planner2/data/models/budget_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseListWidget extends StatelessWidget {
  ExpenseListWidget({required this.budget, Key? key}) : super(key: key);
  BudgetModel budget;

  List<Widget> _getExpenseList() {
    List<Widget> expenseList = [];
    for (var expense in budget.expensesList) {
      String formattedDate =
          DateFormat('yyyy-MM-dd').format(expense.expenseDate);
      expenseList.add(Text(
          'Amount: ${expense.expenseSum} Date: $formattedDate id: ${expense.id.substring(0, 4)}'));
    }
    print(expenseList);
    return expenseList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _getExpenseList(),
        ),
      ),
    );
  }
}
