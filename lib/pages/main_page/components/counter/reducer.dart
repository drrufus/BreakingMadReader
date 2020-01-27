import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CounterState> buildReducer() {
  return asReducer(
    <Object, Reducer<CounterState>>{
      counterAction.increment: _onAction,
    },
  );
}

CounterState _onAction(CounterState state, Action action) {
  final CounterState newState = state.clone()..someCount = state.someCount + 1;
  return newState;
}
