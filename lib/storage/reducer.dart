import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AppState> buildReducer() {
  return asReducer(
    <Object, Reducer<AppState>>{
      FavsActions.addToFavs: _onAdd,
      FavsActions.removeFromFavs: _onRemove
    },
  );
}

AppState _onAdd(AppState state, Action action) {
  final AppState newState = state.clone()
    ..favorites_list = [...state.favorites_list, action.payload];
  print('Articles in favs: ${newState.favorites_list.length}');
  return newState;
}

AppState _onRemove(AppState state, Action action) {
  final AppState newState = state.clone()
    ..favorites_list = state.favorites_list.where((a) => a.title != action.payload.title).toList();
  return newState;
}