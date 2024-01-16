import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> with HydratedMixin {
  CounterBloc() : super(CounterState.initial()) {
    hydrate();
    on<IncrementCounterEvent>(_onIncrementCounter);
    on<DecrementCounterEvent>(_onDecrementCounter);
  }

  void _onIncrementCounter(
      IncrementCounterEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _onDecrementCounter(
      DecrementCounterEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter - 1));
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    print('counter from storage :$json');
    final counterstate = CounterState.fromJson(json);
    print('counterState: $counterstate');
    return counterstate;
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    print('counterstate to storage: $state');
    final counterJson = state.toJson();
    print('counterJson : $counterJson');
    return counterJson;
  }
}
