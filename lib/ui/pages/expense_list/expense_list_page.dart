import 'package:budget_planner2/bloc/expense_list_bloc/expense_list_bloc.dart';
import 'package:budget_planner2/ui/widgets/expense_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpenseListPage extends StatelessWidget {
  const ExpenseListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ExpenseListBloc expenseListBloc = context.read<ExpenseListBloc>();
    return BlocBuilder<ExpenseListBloc, ExpenseListState>(
      builder: (context, state) {
        if (state is ExpenseListInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoadedState) {
          return ExpenseListWidget(
            budget: state.budget,
            onDelete: (id) => _deletePressed(expenseListBloc, id),
          );
        }
        throw ArgumentError('$state is unhandled');
      },
    );
  }

  _deletePressed(ExpenseListBloc bloc, id) {
    bloc.add(RemoveExpenseEvent(id));
  }
}
