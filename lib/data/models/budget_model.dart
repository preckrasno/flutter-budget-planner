import 'dart:convert';

import 'package:equatable/equatable.dart';

class BudgetModel extends Equatable {
  int totalSum;
  DateTime endDate;
  int? perDaySum;

  BudgetModel({
    required this.totalSum,
    required this.endDate,
    this.perDaySum,
  });

  int getLeftDays() {
    int millisecondsToEndDate = endDate.millisecondsSinceEpoch;
    int millisecondsToNow = DateTime.now().millisecondsSinceEpoch;
    int millisecondsFromNowToEndDate =
        millisecondsToEndDate - millisecondsToNow;
    int millisecondsInOneDay = 86400000;
    return (millisecondsFromNowToEndDate / millisecondsInOneDay).ceil();
  }

  factory BudgetModel.fromJson(Map<String, dynamic> jsonData) {
    return BudgetModel(
      totalSum: jsonData['totalSum'],
      perDaySum: jsonData['perDaySum'],
      endDate: DateTime.parse(jsonData['endDate']),
    );
  }

  static Map<String, dynamic> toMap(BudgetModel budgetModel) {
    return {
      'totalSum': budgetModel.totalSum,
      'perDaySum': budgetModel.perDaySum,
      'endDate': budgetModel.endDate.toString(),
    };
  }

  static String encode(BudgetModel budgetModel) {
    return json.encode(BudgetModel.toMap(budgetModel));
  }

  static BudgetModel decode(String? budgetModel) {
    return BudgetModel.fromJson(json.decode(budgetModel ?? ""));
  }

  @override
  List<Object?> get props => [totalSum, endDate, perDaySum];
}
