import 'package:bloc/bloc.dart';
import 'package:budget_planner2/data/models/budget_model.dart';
import 'package:budget_planner2/data/repositories/budget/budget_repository_implementation.dart';
import 'package:equatable/equatable.dart';

part 'expense_list_event.dart';
part 'expense_list_state.dart';

class ExpenseListBloc extends Bloc<ExpenseListEvent, ExpenseListState> {
  final BudgetRepositoryImplementation _budgetRepositoryImplementation;
  BudgetModel? budgetModel;

  ExpenseListBloc(this._budgetRepositoryImplementation)
      : super(ExpenseListInitial()) {
    on<LoadingEvent>(_onLoadingEvent);
  }

  _onLoadingEvent(LoadingEvent event, Emitter<ExpenseListState> emit) async {
    budgetModel = await _budgetRepositoryImplementation.getItemsFromStorage();
    emit(LoadedState(budgetModel!));
  }
}
