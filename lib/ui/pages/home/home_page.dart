import 'package:budget_planner2/bloc/home_bloc/home_bloc.dart';
import 'package:budget_planner2/data/models/budget_model.dart';
import 'package:budget_planner2/data/models/expense_model.dart';
import 'package:budget_planner2/navigation/app_navigation.dart';
import 'package:budget_planner2/ui/widgets/home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage(this.budget, {Key? key}) : super(key: key);

  BudgetModel budget;
  // TextEditingController expenseController = TextEditingController();
  TextEditingController totalSumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);

    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is ExpenseRouteClickedState) {
          AppNavigation.openExpensePage(context, budget);
        }
      },
      builder: (context, state) {
        if (state is HomeCalculatedState) {
          budget = state.budgetModel;
        }
        return HomePageWidget(
            onEndDateChose: (value) => _addedEndDate(homeBloc, value),
            onStartDateChose: (value) => _addedStartDate(homeBloc, value),
            onExpenseAdd: (value) => _addExpense(homeBloc, value),
            onTotalSumEnter: (value) => _enteredTotalSum(homeBloc, value),
            budgetModel: budget,
            // expenseController: expenseController,
            totalSumController: totalSumController);

        // throw ArgumentError('HomeState not expected');
      },
    );
  }

  _addedEndDate(
    HomeBloc bloc,
    DateTime date,
  ) {
    bloc.add(EndDatePickedEvent(date));
  }

  _addedStartDate(
    HomeBloc bloc,
    DateTime date,
  ) {
    bloc.add(StartDatePickedEvent(date));
  }

  _addExpense(HomeBloc bloc, BudgetModel budget) {
    bloc.add(ExpenseClickedEvent(budget));
  }

  _enteredTotalSum(
    HomeBloc bloc,
    int totalSum,
  ) {
    bloc.add(TotalSumEnteredEvent(totalSum));
  }
}
