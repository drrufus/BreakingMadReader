import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:zond/models/article.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'dart:convert' show utf8;

Future<List<Article>> loadArticles([int page = 1]) async {
  print('Loading news from page #$page');
  var response = await http.get('http://breakingmad.me/ru/?page=$page');
  var document = parse(response.body);
  var articles = document.getElementsByClassName('news-row').map((Element element) {
    final String decodedHeader = element.getElementsByTagName('h2')[0].text;
    final String decodedContent = element.getElementsByClassName('news-full-forspecial')[0].text;
    try {
      final String encodedHeader = utf8.decode(decodedHeader.codeUnits);
      final String encodedContent = utf8.decode(decodedContent.codeUnits);
      return Article(encodedHeader, encodedContent);
    } on FormatException catch (e) {
      return null;
    }
  }).where((e) => e != null).toList();
  return articles;
}