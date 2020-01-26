import 'package:fish_redux/fish_redux.dart';
import 'package:zond/models/article.dart';

class AppState implements Cloneable<AppState> {

  List<Article> favorites_list = [];

  @override
  AppState clone() {
    return AppState()
      ..favorites_list = favorites_list;
  }
}

AppState initState(Map<String, dynamic> args) {
  return AppState();
}
