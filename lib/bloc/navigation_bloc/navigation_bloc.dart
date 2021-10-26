import 'package:bloc/bloc.dart';
import 'package:budget_planner2/data/models/budget_model.dart';
import 'package:budget_planner2/data/repositories/budget/budget_repository_implementation.dart';
import 'package:equatable/equatable.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final BudgetRepositoryImplementation _budgetRepositoryImplementation;

  NavigationBloc(this._budgetRepositoryImplementation) : super(LoadingState()) {
    on<LoadingEvent>(_onLoadingEvent);
  }

  _onLoadingEvent(LoadingEvent event, Emitter<NavigationState> emit) async {
    BudgetModel? budgetModel =
        await _budgetRepositoryImplementation.getItemsFromStorage();
    if (budgetModel == null) {
      emit(BudgetNotAvailableState());
    } else {
      emit(BudgetIsAvailableState(budgetModel));
    }
  }
}
