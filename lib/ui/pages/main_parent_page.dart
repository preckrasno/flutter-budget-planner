import 'package:budget_planner2/bloc/main_bloc/main_bloc.dart';
import 'package:budget_planner2/data/repositories/budget/budget_repository_implementation.dart';
import 'package:budget_planner2/ui/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class MainParentPage extends StatelessWidget {
  const MainParentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainBloc>(
      create: (_) => MainBloc(
        Injector().get<BudgetRepositoryImplementation>(),
      )..add(MainLoadingBudgetEvent()),
      child: MainPage(),
    );
  }
}
