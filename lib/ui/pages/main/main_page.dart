import 'package:budget_planner2/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:budget_planner2/navigation/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationBloc, NavigationState>(
      listener: (context, state) {
        if (state is BudgetNotAvailableState) {
          AppNavigation.openBudgetCreation(context);
        }
        if (state is BudgetIsAvailableState) {
          AppNavigation.openHomePage(context, state.budget);
        }
      },
      buildWhen: (previousState, state) {
        if (state is LoadingState) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        throw ArgumentError('MainPage unhandled state');
      },
    );
  }
}
