part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();

  @override
  List<Object> get props => [];
}

class HomeCalculatedState extends HomeState {
  const HomeCalculatedState(this.budget);

  final BudgetModel budget;

  @override
  List<Object> get props => [budget];
}

class OpenExpenseEntryState extends HomeState {
  const OpenExpenseEntryState(this.budget);

  final BudgetModel budget;

  @override
  List<Object> get props => [budget];
}

class OpenExpenseListState extends HomeState {
  const OpenExpenseListState();

  @override
  List<Object> get props => [];
}

class UnInitializedBudgetState extends HomeState {
  const UnInitializedBudgetState();

  @override
  List<Object> get props => [];
}
