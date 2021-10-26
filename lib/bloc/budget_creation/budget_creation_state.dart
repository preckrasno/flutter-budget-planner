part of 'budget_creation_bloc.dart';

abstract class BudgetCreationState extends Equatable {
  const BudgetCreationState();

  @override
  List<Object> get props => [];
}

class BudgetCreationInitial extends BudgetCreationState {}

class BudgetCreatedState extends BudgetCreationState {
  final BudgetModel budget;
  const BudgetCreatedState(this.budget);

  @override
  List<Object> get props => [budget];
}
