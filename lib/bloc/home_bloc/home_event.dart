part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadingEvent extends HomeEvent {
  const LoadingEvent();

  @override
  List<Object> get props => [];
}

class EndDatePickedEvent extends HomeEvent {
  final DateTime endDate;
  const EndDatePickedEvent(this.endDate);

  @override
  List<Object> get props => [endDate];
}

class StartDatePickedEvent extends HomeEvent {
  final DateTime startDate;
  const StartDatePickedEvent(this.startDate);

  @override
  List<Object> get props => [startDate];
}

class ExpenseClickedEvent extends HomeEvent {
  const ExpenseClickedEvent(this.budget);

  final BudgetModel budget;

  @override
  List<Object> get props => [budget];
}

// class SubmitEvent extends HomeEvent {
//   final BudgetModel budgetModel;
//   const SubmitEvent(this.budgetModel);

//   @override
//   List<Object> get props => [budgetModel];
// }

class TotalSumEnteredEvent extends HomeEvent {
  final int totalSum;
  const TotalSumEnteredEvent(this.totalSum);

  @override
  List<Object> get props => [totalSum];
}
