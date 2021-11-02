import 'package:budget_planner2/data/date_time_extensions.dart';
import 'package:budget_planner2/data/models/budget_model.dart';
import 'package:budget_planner2/data/models/expense_model.dart';
import 'package:flutter/material.dart';

class HomePageWidget extends StatelessWidget {
  final void Function(DateTime) onEndDateChose;
  final void Function(BudgetModel) onExpenseAdd;
  final void Function() onExpenseList;
  final void Function(int) onTotalSumEnter;
  final TextEditingController totalSumController;
  final DateTime todayDate = DateTime.now();
  final BudgetModel budgetModel;

  late DateTime expenseDate;

  HomePageWidget({
    required this.onEndDateChose,
    required this.onExpenseAdd,
    required this.onExpenseList,
    required this.onTotalSumEnter,
    required this.budgetModel,
    required this.totalSumController,
    Key? key,
  }) : super(key: key);

  DateTime _getInitialDate(DateTime budgetModelDate) {
    return budgetModelDate.isOlderThan(todayDate) ? budgetModelDate : todayDate;
  }

  _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _getInitialDate(budgetModel.budgetEndDate),
      firstDate: DateTime(todayDate.year),
      lastDate: DateTime(todayDate.year + 2),
    );
    if (picked != null && picked != budgetModel.budgetEndDate) {
      onEndDateChose(picked);
    }
  }

  String _getPerDaySum() {
    int daysLeftToBudgetEnd = budgetModel.getLeftDays();
    int perDayBudgetInitial =
        budgetModel.getCalculatedBudget() ~/ daysLeftToBudgetEnd;
    int totalDayExpenses = 0;
    for (ExpenseModel expense in budgetModel.expensesList.where(
      (element) => element.expenseDate.isSameDate(DateTime.now()),
    )) {
      totalDayExpenses += expense.expenseSum;
    }
    int perDayLeft = perDayBudgetInitial - totalDayExpenses;
    return '$perDayLeft left out of $perDayBudgetInitial UAH per today';
  }

  _getCalculatedBudget() {
    return budgetModel.getCalculatedBudget().toString();
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
                  onPressed: () => onExpenseAdd(budgetModel),
                  child: const Text('Enter Expense'),
                ),
                ElevatedButton(
                  onPressed: onExpenseList,
                  child: const Text('Expense List'),
                )
              ],
            ),
            const Spacer(),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('${budgetModel.budgetEndDate}'),
                ElevatedButton(
                  onPressed: () => _selectEndDate(context),
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
