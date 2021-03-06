import 'package:budget_planner2/bloc/home_bloc/home_bloc.dart';
import 'package:budget_planner2/data/repositories/budget/budget_repository_implementation.dart';
import 'package:budget_planner2/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class HomeParentPage extends StatelessWidget {
  HomeParentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (_) => HomeBloc(
        Injector().get<BudgetRepositoryImplementation>(),
      )..add(const LoadingEvent()),
      child: HomePage(),
    );
  }
}
