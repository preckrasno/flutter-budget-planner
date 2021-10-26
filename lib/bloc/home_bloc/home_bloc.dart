import 'package:bloc/bloc.dart';
import 'package:budget_planner2/data/models/budget_model.dart';
import 'package:budget_planner2/data/models/expense_model.dart';
import 'package:budget_planner2/data/repositories/budget/budget_repository_implementation.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  BudgetModel? budgetModel;

  final BudgetRepositoryImplementation _budgetRepositoryImplementation;

  HomeBloc(
    this._budgetRepositoryImplementation,
  ) : super(HomeInitial()) {
    on<HomeEndDatePickedEvent>(_onHomeEndDatePickedEvent);
    on<HomeStartDatePickedEvent>(_onHomeStartDatePickedEvent);
    on<HomeExpensesEnteredEvent>(_onHomeExpensesEnteredEvent);
    on<HomeSubmitEvent>(_onHomeSubmitEvent);
    on<HomeTotalSumEnteredEvent>(_onHomeTotalSumEnteredEvent);
  }

  Future<void> _onHomeTotalSumEnteredEvent(
      HomeTotalSumEnteredEvent event, Emitter<HomeState> emit) async {
    if (budgetModel != null) {
      budgetModel!.initialBudgetSum = event.totalSum;
      await _budgetRepositoryImplementation.saveItemsToStorage(budgetModel!);
      emit(HomeCalculatedState(budgetModel!));
    } else {
      emit(HomeInitial());
    }
  }

  Future<void> _onHomeEndDatePickedEvent(
      HomeEndDatePickedEvent event, Emitter<HomeState> emit) async {
    if (budgetModel != null) {
      budgetModel!.budgetEndDate = event.endDate;
      await _budgetRepositoryImplementation.saveItemsToStorage(budgetModel!);
      emit(HomeCalculatedState(budgetModel!));
    } else {
      emit(HomeInitial());
    }
  }

  Future<void> _onHomeStartDatePickedEvent(
      HomeStartDatePickedEvent event, Emitter<HomeState> emit) async {
    if (budgetModel != null) {
      budgetModel!.budgetStartDate = event.startDate;
      await _budgetRepositoryImplementation.saveItemsToStorage(budgetModel!);
      emit(HomeCalculatedState(budgetModel!));
    } else {
      emit(HomeInitial());
    }
  }

  Future<void> _onHomeSubmitEvent(
      HomeSubmitEvent event, Emitter<HomeState> emit) async {
    budgetModel = event.budgetModel;
    await _budgetRepositoryImplementation.saveItemsToStorage(budgetModel!);
    emit(HomeCalculatedState(budgetModel!));
  }

  Future<void> _onHomeExpensesEnteredEvent(
      HomeExpensesEnteredEvent event, Emitter<HomeState> emit) async {
    if (budgetModel != null) {
      budgetModel!.expensesList.add(event.expense);
      await _budgetRepositoryImplementation.saveItemsToStorage(budgetModel!);
      emit(HomeCalculatedState(budgetModel!));
    } else {
      emit(HomeInitial());
    }
  }
}
