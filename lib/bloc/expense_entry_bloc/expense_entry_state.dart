part of 'expense_entry_bloc.dart';

abstract class ExpenseEntryState extends Equatable {
  const ExpenseEntryState();

  @override
  List<Object> get props => [];
}

class ExpenseEntryInitial extends ExpenseEntryState {}

class ExpenseAddedState extends ExpenseEntryState {}
