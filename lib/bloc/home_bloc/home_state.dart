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
  const HomeCalculatedState(this.budget);

  final BudgetModel budget;

  @override
  List<Object?> get props => [budget];
}

class ExpenseRouteClickedState extends HomeState {
  const ExpenseRouteClickedState(this.budget);

  final BudgetModel budget;
  @override
  List<Object?> get props => [budget];
}
