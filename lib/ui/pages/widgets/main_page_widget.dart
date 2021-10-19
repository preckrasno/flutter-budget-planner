import 'package:flutter/material.dart';

class MainPageWidget extends StatelessWidget {
  final Function(DateTime) onDateChose;
  final Function(int) onExpenseEnter;
  final Function(int) onTotalSumEnter;
  final int? perDaySum;
  final TextEditingController expenseController;
  final TextEditingController totalSumController;
  final DateTime selectedDate = DateTime.now();

  MainPageWidget({
    required this.onDateChose,
    required this.onExpenseEnter,
    required this.onTotalSumEnter,
    this.perDaySum,
    required this.expenseController,
    required this.totalSumController,
    Key? key,
  }) : super(key: key);

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: selectedDate,
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
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
                Text('$perDaySum UAH'),
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
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text('Select end date'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 150,
                  child: TextField(
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
                  child: Text('Total sum'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
