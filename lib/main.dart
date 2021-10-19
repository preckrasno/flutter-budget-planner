import 'package:budget_planner2/ui/pages/main_page.dart';
import 'package:budget_planner2/ui/pages/main_parent_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainParentPage(),
    );
  }
}
