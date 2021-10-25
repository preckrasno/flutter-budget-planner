part of 'main_bloc.dart';

abstract class MainState {
  const MainState();
}

class MainInitial extends MainState {}

class MainLoadingState extends MainState {}

class MainCalculatedState extends MainState {
  final BudgetModel budgetModel;
  const MainCalculatedState(this.budgetModel);
}
