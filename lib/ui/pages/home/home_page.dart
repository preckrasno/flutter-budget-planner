import 'package:budget_planner2/bloc/home_bloc/home_bloc.dart';
import 'package:budget_planner2/data/models/budget_model.dart';
import 'package:budget_planner2/navigation/app_navigation.dart';
import 'package:budget_planner2/ui/widgets/home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  TextEditingController totalSumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);

    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is OpenExpenseEntryState) {
          AppNavigation.openExpenseEntry(context, state.budget);
        }
        if (state is UnInitializedBudgetState) {
          AppNavigation.openBudgetCreation(context);
        }
        if (state is OpenExpenseListState) {
          AppNavigation.openExpenseList(context);
        }
      },
      buildWhen: (previousState, state) {
        if (state is HomeInitial || state is HomeCalculatedState) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        if (state is HomeInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is HomeCalculatedState) {
          return HomePageWidget(
            onEndDateChose: (value) => _addedEndDate(homeBloc, value),
            onExpenseAdd: (value) => _addExpense(homeBloc, value),
            onTotalSumEnter: (value) => _enteredTotalSum(homeBloc, value),
            budgetModel: state.budget,
            totalSumController: totalSumController,
            onExpenseList: () => _openExpenseList(homeBloc),
          );
        }
        throw ArgumentError('$state unhandled');
      },
    );
  }

  _addedEndDate(
    HomeBloc bloc,
    DateTime date,
  ) {
    bloc.add(EndDatePickedEvent(date));
  }

  _addExpense(HomeBloc bloc, BudgetModel budget) {
    bloc.add(ExpenseEntryEvent(budget));
  }

  _openExpenseList(HomeBloc bloc) {
    bloc.add(ExpenseListOpenEvent());
  }

  _enteredTotalSum(
    HomeBloc bloc,
    int totalSum,
  ) {
    bloc.add(TotalSumEnteredEvent(totalSum));
  }
}
