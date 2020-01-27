import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:zond/models/favs_list_model.dart';
import 'package:zond/widgets/article_card.dart';

class FavsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<FavsListModel>(
      builder: (context, favs, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Избранное'),
          ),
          body: ListView(
            children: <Widget>[
              for (var article in favs.items)
                ArticleCard(article)
            ],
          ),
        );
      },
    );
  }

}
