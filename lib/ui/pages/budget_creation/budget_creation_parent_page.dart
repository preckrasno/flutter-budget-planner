import 'package:budget_planner2/bloc/budget_creation/budget_creation_bloc.dart';
import 'package:budget_planner2/data/repositories/budget/budget_repository_implementation.dart';
import 'package:budget_planner2/ui/pages/budget_creation/budget_creation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class BudgetCreationParentPage extends StatelessWidget {
  const BudgetCreationParentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BudgetCreationBloc>(
      create: (context) => BudgetCreationBloc(
        Injector().get<BudgetRepositoryImplementation>(),
      ),
      child: BudgetCreationPage(),
    );
  }
}
