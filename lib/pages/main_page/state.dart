import 'package:fish_redux/fish_redux.dart';
import 'package:zond/models/article.dart';
import 'package:zond/pages/main_page/components/counter/state.dart';

class AppState implements Cloneable<AppState> {

  List<Article> favorites_list = [];
  CounterState counter;

  @override
  AppState clone() {
    return AppState()
      ..favorites_list = favorites_list
      ..counter = counter;
  }
}

AppState initState(Map<String, dynamic> args) {
  return AppState()
    ..counter = CounterState();
}
