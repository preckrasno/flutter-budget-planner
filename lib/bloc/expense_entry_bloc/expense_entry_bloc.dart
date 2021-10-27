import 'package:bloc/bloc.dart';
import 'package:budget_planner2/data/models/expense_model.dart';
import 'package:equatable/equatable.dart';

part 'expense_entry_event.dart';
part 'expense_entry_state.dart';

class ExpenseEntryBloc extends Bloc<ExpenseEntryEvent, ExpenseEntryState> {
  ExpenseEntryBloc() : super(ExpenseEntryInitial()) {
    on<ExpenseEntryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
