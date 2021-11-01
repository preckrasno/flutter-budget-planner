import 'package:budget_planner2/data/models/budget_model.dart';
import 'package:flutter/material.dart';

class ExpenseListWidget extends StatelessWidget {
  ExpenseListWidget({required this.budget, Key? key}) : super(key: key);
  BudgetModel budget;

  List<Widget> _getExpenseList() {
    List<Widget> expenseList = [];
    for (var expense in budget.expensesList) {
      expenseList.add(Text('${expense.expenseSum} ${expense.expenseDate}'));
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
