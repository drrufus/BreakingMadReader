import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:zond/models/article.dart';
import 'package:zond/services/storage.dart';

class FavsListModel extends ChangeNotifier {

  final List<Article> _items = [];

  UnmodifiableListView<Article> get items => UnmodifiableListView(_items);

  int get totalCount => _items.length;

  _loadEntitiesFromDb() async {
    List<Article> articles = await DBProvider.dbProvider.getAllFavs();
    print('Loaded articles from db: ${articles.length}');
    _items.addAll(articles);
    notifyListeners();
  }

  FavsListModel() {
    print('State initialization...');
    _loadEntitiesFromDb();
  }

  void add(Article article) {
    print('Adding a new article to the favs');
    _items.add(article);
    DBProvider.dbProvider.addToFavs(article); // async task!
    notifyListeners();
  }

  void remove(Article article) {
    _items.removeWhere((a) => a.id == article.id);
    DBProvider.dbProvider.deleteById(article.id);
    notifyListeners();
  }

  bool isArticleInFavs(Article article) {
    return _items.where((a) => a.id == article.id).isNotEmpty;
  }

}