import 'package:budget_planner2/data/budget_storage.dart';
import 'package:budget_planner2/data/repositories/budget/budget_repository.dart';

class BudgetRepositoryImplementation implements BudgetRepository {
  final BudgetStorage _budgetStorage = BudgetStorage();

  @override
  clearStorage() async {
    await _budgetStorage.clearStorage();
  }

  @override
  getItemsFromStorage() async {
    return await _budgetStorage.getBudgetItems();
  }

  @override
  saveItemsToStorage(budget) async {
    await _budgetStorage.saveBudgetItems(budget);
  }
}
