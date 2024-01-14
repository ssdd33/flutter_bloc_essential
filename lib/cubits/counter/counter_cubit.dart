import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_block/cubits/color/color_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int incrementSize = 1;
  final ColorCubit colorCubit;
  late final StreamSubscription colorSubscription;
  CounterCubit({
    required this.colorCubit,
  }) : super(CounterState.initial()) {
    colorSubscription = colorCubit.stream.listen((ColorState colorState) {
      print(colorState.color.toString());
      if (colorState.color == Colors.red) {
        incrementSize = 1;
      }
      if (colorState.color == Colors.green) {
        incrementSize = 10;
      }
      if (colorState.color == Colors.blue) {
        incrementSize = 100;
      }
      if (colorState.color == Colors.black) {
        emit(state.copyWith(counter: state.counter - 100));
        incrementSize = -100;
      }
    });
  }

  @override
  Future<void> close() {
    colorSubscription.cancel();

    return super.close();
  }

  void changeCounter() {
    emit(state.copyWith(counter: state.counter + incrementSize));
  }
}
