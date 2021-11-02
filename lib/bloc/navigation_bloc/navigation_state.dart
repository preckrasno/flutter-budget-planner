part of 'navigation_bloc.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class NavigationInitial extends NavigationState {
  const NavigationInitial();

  @override
  List<Object> get props => [];
}

class BudgetNotAvailableState extends NavigationState {
  const BudgetNotAvailableState();

  @override
  List<Object> get props => [];
}

class BudgetIsAvailableState extends NavigationState {
  const BudgetIsAvailableState();

  @override
  List<Object> get props => [];
}

class LoadingState extends NavigationState {}
