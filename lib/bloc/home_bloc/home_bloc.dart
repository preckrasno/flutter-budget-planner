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
  ) : super(HomeInitial()) {
    on<EndDatePickedEvent>(_onEndDatePickedEvent);
    on<StartDatePickedEvent>(_onStartDatePickedEvent);
    on<ExpenseClickedEvent>(_onExpenseClickedEvent);
    // on<SubmitEvent>(_onSubmitEvent);
    on<TotalSumEnteredEvent>(_onTotalSumEnteredEvent);
  }

  Future<void> _onTotalSumEnteredEvent(
      TotalSumEnteredEvent event, Emitter<HomeState> emit) async {
    if (budgetModel != null) {
      budgetModel!.initialBudgetSum = event.totalSum;
      await _budgetRepositoryImplementation.saveItemsToStorage(budgetModel!);
      emit(HomeCalculatedState(budgetModel!));
    } else {
      emit(HomeInitial());
    }
  }

  Future<void> _onEndDatePickedEvent(
      EndDatePickedEvent event, Emitter<HomeState> emit) async {
    if (budgetModel != null) {
      budgetModel!.budgetEndDate = event.endDate;
      await _budgetRepositoryImplementation.saveItemsToStorage(budgetModel!);
      emit(HomeCalculatedState(budgetModel!));
    } else {
      emit(HomeInitial());
    }
  }

  Future<void> _onStartDatePickedEvent(
      StartDatePickedEvent event, Emitter<HomeState> emit) async {
    if (budgetModel != null) {
      budgetModel!.budgetStartDate = event.startDate;
      await _budgetRepositoryImplementation.saveItemsToStorage(budgetModel!);
      emit(HomeCalculatedState(budgetModel!));
    } else {
      emit(HomeInitial());
    }
  }

  // Future<void> _onSubmitEvent(
  //     SubmitEvent event, Emitter<HomeState> emit) async {
  //   budgetModel = event.budgetModel;
  //   await _budgetRepositoryImplementation.saveItemsToStorage(budgetModel!);
  //   emit(HomeCalculatedState(budgetModel!));
  // }

  void _onExpenseClickedEvent(
      ExpenseClickedEvent event, Emitter<HomeState> emit) {
    emit(ExpenseRouteClickedState(event.budget));
  }
}
