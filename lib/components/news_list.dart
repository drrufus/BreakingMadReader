import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zond/components/article_card.dart';
import 'package:zond/models/article.dart';
import 'package:zond/services/api.dart';

class NewsList extends StatelessWidget {

  Future<List<Article>> loadPage(int pageIndex) async {
    print('Retrieving a page №$pageIndex');
    var newPage = await loadArticles(pageIndex);
    return newPage;
  }

  @override
  Widget build(BuildContext context) {
    print('--building--');
    return ListView.builder(
      itemBuilder: (context, index) {
        return FutureBuilder<List<Article>>(
          future: loadPage(index),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Text(
                      'Some error has been occurres: ${snapshot.error}');
                } else {
                  return Column(
                    children: <Widget>[
                      for (var article in snapshot.data) ArticleCard(article)
                    ],
                  );
                }
                break;
              default:
                return Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.all(50),
                  child: Column(
                    children: <Widget>[
                      CircularProgressIndicator()
                    ],
                  )
                );
            }
          },
        );
      },
    );
  }
}
