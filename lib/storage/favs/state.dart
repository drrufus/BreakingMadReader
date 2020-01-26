import 'package:fish_redux/fish_redux.dart';
import 'package:zond/models/article.dart';

class FavsState implements Cloneable<FavsState> {

  List<Article> favorites_list = [];

  @override
  FavsState clone() {
    return FavsState()
      ..favorites_list = favorites_list;
  }
}

FavsState initState(Map<String, dynamic> args) {
  return FavsState();
}
