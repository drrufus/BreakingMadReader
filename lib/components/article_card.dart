import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zond/components/article_page.dart';
import 'package:zond/models/article.dart';
import 'package:zond/storage/action.dart';

class ArticleCard extends StatelessWidget {

  final Article _model;
  Dispatch _dispatch;

  ArticleCard(this._model, this._dispatch);

  openArticle(BuildContext context) {
    print('Opening article "${_model.title}"');
    Navigator.push(context, MaterialPageRoute(builder: (context) => ArticlePage(_model, _dispatch)));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.all(10),
            leading: Icon(Icons.new_releases),
            title: Text(_model.title),
            //subtitle: Text(_model.text),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('ОТКРЫТЬ'),
                onPressed: () { openArticle(context); },
              ),
              FlatButton(
                child: const Text('СОХРАНИТЬ'),
                onPressed: () {
                  print('Save button clicked');
                  _dispatch(FavsActionsCreator.addToFavs(_model));
                },
              )
            ],
          )
        ],
      ),
    );
  }

}