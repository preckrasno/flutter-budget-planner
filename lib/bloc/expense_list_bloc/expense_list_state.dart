part of 'expense_list_bloc.dart';

abstract class ExpenseListState extends Equatable {
  const ExpenseListState();

  @override
  List<Object> get props => [];
}

class ExpenseListInitial extends ExpenseListState {}

class LoadedState extends ExpenseListState {
  final BudgetModel budget;
  const LoadedState(this.budget);

  @override
  List<Object> get props => [budget];
}
