import 'package:budget_planner2/bloc/expense_list_bloc/expense_list_bloc.dart';
import 'package:budget_planner2/data/repositories/budget/budget_repository_implementation.dart';
import 'package:budget_planner2/ui/pages/expense_list/expense_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class ExpenseListParentPage extends StatelessWidget {
  const ExpenseListParentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpenseListBloc(
        Injector().get<BudgetRepositoryImplementation>(),
      )..add(LoadingEvent()),
      child: ExpenseListPage(),
    );
  }
}
