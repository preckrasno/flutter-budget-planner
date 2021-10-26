import 'package:budget_planner2/bloc/budget_creation/budget_creation_bloc.dart';
import 'package:budget_planner2/navigation/app_navigation.dart';
import 'package:budget_planner2/ui/widgets/budget_creation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BudgetCreationPage extends StatelessWidget {
  TextEditingController totalSumController = TextEditingController();

  BudgetCreationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BudgetCreationBloc budgetCreationBloc =
        BlocProvider.of<BudgetCreationBloc>(context);

    return BlocConsumer<BudgetCreationBloc, BudgetCreationState>(
      listener: (context, state) {
        if (state is BudgetCreatedState) {
          AppNavigation.openHomePage(context, state.budget);
        }
      },
      buildWhen: (previousState, state) {
        if (state is BudgetCreationInitial) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        return BudgetCreationWidget(
          onSubmit: (value) => _submitBudget(budgetCreationBloc, value),
          totalSumController: totalSumController,
        );
      },
    );
  }

  _submitBudget(BudgetCreationBloc bloc, budget) {
    bloc.add(BudgetSubmitEvent(budget));
  }
}
