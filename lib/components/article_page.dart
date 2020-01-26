import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zond/models/article.dart';
import 'package:zond/storage/action.dart';

class ArticlePage extends StatelessWidget {
  final Article _model;

  Dispatch _dispatch;

  ArticlePage(this._model, this._dispatch);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_model.title),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              child: FloatingActionButton(
                onPressed: () {
                  _dispatch(FavsActionsCreator.addToFavs(_model));
                },
                child: Icon(Icons.favorite),
                heroTag: 'btn1',
              ),
              margin: EdgeInsets.only(bottom: 10),
            ),
            FloatingActionButton(
              onPressed: () {
                _dispatch(FavsActionsCreator.removeFromFavs(_model));
              },
              child: Icon(Icons.share),
              heroTag: 'btn2',
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            Card(
                margin: EdgeInsets.all(12),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    _model.text,
                    style: TextStyle(fontSize: 20, height: 1.2),
                  ),
                ))
          ],
        ));
  }
}
