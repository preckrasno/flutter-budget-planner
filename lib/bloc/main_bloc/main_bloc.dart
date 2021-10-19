import 'package:bloc/bloc.dart';
import 'package:budget_planner2/data/models/budget_model.dart';
import 'package:equatable/equatable.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  BudgetModel budgetModel = BudgetModel();

  MainBloc() : super(MainInitial()) {
    on<MainDatePickedEvent>(_onMainDatePickedEvent);
    on<MainExpensesEnteredEvent>(_onMainExpensesEnteredEvent);
    on<MainTotalSumEnteredEvent>(_onMainTotalSumEnteredEvent);
  }

  void _onMainDatePickedEvent(
      MainDatePickedEvent event, Emitter<MainState> emit) {
    print('Date selected');
    budgetModel.endDate = event.endDate;
    print(((event.endDate.millisecondsSinceEpoch -
                DateTime.now().millisecondsSinceEpoch) /
            86400000)
        .ceil());
  }

  void _onMainTotalSumEnteredEvent(
      MainTotalSumEnteredEvent event, Emitter<MainState> emit) {
    budgetModel.totalSum = event.totalSum;
    int daysLeft = ((budgetModel.endDate!.millisecondsSinceEpoch -
                DateTime.now().millisecondsSinceEpoch) /
            86400000)
        .ceil();

    emit(MainCalculatedState(budgetModel.totalSum! ~/ daysLeft));
    print('${budgetModel.totalSum! ~/ daysLeft} total sum entered');
  }

  void _onMainExpensesEnteredEvent(
      MainExpensesEnteredEvent event, Emitter<MainState> emit) {
    print('expenses entered');
  }
}
