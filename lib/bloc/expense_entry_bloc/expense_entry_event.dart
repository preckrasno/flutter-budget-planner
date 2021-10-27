part of 'expense_entry_bloc.dart';

abstract class ExpenseEntryEvent extends Equatable {
  const ExpenseEntryEvent();

  @override
  List<Object> get props => [];
}

class AddedExpenseEvent extends ExpenseEntryEvent {
  const AddedExpenseEvent(this.expense);

  final ExpenseModel expense;

  @override
  List<Object> get props => [expense];
}
