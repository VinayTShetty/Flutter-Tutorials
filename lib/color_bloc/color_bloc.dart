import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement/color_bloc/color_state.dart';
import 'package:statemanagement/counter_bloc/counter_event.dart';
import 'package:statemanagement/counter_bloc/counter_state.dart';

class ColorBloc extends Bloc<CounterEvent, ColorState> {
  ColorBloc() : super(ColorInitialState()) {
    on<CounterIncrementEvent>((event, emit) {
      emit(ColorIncrementState(Colors.green));
    });
    on<CounterDecrementEvent>((event, emit) {
      emit(ColorDecrementState(Colors.red));
    });
  }
}
