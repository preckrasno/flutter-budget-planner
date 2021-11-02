import 'package:budget_planner2/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:budget_planner2/data/repositories/budget/budget_repository_implementation.dart';
import 'package:budget_planner2/ui/pages/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class MainParentPage extends StatelessWidget {
  const MainParentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(
        Injector().get<BudgetRepositoryImplementation>(),
      )..add(LoadingEvent()),
      child: const MainPage(),
    );
  }
}
