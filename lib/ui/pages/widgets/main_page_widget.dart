import 'package:budget_planner2/data/date_time_extensions.dart';
import 'package:budget_planner2/data/models/budget_model.dart';
import 'package:budget_planner2/data/models/expense_model.dart';
import 'package:flutter/material.dart';

class MainPageWidget extends StatelessWidget {
  final void Function(DateTime) onDateChose;
  final void Function(ExpenseModel) onExpenseEnter;
  final void Function(int) onTotalSumEnter;
  final TextEditingController expenseController;
  final TextEditingController totalSumController;
  final DateTime todayDate = DateTime.now();
  final BudgetModel budgetModel;

  late DateTime expenseDate;

  MainPageWidget({
    required this.onDateChose,
    required this.onExpenseEnter,
    required this.onTotalSumEnter,
    required this.budgetModel,
    required this.expenseController,
    required this.totalSumController,
    Key? key,
  }) : super(key: key);

  DateTime _getInitialDate(DateTime budgetModelDate) {
    return budgetModelDate.isOlderThan(todayDate) ? budgetModelDate : todayDate;
  }

  _selectExpenseDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _getInitialDate(budgetModel.budgetEndDate),
      firstDate: todayDate,
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != budgetModel.budgetEndDate) {
      expenseDate = picked;
    }
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _getInitialDate(budgetModel.budgetEndDate),
      firstDate: todayDate,
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != budgetModel.budgetEndDate) {
      onDateChose(picked);
    }
  }

  String _getPerDaySum() {
    int days = budgetModel.getLeftDays();
    int perDayBudget = budgetModel.initialBudgetSum ~/ days;
    int totalDayExpenses = 0;
    for (ExpenseModel expense in budgetModel.expensesList.where(
      (element) => element.expenseDate.isSameDate(
        DateTime.now(),
      ),
    )) {
      totalDayExpenses += expense.expenseSum;
    }
    int perDayLeft = perDayBudget - totalDayExpenses;
    return '$perDayLeft left out of $perDayBudget UAH';
  }

  _getCalculatedBudget() {
    int days = budgetModel.getLeftDays();
    int perDayBudget = budgetModel.initialBudgetSum ~/ days;
    int totalExpenses = 0;
    for (ExpenseModel expense in budgetModel.expensesList) {
      totalExpenses += expense.expenseSum;
    }
    return (budgetModel.initialBudgetSum - totalExpenses).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Text(
              _getPerDaySum(),
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            Column(
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
            const Spacer(),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('${budgetModel.budgetEndDate}'),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: const Text('Select End Date'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: _getCalculatedBudget(),
                    ),
                    keyboardType: TextInputType.number,
                    controller: totalSumController,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => onTotalSumEnter(
                    int.parse(
                      totalSumController.text,
                    ),
                  ),
                  child: const Text('Total Sum'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
