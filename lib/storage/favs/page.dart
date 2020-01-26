import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class favorites_listPage
    extends Page<FavsState, Map<String, dynamic>> {
  favorites_listPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<FavsState>(
              adapter: null, slots: <String, Dependent<FavsState>>{}),
          middleware: <Middleware<FavsState>>[],
        );
}
