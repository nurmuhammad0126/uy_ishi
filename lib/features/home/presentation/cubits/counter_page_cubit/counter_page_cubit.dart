import 'package:bloc/bloc.dart';

import 'counter_page_state.dart';

class CounterPageCubit extends Cubit<CounterPageState> {
  CounterPageCubit() : super(CounterPageState(counter: 0));

  void increment() {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void decrement() {
    emit(state.copyWith(counter: state.counter - 1));
  }

  void endOnBoarding() {
    emit(state.copyWith(counter: state.counter = 0));
  }
}
