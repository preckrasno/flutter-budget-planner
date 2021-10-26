part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeEndDatePickedEvent extends HomeEvent {
  final DateTime endDate;
  const HomeEndDatePickedEvent(this.endDate);

  @override
  List<Object> get props => [endDate];
}

class HomeStartDatePickedEvent extends HomeEvent {
  final DateTime startDate;
  const HomeStartDatePickedEvent(this.startDate);

  @override
  List<Object> get props => [startDate];
}

class HomeExpensesEnteredEvent extends HomeEvent {
  final ExpenseModel expense;
  const HomeExpensesEnteredEvent(this.expense);

  @override
  List<Object> get props => [expense];
}

class HomeSubmitEvent extends HomeEvent {
  final BudgetModel budgetModel;
  const HomeSubmitEvent(this.budgetModel);

  @override
  List<Object> get props => [budgetModel];
}

class HomeTotalSumEnteredEvent extends HomeEvent {
  final int totalSum;
  const HomeTotalSumEnteredEvent(this.totalSum);

  @override
  List<Object> get props => [totalSum];
}
