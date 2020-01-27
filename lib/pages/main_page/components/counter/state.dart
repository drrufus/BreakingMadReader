import 'package:fish_redux/fish_redux.dart';

class CounterState implements Cloneable<CounterState> {

  int someCount = 0;

  @override
  CounterState clone() {
    return CounterState()
      ..someCount = someCount;
  }
}

CounterState initState(Map<String, dynamic> args) {
  return CounterState();
}
