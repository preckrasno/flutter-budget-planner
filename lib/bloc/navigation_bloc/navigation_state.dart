part of 'navigation_bloc.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class NavigationInitial extends NavigationState {}

class BudgetNotAvailableState extends NavigationState {}

class BudgetIsAvailableState extends NavigationState {
  final BudgetModel budget;
  const BudgetIsAvailableState(this.budget);

  @override
  List<Object> get props => [budget];
}

class LoadingState extends NavigationState {}
