part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class MainInitial extends MainState {
  @override
  List<Object> get props => [];
}

class MainCalculatedState extends MainState {
  final int perDaySum;
  const MainCalculatedState(this.perDaySum);

  @override
  List<Object> get props => [perDaySum];
}
