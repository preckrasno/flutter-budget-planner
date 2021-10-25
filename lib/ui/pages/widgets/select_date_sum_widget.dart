import 'package:budget_planner2/data/models/budget_model.dart';
import 'package:flutter/material.dart';

class SelectDateSumWidget extends StatelessWidget {
  SelectDateSumWidget({
    required this.onSubmit,
    required this.totalSumController,
    Key? key,
  }) : super(key: key);

  final TextEditingController totalSumController;
  final void Function(BudgetModel) onSubmit;
  final DateTime todayDate = DateTime.now();
  DateTime? pickedEndDate;
  DateTime? pickedStartDate;

  _selectEndDate(BuildContext context) async {
    pickedEndDate = await showDatePicker(
      context: context,
      initialDate: todayDate,
      firstDate: todayDate,
      lastDate: DateTime(2023),
    );
  }

  _selectStartDate(BuildContext context) async {
    pickedStartDate = await showDatePicker(
      context: context,
      initialDate: todayDate,
      firstDate: todayDate,
      lastDate: DateTime(2023),
    );
  }

  _getBudget(DateTime? startDate, DateTime? endDate, String? totalSum) {
    if (startDate != null && endDate != null && totalSum != null) {
      var budget = BudgetModel(
        initialBudgetSum: int.parse(totalSum),
        budgetEndDate: endDate,
        budgetStartDate: startDate,
        expensesList: [],
      );
      onSubmit(budget);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _selectStartDate(context),
                child: const Text('Select Start Date'),
              ),
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
                  keyboardType: TextInputType.number,
                  controller: totalSumController,
                ),
              ),
              ElevatedButton(
                onPressed: () => _getBudget(
                  pickedStartDate,
                  pickedEndDate,
                  totalSumController.text,
                ),
                child: const Text('Submit'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
