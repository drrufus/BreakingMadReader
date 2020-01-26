import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<FavsState> buildEffect() {
  return combineEffects(<Object, Effect<FavsState>>{
    FavsActions.addToFavs: _onAdd,
  });
}

void _onAdd(Action action, Context<FavsState> ctx) {
  // nothing to do here for now...
}
