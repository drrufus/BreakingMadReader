import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zond/widgets/article_page.dart';
import 'package:zond/models/article.dart';

class ArticleCard extends StatelessWidget {

  final Article _model;

  ArticleCard(this._model);

  openArticle(BuildContext context) {
    print('Opening article "${_model.title}"');
    Navigator.push(context, MaterialPageRoute(builder: (context) => ArticlePage(_model)));
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
                },
              )
            ],
          )
        ],
      ),
    );
  }

}