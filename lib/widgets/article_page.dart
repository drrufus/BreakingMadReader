import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zond/models/article.dart';
import 'package:share/share.dart';

class ArticlePage extends StatelessWidget {
  final Article _model;

  ArticlePage(this._model);

  void _shareTitle() {
    Share.share(_model.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_model.title),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            /*Container(
              child: FloatingActionButton(
                onPressed: () {

                },
                child: Icon(Icons.favorite),
                heroTag: 'btn1',
              ),
              margin: EdgeInsets.only(bottom: 10),
            ),*/
            FloatingActionButton(
              onPressed: () {
                _shareTitle();
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
