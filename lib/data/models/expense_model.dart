import 'package:equatable/equatable.dart';

class ExpenseModel extends Equatable {
  final DateTime expenseDate;
  final int expenseSum;

  const ExpenseModel({
    required this.expenseDate,
    required this.expenseSum,
  });

  Map<String, dynamic> toDocument() {
    return {
      'spentSum': expenseSum,
      'spentDate': expenseDate.toString(),
    };
  }

  factory ExpenseModel.fromJson(Map<String, dynamic> jsonData) {
    return ExpenseModel(
      expenseSum: jsonData['spentSum'],
      expenseDate: DateTime.parse(jsonData['spentDate']),
    );
  }

  @override
  List<Object?> get props => [expenseDate, expenseSum];
}
