import 'package:bloc/bloc.dart';
import 'package:budget_planner2/data/models/budget_model.dart';
import 'package:budget_planner2/data/repositories/budget/budget_repository_implementation.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  BudgetModel? budgetModel;

  final BudgetRepositoryImplementation _budgetRepositoryImplementation;

  HomeBloc(
    this._budgetRepositoryImplementation,
  ) : super(const HomeInitial()) {
    on<LoadingEvent>(_onLoadingEvent);
    on<EndDatePickedEvent>(_onEndDatePickedEvent);
    on<ExpenseEntryEvent>(_onExpenseEntryEvent);
    on<ExpenseListOpenEvent>(_onExpenseListOpenEvent);
    on<TotalSumEnteredEvent>(_onTotalSumEnteredEvent);
  }

  _onLoadingEvent(LoadingEvent event, Emitter<HomeState> emit) async {
    budgetModel = await _budgetRepositoryImplementation.getItemsFromStorage();
    emit(HomeCalculatedState(budgetModel!));
  }

  Future<void> _onTotalSumEnteredEvent(
      TotalSumEnteredEvent event, Emitter<HomeState> emit) async {
    if (budgetModel != null) {
      budgetModel!.initialBudgetSum = event.totalSum;
      await _budgetRepositoryImplementation.saveItemsToStorage(budgetModel!);
      emit(HomeCalculatedState(budgetModel!));
    } else {
      emit(const UnInitializedBudgetState());
    }
  }

  Future<void> _onEndDatePickedEvent(
      EndDatePickedEvent event, Emitter<HomeState> emit) async {
    if (budgetModel != null) {
      budgetModel!.budgetEndDate = event.endDate;
      await _budgetRepositoryImplementation.saveItemsToStorage(budgetModel!);
      emit(HomeCalculatedState(budgetModel!));
    } else {
      emit(const UnInitializedBudgetState());
    }
  }

  void _onExpenseEntryEvent(ExpenseEntryEvent event, Emitter<HomeState> emit) {
    emit(OpenExpenseEntryState(event.budget));
    add(const LoadingEvent());
  }

  void _onExpenseListOpenEvent(
      ExpenseListOpenEvent event, Emitter<HomeState> emit) {
    emit(const OpenExpenseListState());
  }
}
