part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();

  @override
  List<Object?> get props => [];
}

class HomeCalculatedState extends HomeState {
  const HomeCalculatedState(this.budgetModel);

  final BudgetModel budgetModel;

  @override
  List<Object?> get props => [budgetModel];
}

class ExpenseRouteClickedState extends HomeState {
  const ExpenseRouteClickedState(this.budget);

  final BudgetModel budget;
  @override
  List<Object?> get props => [budget];
}
