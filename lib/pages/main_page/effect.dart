import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import './state.dart';

Effect<AppState> buildEffect() {
  return combineEffects(<Object, Effect<AppState>>{
    FavsActions.addToFavs: _onAdd,
  });
}

void _onAdd(Action action, Context<AppState> ctx) {
  // nothing to do here for now...
}
