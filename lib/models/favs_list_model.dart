import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:zond/models/article.dart';

class FavsListModel extends ChangeNotifier {

  final List<Article> _items = [];

  UnmodifiableListView<Article> get items => UnmodifiableListView(_items);

  int get totalCount => _items.length;

  void add(Article article) {
    print('Adding a new article to the favs');
    _items.add(article);
    notifyListeners();
  }

}