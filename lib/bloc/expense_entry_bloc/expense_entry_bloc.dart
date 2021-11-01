import 'package:bloc/bloc.dart';
import 'package:budget_planner2/data/models/budget_model.dart';
import 'package:budget_planner2/data/models/expense_model.dart';
import 'package:budget_planner2/data/repositories/budget/budget_repository_implementation.dart';
import 'package:equatable/equatable.dart';

part 'expense_entry_event.dart';
part 'expense_entry_state.dart';

class ExpenseEntryBloc extends Bloc<ExpenseEntryEvent, ExpenseEntryState> {
  ExpenseEntryBloc(this._budgetRepositoryImplementation)
      : super(const ExpenseEntryInitial()) {
    on<AddedExpenseEvent>(_onBudgetSubmitEvent);
    on<ReturnBackEvent>(_onReturnBackEvent);
  }

  final BudgetRepositoryImplementation _budgetRepositoryImplementation;

  _onBudgetSubmitEvent(
      AddedExpenseEvent event, Emitter<ExpenseEntryState> emit) async {
    BudgetModel? budgetModel =
        await _budgetRepositoryImplementation.getItemsFromStorage();
    if (budgetModel != null) {
      budgetModel.expensesList.add(event.expense);
      await _budgetRepositoryImplementation.saveItemsToStorage(budgetModel);
      emit(const ExpenseAddedState());
    } else {
      emit(const UnInitializedBudgetState());
    }
  }

  _onReturnBackEvent(ReturnBackEvent event, Emitter<ExpenseEntryState> emit) {
    emit(const ReturnBackState());
  }
}
