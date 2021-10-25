import 'package:budget_planner2/data/budget_storage.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class InjectionModule {
  Injector initialize(Injector injector) {
    injector.map<BudgetStorage>(
      (injector) => BudgetStorage(),
      isSingleton: true,
    );

    return injector;
  }
}
