import 'package:budget_planner2/bloc/expense_entry_bloc/expense_entry_bloc.dart';
import 'package:budget_planner2/data/models/budget_model.dart';
import 'package:budget_planner2/data/repositories/budget/budget_repository_implementation.dart';
import 'package:budget_planner2/ui/pages/expense_entry/expense_entry_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class ExpenseEntryParentPage extends StatelessWidget {
  const ExpenseEntryParentPage(this.budget, {Key? key}) : super(key: key);

  final BudgetModel budget;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpenseEntryBloc(
        Injector().get<BudgetRepositoryImplementation>(),
      ),
      child: ExpenseEntryPage(budget),
    );
  }
}
