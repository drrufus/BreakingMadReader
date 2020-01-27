import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zond/widgets/article_card.dart';

class FavsList extends StatelessWidget {

  FavsList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Избранное'),
      ),
      body: ListView(
        children: <Widget>[
          for (var article in [])
            ArticleCard(article)
        ],
      ),
    );
  }

}
