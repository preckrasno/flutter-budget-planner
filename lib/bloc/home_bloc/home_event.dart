part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadingEvent extends HomeEvent {
  const LoadingEvent();
}

class EndDatePickedEvent extends HomeEvent {
  final DateTime endDate;
  const EndDatePickedEvent(this.endDate);

  @override
  List<Object> get props => [endDate];
}

class ExpenseEntryEvent extends HomeEvent {
  const ExpenseEntryEvent(this.budget);

  final BudgetModel budget;

  @override
  List<Object> get props => [budget];
}

class ExpenseListOpenEvent extends HomeEvent {
  const ExpenseListOpenEvent();
}

class TotalSumEnteredEvent extends HomeEvent {
  final int totalSum;
  const TotalSumEnteredEvent(this.totalSum);

  @override
  List<Object> get props => [totalSum];
}
