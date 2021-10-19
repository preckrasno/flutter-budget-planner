import 'package:budget_planner2/bloc/main_bloc/main_bloc.dart';
import 'package:budget_planner2/ui/pages/widgets/main_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  int? perDaySum;

  TextEditingController expenseController = TextEditingController();
  TextEditingController totalSumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MainBloc mainBloc = BlocProvider.of<MainBloc>(context);

    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state is MainCalculatedState) {
          perDaySum = state.perDaySum;
        }
        return MainPageWidget(
          onDateChose: (value) => _addedEndDate(mainBloc, value),
          onExpenseEnter: (value) => _addedExpense(mainBloc, value),
          onTotalSumEnter: (value) => _enteredTotalDeposit(mainBloc, value),
          perDaySum: perDaySum,
          expenseController: expenseController,
          totalSumController: totalSumController,
        );
      },
    );
  }

  _addedEndDate(
    MainBloc bloc,
    DateTime date,
  ) {
    bloc.add(MainDatePickedEvent(date));
  }

  _addedExpense(
    MainBloc bloc,
    int expense,
  ) {
    bloc.add(MainExpensesEnteredEvent(expense));
  }

  _enteredTotalDeposit(
    MainBloc bloc,
    int totalSum,
  ) {
    bloc.add(MainTotalSumEnteredEvent(totalSum));
  }
}
