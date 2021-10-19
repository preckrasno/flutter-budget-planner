import 'package:equatable/equatable.dart';

class BudgetModel extends Equatable {
  int? totalSum;
  DateTime? endDate;

  BudgetModel({
    this.totalSum,
    this.endDate,
  });

  @override
  List<Object?> get props => [totalSum, endDate];
}
