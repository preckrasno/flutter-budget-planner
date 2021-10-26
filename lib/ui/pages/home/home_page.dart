import 'package:budget_planner2/bloc/home_bloc/home_bloc.dart';
import 'package:budget_planner2/data/models/budget_model.dart';
import 'package:budget_planner2/data/models/expense_model.dart';
import 'package:budget_planner2/ui/widgets/home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage(this.budget, {Key? key}) : super(key: key);

  BudgetModel budget;
  TextEditingController expenseController = TextEditingController();
  TextEditingController totalSumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeCalculatedState) {
          budget = state.budgetModel;
        }
        return HomePageWidget(
            onEndDateChose: (value) => _addedEndDate(homeBloc, value),
            onStartDateChose: (value) => _addedStartDate(homeBloc, value),
            onExpenseEnter: (value) => _addedExpense(homeBloc, value),
            onTotalSumEnter: (value) => _enteredTotalSum(homeBloc, value),
            budgetModel: budget,
            expenseController: expenseController,
            totalSumController: totalSumController);

        // throw ArgumentError('HomeState not expected');
      },
    );
  }

  _addedEndDate(
    HomeBloc bloc,
    DateTime date,
  ) {
    bloc.add(HomeEndDatePickedEvent(date));
  }

  _addedStartDate(
    HomeBloc bloc,
    DateTime date,
  ) {
    bloc.add(HomeStartDatePickedEvent(date));
  }

  _addedExpense(
    HomeBloc bloc,
    ExpenseModel expense,
  ) {
    bloc.add(HomeExpensesEnteredEvent(expense));
  }

  _enteredTotalSum(
    HomeBloc bloc,
    int totalSum,
  ) {
    bloc.add(HomeTotalSumEnteredEvent(totalSum));
  }
}
