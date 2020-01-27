import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CounterState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    color: Colors.yellow,
    child: Center(
      child: Column(
        children: <Widget>[
          Text('Counter: ${state.someCount}'),
          FlatButton(
            child: Text('Increment'),
            onPressed: () {
              dispatch(counterActionCreator.onIncrement());
            },
          )
        ],
      ),
    ),
  );
}
