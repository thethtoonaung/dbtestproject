import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<Increment>((event, emitt) {
      emitt(CounterState(counter: state.counter + 1));
    });
    on<Decrement>((event, emitt) {
      emitt(CounterState(counter: state.counter - 1));
    });
  }
}
