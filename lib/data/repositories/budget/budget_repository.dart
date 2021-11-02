import 'package:budget_planner2/data/models/budget_model.dart';

abstract class BudgetRepository {
  saveItemsToStorage(BudgetModel budget);

  getItemsFromStorage();

  clearStorage();
}
