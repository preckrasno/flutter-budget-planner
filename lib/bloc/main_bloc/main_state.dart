part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class MainInitial extends MainState {
  @override
  List<Object> get props => [];
}

class MainLoadingState extends MainState {
  @override
  List<Object> get props => [];
}

class MainCalculatedState extends MainState {
  final BudgetModel budgetModel;
  const MainCalculatedState(this.budgetModel);

  @override
  List<Object> get props => [budgetModel];
}
