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

class MainDatePickedEvent extends MainEvent {
  final DateTime endDate;
  const MainDatePickedEvent(this.endDate);

  @override
  List<Object> get props => [endDate];
}

class MainExpensesEnteredEvent extends MainEvent {
  final int expense;
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
