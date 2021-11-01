part of 'expense_list_bloc.dart';

abstract class ExpenseListEvent extends Equatable {
  const ExpenseListEvent();

  @override
  List<Object> get props => [];
}

class LoadingEvent extends ExpenseListEvent {
  const LoadingEvent();
}

class RemoveExpenseEvent extends ExpenseListEvent {
  final String expenseId;

  const RemoveExpenseEvent(this.expenseId);

  @override
  List<Object> get props => [expenseId];
}
