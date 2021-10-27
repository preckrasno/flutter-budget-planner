import 'package:budget_planner2/bloc/expense_entry_bloc/expense_entry_bloc.dart';
import 'package:budget_planner2/data/models/budget_model.dart';
import 'package:budget_planner2/data/models/expense_model.dart';
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

    return BlocBuilder<ExpenseEntryBloc, ExpenseEntryState>(
      builder: (context, state) {
        return ExpenseEntryWidget(
          budget: budget,
          expenseController: expenseController,
          onExpenseEnter: (value) => _addedExpense(expenseEntryBloc, value),
        );
      },
    );
  }

  _addedExpense(ExpenseEntryBloc bloc, ExpenseModel expense) {
    bloc.add(AddedExpenseEvent(expense));
  }
}
