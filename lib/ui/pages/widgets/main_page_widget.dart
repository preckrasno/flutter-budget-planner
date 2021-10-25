import 'package:budget_planner2/data/date_time_extensions.dart';
import 'package:budget_planner2/data/models/budget_model.dart';
import 'package:flutter/material.dart';

class MainPageWidget extends StatelessWidget {
  final Function(DateTime) onDateChose;
  final Function(int) onExpenseEnter;
  final Function(int) onTotalSumEnter;
  final TextEditingController expenseController;
  final TextEditingController totalSumController;
  final DateTime todayDate = DateTime.now();
  final BudgetModel budgetModel;

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

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _getInitialDate(budgetModel.endDate),
      firstDate: todayDate,
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != budgetModel.endDate) {
      onDateChose(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Column(
              children: [
                Text('${budgetModel.perDaySum ?? ''} UAH'),
                Text('Per Day'),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 150,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: expenseController,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => onExpenseEnter(
                    int.parse(
                      expenseController.text,
                    ),
                  ),
                  child: Text('Spent'),
                )
              ],
            ),
            Spacer(),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('${budgetModel.endDate}'),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Select end date'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: budgetModel.totalSum.toString(),
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
                  child: Text('Total Sum'),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
