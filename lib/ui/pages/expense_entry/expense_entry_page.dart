import 'package:budget_planner2/bloc/expense_entry_bloc/expense_entry_bloc.dart';
import 'package:budget_planner2/data/models/budget_model.dart';
import 'package:budget_planner2/data/models/expense_model.dart';
import 'package:budget_planner2/navigation/app_navigation.dart';
import 'package:budget_planner2/ui/widgets/expense_entry_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpenseEntryPage extends StatelessWidget {
  ExpenseEntryPage(this.budget, {Key? key}) : super(key: key);

  final BudgetModel budget;
  TextEditingController expenseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ExpenseEntryBloc expenseEntryBloc =
        BlocProvider.of<ExpenseEntryBloc>(context);

    return BlocConsumer<ExpenseEntryBloc, ExpenseEntryState>(
      listener: (previousSate, state) {
        if (state is ExpenseAddedState) {
          AppNavigation.openHomePage(context);
        }
        if (state is UnInitializedBudgetState) {
          AppNavigation.openBudgetCreation(context);
        }
        if (state is ReturnBackState) {
          AppNavigation.openHomePage(context);
        }
      },
      builder: (context, state) {
        return ExpenseEntryWidget(
          budget: budget,
          expenseController: expenseController,
          onExpenseEnter: (value) => _addedExpense(expenseEntryBloc, value),
          onBack: () => _onBack(expenseEntryBloc),
        );
      },
    );
  }

  _addedExpense(ExpenseEntryBloc bloc, ExpenseModel expense) {
    bloc.add(AddedExpenseEvent(expense));
  }

  _onBack(ExpenseEntryBloc bloc) {
    bloc.add(const ReturnBackEvent());
  }
}
