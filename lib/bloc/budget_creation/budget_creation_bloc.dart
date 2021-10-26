import 'package:bloc/bloc.dart';
import 'package:budget_planner2/data/models/budget_model.dart';
import 'package:budget_planner2/data/repositories/budget/budget_repository_implementation.dart';
import 'package:equatable/equatable.dart';

part 'budget_creation_event.dart';
part 'budget_creation_state.dart';

class BudgetCreationBloc
    extends Bloc<BudgetCreationEvent, BudgetCreationState> {
  final BudgetRepositoryImplementation _budgetRepositoryImplementation;

  BudgetCreationBloc(
    this._budgetRepositoryImplementation,
  ) : super(BudgetCreationInitial()) {
    on<BudgetSubmitEvent>(_onBudgetSubmitEvent);
  }

  _onBudgetSubmitEvent(
      BudgetSubmitEvent event, Emitter<BudgetCreationState> emit) async {
    await _budgetRepositoryImplementation.saveItemsToStorage(event.budget);
    emit(BudgetCreatedState(event.budget));
  }
}
