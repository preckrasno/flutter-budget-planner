import 'package:budget_planner2/data/budget_storage.dart';
import 'package:budget_planner2/data/models/budget_model.dart';
import 'package:budget_planner2/data/repositories/budget/budget_repository.dart';

class BudgetRepositoryImplementation implements BudgetRepository {
  final BudgetStorage _budgetStorage = BudgetStorage();

  @override
  Future<void> clearStorage() async {
    await _budgetStorage.clearStorage();
  }

  @override
  Future<BudgetModel?> getItemsFromStorage() async {
    return await _budgetStorage.getBudgetItems();
  }

  @override
  Future<void> saveItemsToStorage(budget) async {
    await _budgetStorage.saveBudgetItems(budget);
  }
}
