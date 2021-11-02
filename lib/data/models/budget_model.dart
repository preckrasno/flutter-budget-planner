import 'dart:convert';

import 'package:budget_planner2/data/date_time_extensions.dart';
import 'package:budget_planner2/data/models/expense_model.dart';
import 'package:equatable/equatable.dart';

class BudgetModel extends Equatable {
  int initialBudgetSum;
  DateTime budgetEndDate;
  List<ExpenseModel> expensesList;

  BudgetModel({
    required this.initialBudgetSum,
    required this.budgetEndDate,
    required this.expensesList,
  });

  getCalculatedBudget() {
    int expensesInOtherDays = 0;
    DateTime today = DateTime.now();
    var expensesFromNotToday =
        expensesList.where((expense) => !expense.expenseDate.isSameDate(today));
    for (ExpenseModel expense in expensesFromNotToday) {
      expensesInOtherDays += expense.expenseSum;
    }
    return initialBudgetSum - expensesInOtherDays;
  }

  // Return number of days from today till the end of the budget
  int getLeftDays() {
    int millisecondsToEndDate = budgetEndDate.millisecondsSinceEpoch;
    int millisecondsToToday = DateTime.now().millisecondsSinceEpoch;
    int millisecondsFromStartToEndDate =
        millisecondsToEndDate - millisecondsToToday;
    int millisecondsInOneDay = 86400000;
    return (millisecondsFromStartToEndDate / millisecondsInOneDay).ceil();
  }

  factory BudgetModel.fromJson(Map<String, dynamic> jsonData) {
    var list = jsonData['expensesList'] as List;
    List<ExpenseModel> expensesList =
        list.map((i) => ExpenseModel.fromJson(i)).toList();
    return BudgetModel(
      initialBudgetSum: jsonData['initialBudgetSum'],
      budgetEndDate: DateTime.parse(jsonData['budgetEndDate']),
      expensesList: expensesList,
    );
  }

  Map<String, dynamic> toMap() {
    List expensesListMapped = [];

    for (var expense in expensesList) {
      expensesListMapped.add(expense.toDocument());
    }
    return {
      'initialBudgetSum': initialBudgetSum,
      'budgetEndDate': budgetEndDate.toString(),
      'expensesList': expensesListMapped,
    };
  }

  static String encode(BudgetModel budgetModel) {
    return json.encode(budgetModel.toMap());
  }

  static BudgetModel decode(String? budgetModel) {
    return BudgetModel.fromJson(json.decode(budgetModel ?? ""));
  }

  @override
  List<Object> get props => [
        initialBudgetSum,
        budgetEndDate,
        expensesList,
      ];
}
