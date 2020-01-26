import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zond/components/article_card.dart';
import 'package:zond/models/article.dart';
import 'package:zond/services/api.dart';
import 'package:zond/storage/state.dart';

class NewsList extends StatefulWidget {

  AppState _state;
  Dispatch _dispatch;

  NewsList(this._state, this._dispatch);

  @override
  State<StatefulWidget> createState() {
    return _NewsListState(_state, _dispatch);
  }
}

class _NewsListState extends State {

  AppState _state;
  Dispatch _dispatch;

  int _currentPage = 0;
  bool _isLoading = false;
  ScrollController _controller;
  List<Future<List<Article>>> articleFutures;

  _NewsListState(this._state, this._dispatch);

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
                          ArticleCard(article, _dispatch)
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
