import 'package:fish_redux/fish_redux.dart';
import 'package:zond/pages/main_page/components/counter/state.dart';
import 'package:zond/pages/main_page/state.dart';

class CounterConnector extends ConnOp<AppState, CounterState> {
  @override
  CounterState get(AppState state) => state.counter;

  @override
  void set(AppState state, CounterState subState) => state.counter = subState;
}