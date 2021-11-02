import 'package:budget_planner2/data/models/budget_model.dart';
import 'package:flutter/material.dart';

class BudgetCreationWidget extends StatefulWidget {
  BudgetCreationWidget({
    required this.onSubmit,
    required this.totalSumController,
    Key? key,
  }) : super(key: key);

  final TextEditingController totalSumController;
  final void Function(BudgetModel) onSubmit;

  @override
  _BudgetCreationWidgetState createState() => _BudgetCreationWidgetState();
}

class _BudgetCreationWidgetState extends State<BudgetCreationWidget> {
  final DateTime todayDate = DateTime.now();
  DateTime? pickedEndDate;
  DateTime? pickedStartDate;
  void Function()? some;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _selectEndDate(BuildContext context) async {
    pickedEndDate = await showDatePicker(
      context: context,
      initialDate: todayDate,
      firstDate: todayDate,
      lastDate: DateTime(2023),
    );
    if (pickedEndDate != null) {
      setState(() {
        some = _onPressed;
      });
    }
  }

  _onPressed() {
    if (_formKey.currentState!.validate()) {
      _getBudget(pickedEndDate, widget.totalSumController.text);
    }
  }

  _getBudget(DateTime? endDate, String? totalSum) {
    if (endDate != null && totalSum != null) {
      BudgetModel budget = BudgetModel(
        initialBudgetSum: int.parse(totalSum),
        budgetEndDate: endDate,
        expensesList: [],
      );
      widget.onSubmit(budget);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => _selectEndDate(context),
            child: const Text('Select End Date'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 150,
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Text is empty';
                      }
                    },
                    keyboardType: TextInputType.number,
                    controller: widget.totalSumController,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: some,
                child: const Text('Submit'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class BudgetCreationWidget extends StatelessWidget {
//   BudgetCreationWidget({
//     required this.onSubmit,
//     required this.totalSumController,
//     Key? key,
//   }) : super(key: key);

//   final TextEditingController totalSumController;
//   final void Function(BudgetModel) onSubmit;
//   final DateTime todayDate = DateTime.now();
//   DateTime? pickedEndDate;
//   DateTime? pickedStartDate;
//   void Function()? some;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   _selectEndDate(BuildContext context) async {
//     pickedEndDate = await showDatePicker(
//       context: context,
//       initialDate: todayDate,
//       firstDate: todayDate,
//       lastDate: DateTime(2023),
//     );
//     if (pickedEndDate != null) {
//       some = _onPressed;
//     }
//   }

//   _onPressed() {
//     if (_formKey.currentState!.validate()) {
//       _getBudget(pickedEndDate, totalSumController.text);
//     }
//   }

//   _getBudget(DateTime? endDate, String? totalSum) {
//     if (endDate != null && totalSum != null) {
//       BudgetModel budget = BudgetModel(
//         initialBudgetSum: int.parse(totalSum),
//         budgetEndDate: endDate,
//         expensesList: [],
//       );
//       onSubmit(budget);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             onPressed: () => _selectEndDate(context),
//             child: const Text('Select End Date'),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               SizedBox(
//                 width: 150,
//                 child: Form(
//                   key: _formKey,
//                   child: TextFormField(
//                     validator: (text) {
//                       if (text == null || text.isEmpty) {
//                         return 'Text is empty';
//                       }
//                     },
//                     keyboardType: TextInputType.number,
//                     controller: totalSumController,
//                   ),
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: some,
//                 child: const Text('Submit'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
