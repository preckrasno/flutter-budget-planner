import 'package:budget_planner2/data/injection/injection_module.dart';
import 'package:budget_planner2/ui/pages/main/main_parent_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

void main() {
  InjectionModule().initialize(Injector());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainParentPage(),
    );
  }
}
