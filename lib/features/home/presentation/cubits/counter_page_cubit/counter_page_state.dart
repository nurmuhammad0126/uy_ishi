final class CounterPageState {
  int counter;
  CounterPageState({required this.counter});

  CounterPageState copyWith({int? counter}) =>
      (CounterPageState(counter: counter ?? this.counter));
}
