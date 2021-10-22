import 'package:bloc/bloc.dart';
import 'package:budget_planner2/data/budget_storage.dart';
import 'package:budget_planner2/data/models/budget_model.dart';
import 'package:equatable/equatable.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  BudgetModel? budgetModel;

  final BudgetStorage _budgetStorage;

  MainBloc(this._budgetStorage) : super(MainLoadingState()) {
    on<MainLoadingBudgetEvent>(_onMainLoadingBudgetEvent);
    on<MainDatePickedEvent>(_onMainDatePickedEvent);
    on<MainExpensesEnteredEvent>(_onMainExpensesEnteredEvent);
    on<MainSubmitEvent>(_onMainSubmitEvent);
    on<MainTotalSumEnteredEvent>(_onMainTotalSumEnteredEvent);
  }

  Future<void> _onMainLoadingBudgetEvent(
      MainLoadingBudgetEvent event, Emitter<MainState> emit) async {
    emit(MainLoadingState());
    budgetModel = await _budgetStorage.getBudgetItems();
    if (budgetModel == null) {
      emit(MainInitial());
    } else {
      emit(MainCalculatedState(budgetModel!));
    }
  }

  void _onMainTotalSumEnteredEvent(
      MainTotalSumEnteredEvent event, Emitter<MainState> emit) {
    if (budgetModel != null) {
      budgetModel!.totalSum = event.totalSum;
      budgetModel!.perDaySum =
          budgetModel!.totalSum ~/ budgetModel!.getLeftDays();
      _budgetStorage.saveBudgetItems(budgetModel!);
      emit(MainCalculatedState(budgetModel!));
    } else {
      emit(MainInitial());
    }
  }

  void _onMainDatePickedEvent(
      MainDatePickedEvent event, Emitter<MainState> emit) {
    if (budgetModel != null) {
      budgetModel!.endDate = event.endDate;
      budgetModel!.perDaySum =
          budgetModel!.totalSum ~/ budgetModel!.getLeftDays();
      _budgetStorage.saveBudgetItems(budgetModel!);
      emit(MainCalculatedState(budgetModel!));
    } else {
      emit(MainInitial());
    }
  }

  void _onMainSubmitEvent(MainSubmitEvent event, Emitter<MainState> emit) {
    budgetModel = BudgetModel(
        totalSum: event.budgetModel.totalSum,
        endDate: event.budgetModel.endDate);
    budgetModel!.perDaySum =
        budgetModel!.totalSum ~/ budgetModel!.getLeftDays();

    _budgetStorage.saveBudgetItems(budgetModel!);
    emit(MainCalculatedState(budgetModel!));
  }

  void _onMainExpensesEnteredEvent(
      MainExpensesEnteredEvent event, Emitter<MainState> emit) {}

  _calculateBudget({endDate, totalSum = 0, expense}) {
    DateTime date = endDate ?? DateTime.now();
  }
}
