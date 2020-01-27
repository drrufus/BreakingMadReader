import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zond/widgets/article_card.dart';
import 'package:zond/models/article.dart';
import 'package:zond/services/api.dart';

class NewsList extends StatefulWidget {

  NewsList();

  @override
  State<StatefulWidget> createState() {
    return _NewsListState();
  }
}

class _NewsListState extends State {

  int _currentPage = 0;
  bool _isLoading = false;
  ScrollController _controller;
  List<Future<List<Article>>> articleFutures;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    articleFutures = [loadNextPage()];
    super.initState();
  }

  void _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      if (!_isLoading) {
        setState(() {
          print("reach the bottom");
          articleFutures = [...articleFutures, loadNextPage()];
        });
      }
    }
  }

  Future<List<Article>> loadNextPage() async {
    _isLoading = true;
    print('Loading page ${_currentPage + 1}');
    var articles = await loadArticles(_currentPage + 1);
    setState(() {
      _currentPage -=- 1;
    });
    _isLoading = false;
    return articles;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: _controller,
      children: <Widget>[
        for (var f in articleFutures)
          FutureBuilder(
            future: f,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Text('error');
                  } else {
                    return Column(
                      children: <Widget>[
                        for (var article in snapshot.data)
                          ArticleCard(article)
                      ],
                    );
                  }
                  break;
                default:
                  return Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        CircularProgressIndicator(),
                        Center(
                          child: Text('Загрузка...'),
                        )
                      ],
                    ),
                  );
              }
            },
          )
      ],
    );
  }
}
