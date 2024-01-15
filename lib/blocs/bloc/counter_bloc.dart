import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    // on<IncrementCounterEvent>(_onIncrementCounter, transformer: sequential());
    // on<DecrementCounterEvent>(_onDecrementCounter, transformer: sequential());
    on<CounterEvent>((event, emit) async {
      if (event is IncrementCounterEvent) {
        await _onIncrementCounter(event, emit);
      } else if (event is DecrementCounterEvent) {
        await _onDecrementCounter(event, emit);
      }
    }, transformer: sequential());
  }

  Future<void> _onIncrementCounter(
      IncrementCounterEvent event, Emitter<CounterState> emit) async {
    await Future.delayed(Duration(seconds: 4));
    emit(state.copyWith(counter: state.counter + 1));
  }

  Future<void> _onDecrementCounter(
      DecrementCounterEvent event, Emitter<CounterState> emit) async {
    await Future.delayed(Duration(seconds: 2));
    emit(state.copyWith(counter: state.counter - 1));
  }
}
