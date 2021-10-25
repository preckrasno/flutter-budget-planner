import 'package:budget_planner2/data/models/budget_model.dart';
import 'package:flutter/material.dart';

class SelectDateSumWidget extends StatelessWidget {
  SelectDateSumWidget({
    required this.onSubmit,
    required this.totalSumController,
    Key? key,
  }) : super(key: key);

  final TextEditingController totalSumController;
  final Function(BudgetModel) onSubmit;
  final DateTime todayDate = DateTime.now();
  DateTime? pickedDate;

  _selectDate(BuildContext context) async {
    pickedDate = await showDatePicker(
      context: context,
      initialDate: todayDate,
      firstDate: todayDate,
      lastDate: DateTime(2025),
    );
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
                  keyboardType: TextInputType.number,
                  controller: totalSumController,
                ),
              ),
              ElevatedButton(
                onPressed: () => onSubmit(BudgetModel(
                  endDate: pickedDate!,
                  totalSum: int.parse(totalSumController.text),
                )),
                child: Text('Submit'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
