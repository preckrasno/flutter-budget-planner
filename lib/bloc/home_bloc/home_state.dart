part of 'home_bloc.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {}

class HomeCalculatedState extends HomeState {
  final BudgetModel budgetModel;
  const HomeCalculatedState(this.budgetModel);
}
