import 'dart:convert';

import 'package:budget_planner2/data/models/expense_model.dart';
import 'package:equatable/equatable.dart';

class BudgetModel extends Equatable {
  int initialBudgetSum;
  DateTime budgetEndDate;
  DateTime budgetStartDate;
  List<ExpenseModel> expensesList;

  BudgetModel({
    required this.initialBudgetSum,
    required this.budgetEndDate,
    required this.budgetStartDate,
    required this.expensesList,
  });

  int getLeftDays() {
    int millisecondsToEndDate = budgetEndDate.millisecondsSinceEpoch;
    int millisecondsToStartDate = budgetStartDate.millisecondsSinceEpoch;
    int millisecondsFromStartToEndDate =
        millisecondsToEndDate - millisecondsToStartDate;
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
      budgetStartDate: DateTime.parse(jsonData['budgetStartDate']),
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
      'budgetStartDate': budgetStartDate.toString(),
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
  List<Object?> get props => [
        initialBudgetSum,
        budgetEndDate,
        budgetStartDate,
        expensesList,
      ];
}
