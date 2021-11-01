import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class ExpenseModel extends Equatable {
  final DateTime expenseDate;
  final int expenseSum;
  late final String id;

  static const uuid = Uuid();
  final uuidV4 = uuid.v4();

  ExpenseModel({
    required this.expenseDate,
    required this.expenseSum,
    id,
  }) {
    if (id == null) {
      this.id = uuidV4;
    } else {
      this.id = id;
    }
  }

  Map<String, dynamic> toDocument() {
    return {
      'spentSum': expenseSum,
      'spentDate': expenseDate.toString(),
    };
  }

  factory ExpenseModel.fromJson(Map<String, dynamic> jsonData) {
    return ExpenseModel(
      expenseSum: jsonData['spentSum'],
      expenseDate: DateTime.parse(jsonData['spentDate']),
      id: jsonData['id'],
    );
  }

  @override
  List<Object> get props => [expenseDate, expenseSum, id];
}
