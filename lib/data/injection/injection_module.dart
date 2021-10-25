import 'package:budget_planner2/data/repositories/budget/budget_repository_implementation.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class InjectionModule {
  Injector initialize(Injector injector) {
    injector.map<BudgetRepositoryImplementation>(
      (injector) => BudgetRepositoryImplementation(),
      isSingleton: true,
    );

    return injector;
  }
}
