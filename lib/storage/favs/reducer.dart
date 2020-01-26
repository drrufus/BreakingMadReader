import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<FavsState> buildReducer() {
  return asReducer(
    <Object, Reducer<FavsState>>{
      FavsActions.addToFavs: _onAdd,
    },
  );
}

FavsState _onAdd(FavsState state, Action action) {
  final FavsState newState = state.clone()
    ..favorites_list = [...state.favorites_list, action.payload];
  return newState;
}
