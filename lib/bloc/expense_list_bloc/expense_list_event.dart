part of 'expense_list_bloc.dart';

abstract class ExpenseListEvent extends Equatable {
  const ExpenseListEvent();

  @override
  List<Object> get props => [];
}

class LoadingEvent extends ExpenseListEvent {
  const LoadingEvent();

  @override
  List<Object> get props => [];
}
