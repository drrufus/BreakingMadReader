import 'package:fish_redux/fish_redux.dart';
import 'package:zond/models/article.dart';

//TODO replace with your own action
enum FavsActions {
  addToFavs,
  removeFromFavs
}

class FavsActionsCreator {
  static Action addToFavs(Article article) => Action(FavsActions.addToFavs, payload: article);
  static Action removeFromFavs(Article article) => Action(FavsActions.removeFromFavs, payload: article);
}
