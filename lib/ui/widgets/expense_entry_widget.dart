import 'package:budget_planner2/data/date_time_extensions.dart';
import 'package:budget_planner2/data/models/budget_model.dart';
import 'package:budget_planner2/data/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseEntryWidget extends StatelessWidget {
  ExpenseEntryWidget({
    required this.budget,
    required this.expenseController,
    required this.onExpenseEnter,
    Key? key,
  }) : super(key: key);

  final DateTime todayDate = DateTime.now();
  final BudgetModel budget;
  late DateTime expenseDate;
  final TextEditingController expenseController;
  final void Function(ExpenseModel) onExpenseEnter;

  DateTime _getInitialDate(DateTime budgetModelDate) {
    return budgetModelDate.isOlderThan(todayDate) ? budgetModelDate : todayDate;
  }

  _selectExpenseDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _getInitialDate(budget.budgetEndDate),
      firstDate: todayDate,
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != budget.budgetEndDate) {
      expenseDate = picked;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Expense'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => _selectExpenseDate(context),
            child: const Text('Expense Date'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 150,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: expenseController,
                ),
              ),
              ElevatedButton(
                onPressed: () => onExpenseEnter(ExpenseModel(
                  expenseDate: expenseDate,
                  expenseSum: int.parse(
                    expenseController.text,
                  ),
                )),
                child: const Text('Spent'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
