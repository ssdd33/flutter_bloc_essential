part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;

  CounterState({required this.counter});
  factory CounterState.initial() {
    // final Map<String, dynamic>? json = HydratedBloc.storage.read('counter');
    // print('counterstate init, json from storage : $json');
    // return json != null
    //     ? CounterState.fromJson(json)
    //     : CounterState(counter: 0);
    return CounterState(counter: 0);
  }

  @override
  List<Object?> get props => [counter];

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }

  @override
  String toString() => 'CounterState(counter: $counter)';

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    result.addAll({'counter': counter});

    return result;
  }

  factory CounterState.fromJson(Map<String, dynamic> json) {
    return CounterState(
      counter: json['counter']?.toInt() ?? 0,
    );
  }
}
