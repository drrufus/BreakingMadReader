import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zond/widgets/article_card.dart';
import 'package:zond/pages/main_page/state.dart';

class FavsList extends StatelessWidget {

  AppState _state;
  Dispatch _dispatch;

  FavsList(this._state, this._dispatch);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Избранное'),
      ),
      body: ListView(
        children: <Widget>[
          for (var article in _state.favorites_list)
            ArticleCard(article, _dispatch)
        ],
      ),
    );
  }

}
