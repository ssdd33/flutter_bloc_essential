part of 'counter_cubit.dart';

class CounterState {
  final int counter;

  CounterState({required this.counter});

  factory CounterState.initial() {
    return CounterState(counter: 0);
  }

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }

  @override
  String toString() => 'CounterState(counter: $counter)';
}
