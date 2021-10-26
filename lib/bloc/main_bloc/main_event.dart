part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class MainLoadingBudgetEvent extends MainEvent {
  @override
  List<Object> get props => [];
}

class MainEndDatePickedEvent extends MainEvent {
  final DateTime endDate;
  const MainEndDatePickedEvent(this.endDate);

  @override
  List<Object> get props => [endDate];
}

class MainStartDatePickedEvent extends MainEvent {
  final DateTime startDate;
  const MainStartDatePickedEvent(this.startDate);

  @override
  List<Object> get props => [startDate];
}

class MainExpensesEnteredEvent extends MainEvent {
  final ExpenseModel expense;
  const MainExpensesEnteredEvent(this.expense);

  @override
  List<Object> get props => [expense];
}

class MainSubmitEvent extends MainEvent {
  final BudgetModel budgetModel;
  const MainSubmitEvent(this.budgetModel);

  @override
  List<Object> get props => [budgetModel];
}

class MainTotalSumEnteredEvent extends MainEvent {
  final int totalSum;
  const MainTotalSumEnteredEvent(this.totalSum);

  @override
  List<Object> get props => [totalSum];
}
