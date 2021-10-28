part of 'expense_entry_bloc.dart';

abstract class ExpenseEntryState extends Equatable {
  const ExpenseEntryState();

  @override
  List<Object> get props => [];
}

class ExpenseEntryInitial extends ExpenseEntryState {
  const ExpenseEntryInitial();

  @override
  List<Object> get props => [];
}

class ExpenseAddedState extends ExpenseEntryState {
  const ExpenseAddedState();

  @override
  List<Object> get props => [];
}

class UnInitializedBudgetState extends ExpenseEntryState {
  const UnInitializedBudgetState();

  @override
  List<Object> get props => [];
}
