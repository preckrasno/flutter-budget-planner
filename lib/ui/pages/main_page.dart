import 'package:budget_planner2/bloc/main_bloc/main_bloc.dart';
import 'package:budget_planner2/data/models/expense_model.dart';
import 'package:budget_planner2/ui/pages/widgets/main_page_widget.dart';
import 'package:budget_planner2/ui/pages/widgets/select_date_sum_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  TextEditingController expenseController = TextEditingController();
  TextEditingController totalSumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MainBloc mainBloc = BlocProvider.of<MainBloc>(context);

    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state is MainInitial) {
          return SelectDateSumWidget(
              onSubmit: (value) => _submitBudget(mainBloc, value),
              totalSumController: totalSumController);
        }
        if (state is MainLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MainCalculatedState) {
          return MainPageWidget(
              onEndDateChose: (value) => _addedEndDate(mainBloc, value),
              onStartDateChose: (value) => _addedStartDate(mainBloc, value),
              onExpenseEnter: (value) => _addedExpense(mainBloc, value),
              onTotalSumEnter: (value) => _enteredTotalSum(mainBloc, value),
              budgetModel: state.budgetModel,
              expenseController: expenseController,
              totalSumController: totalSumController);
        }
        throw ArgumentError('MainState not expected');
      },
    );
  }

  _submitBudget(bloc, budgetModel) {
    bloc.add(MainSubmitEvent(budgetModel));
  }

  _addedEndDate(
    MainBloc bloc,
    DateTime date,
  ) {
    bloc.add(MainEndDatePickedEvent(date));
  }

  _addedStartDate(
    MainBloc bloc,
    DateTime date,
  ) {
    bloc.add(MainStartDatePickedEvent(date));
  }

  _addedExpense(
    MainBloc bloc,
    ExpenseModel expense,
  ) {
    bloc.add(MainExpensesEnteredEvent(expense));
  }

  _enteredTotalSum(
    MainBloc bloc,
    int totalSum,
  ) {
    bloc.add(MainTotalSumEnteredEvent(totalSum));
  }
}
