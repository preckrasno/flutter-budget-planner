import 'package:bloc/bloc.dart';
import 'package:budget_planner2/data/models/budget_model.dart';
import 'package:budget_planner2/data/repositories/budget/budget_repository_implementation.dart';
import 'package:equatable/equatable.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  BudgetModel? budgetModel;

  final BudgetRepositoryImplementation _budgetRepositoryImplementation;

  MainBloc(this._budgetRepositoryImplementation) : super(MainLoadingState()) {
    on<MainLoadingBudgetEvent>(_onMainLoadingBudgetEvent);
    on<MainDatePickedEvent>(_onMainDatePickedEvent);
    on<MainExpensesEnteredEvent>(_onMainExpensesEnteredEvent);
    on<MainSubmitEvent>(_onMainSubmitEvent);
    on<MainTotalSumEnteredEvent>(_onMainTotalSumEnteredEvent);
  }

  Future<void> _onMainLoadingBudgetEvent(
      MainLoadingBudgetEvent event, Emitter<MainState> emit) async {
    emit(MainLoadingState());
    budgetModel = await _budgetRepositoryImplementation.getItemsFromStorage();
    if (budgetModel == null) {
      emit(MainInitial());
    } else {
      emit(MainCalculatedState(budgetModel!));
    }
  }

  Future<void> _onMainTotalSumEnteredEvent(
      MainTotalSumEnteredEvent event, Emitter<MainState> emit) async {
    if (budgetModel != null) {
      budgetModel!.totalSum = event.totalSum;
      budgetModel!.perDaySum =
          budgetModel!.totalSum ~/ budgetModel!.getLeftDays();
      await _budgetRepositoryImplementation.saveItemsToStorage(budgetModel!);
      emit(MainCalculatedState(budgetModel!));
    } else {
      emit(MainInitial());
    }
  }

  Future<void> _onMainDatePickedEvent(
      MainDatePickedEvent event, Emitter<MainState> emit) async {
    if (budgetModel != null) {
      budgetModel!.endDate = event.endDate;
      budgetModel!.perDaySum =
          budgetModel!.totalSum ~/ budgetModel!.getLeftDays();
      await _budgetRepositoryImplementation.saveItemsToStorage(budgetModel!);
      emit(MainCalculatedState(budgetModel!));
    } else {
      emit(MainInitial());
    }
  }

  Future<void> _onMainSubmitEvent(
      MainSubmitEvent event, Emitter<MainState> emit) async {
    event.budgetModel.perDaySum =
        event.budgetModel.totalSum ~/ event.budgetModel.getLeftDays();
    budgetModel = event.budgetModel;

    await _budgetRepositoryImplementation.saveItemsToStorage(budgetModel!);
    emit(MainCalculatedState(budgetModel!));
  }

  Future<void> _onMainExpensesEnteredEvent(
      MainExpensesEnteredEvent event, Emitter<MainState> emit) async {
    if (budgetModel != null) {
      budgetModel!.totalSum = budgetModel!.totalSum - event.expense;
      budgetModel!.perDaySum =
          budgetModel!.totalSum ~/ budgetModel!.getLeftDays();
      await _budgetRepositoryImplementation.saveItemsToStorage(budgetModel!);
      emit(MainCalculatedState(budgetModel!));
    } else {
      emit(MainInitial());
    }
  }
}
