part of 'budget_creation_bloc.dart';

abstract class BudgetCreationEvent extends Equatable {
  const BudgetCreationEvent();

  @override
  List<Object> get props => [];
}

class BudgetSubmitEvent extends BudgetCreationEvent {
  final BudgetModel budget;
  const BudgetSubmitEvent(this.budget);

  @override
  List<Object> get props => [budget];
}
