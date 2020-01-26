import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:zond/components/favs_list.dart';
import 'package:zond/components/news_list.dart';
import 'package:zond/storage/page.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(AppState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('BreakingMad Reader'),
    ),
    body: NewsList(state, dispatch),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.favorite),
      onPressed: () {
        print('Opening favs');
        Navigator.push(viewService.context, MaterialPageRoute(builder: (context) => FavsList(state, dispatch)));
      },
    ),
  );
}
