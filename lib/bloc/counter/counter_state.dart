part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  final int value;

  const CounterState(this.value);
}

class CounterInitial extends CounterState {
  final int value;

  const CounterInitial(this.value) : super(value);

  @override
  List<Object> get props => [value];
}

class CounterChanged extends CounterState {
  final int value;

  const CounterChanged(this.value) : super(value);

  @override
  List<Object> get props => [value];
}
