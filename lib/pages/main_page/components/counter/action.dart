import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum counterAction { increment }

class counterActionCreator {
  static Action onIncrement() => Action(counterAction.increment);
}
