import 'package:fish_redux/fish_redux.dart';

import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CounterComponent extends Component<CounterState> {
  CounterComponent()
      : super(
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<CounterState>(
              adapter: null, slots: <String, Dependent<CounterState>>{}),
        );
}
