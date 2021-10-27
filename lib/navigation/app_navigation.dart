import 'package:budget_planner2/data/models/budget_model.dart';
import 'package:budget_planner2/ui/pages/budget_creation/budget_creation_parent_page.dart';
import 'package:budget_planner2/ui/pages/expense_entry/expense_entry_parent_page.dart';
import 'package:budget_planner2/ui/pages/home/home_parent_page.dart';
import 'package:flutter/material.dart';

class AppNavigation {
  static openBudgetCreation(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) {
        return BudgetCreationParentPage();
      }),
      (Route<dynamic> route) => false,
    );
  }

  static openHomePage(BuildContext context, BudgetModel budget) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) {
        return HomeParentPage(budget);
      }),
      (Route<dynamic> route) => false,
    );
  }

  static openExpensePage(BuildContext context, BudgetModel budget) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) {
        return ExpenseEntryParentPage(budget);
      }),
      (Route<dynamic> route) => false,
    );
  }
}
