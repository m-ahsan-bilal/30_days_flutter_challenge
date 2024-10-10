import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/days/day%2020/counter_event.dart';
import 'package:flutter_challenge/days/day%2020/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0, counter: 0)) {
    // intial state counter of 0
    on<CounterIncrement>((event, emit) {
      emit(CounterState(state.counter + 1, counter: 0));
    });
    on<CounterDecrement>((event, emit) {
      emit(CounterState(state.counter - 1, counter: 0));
    });
  }
}
