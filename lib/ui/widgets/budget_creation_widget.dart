import 'package:budget_planner2/data/models/budget_model.dart';
import 'package:flutter/material.dart';

class BudgetCreationWidget extends StatelessWidget {
  BudgetCreationWidget({
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

  _getBudget(DateTime? endDate, String? totalSum) {
    if (endDate != null && totalSum != null) {
      BudgetModel budget = BudgetModel(
        initialBudgetSum: int.parse(totalSum),
        budgetEndDate: endDate,
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
          ElevatedButton(
            onPressed: () => _selectEndDate(context),
            child: const Text('Select End Date'),
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
