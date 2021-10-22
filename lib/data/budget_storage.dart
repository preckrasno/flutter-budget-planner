import 'package:budget_planner2/data/models/budget_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BudgetStorage {
  saveBudgetItems(BudgetModel budgetModel) async {
    final prefs = await SharedPreferences.getInstance();

    final String encodedData = BudgetModel.encode(budgetModel);
    await prefs.setString(budgetModelString, encodedData);
  }

  Future<BudgetModel?> getBudgetItems() async {
    final prefs = await SharedPreferences.getInstance();

    final String? itemString = prefs.getString(budgetModelString);
    if (itemString != null) {
      var item = BudgetModel.decode(itemString);
      return item;
    }
  }

  clearStorage() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(budgetModelString);
  }

  static const String budgetModelString = 'budget_model';
}
