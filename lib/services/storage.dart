import 'dart:io';
import 'dart:async';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:zond/models/article.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider dbProvider = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDb();
    return _database;
  }

  initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "BMR.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE Favs ("
              "id INTEGER PRIMARY KEY,"
              "title TEXT,"
              "content TEXT"
              ")");
        });
  }

  addToFavs(Article article) async {
    final db = await database;
    var res = await db.rawInsert('INSERT into Favs (id, title, content) '
        'VALUES (${article.id}, \'${article.title}\', \'${article.text}\')');
  }

  getAllFavs() async {
    final db = await database;
    var res = await db.query('Favs');
    List<Article> list = res.isNotEmpty ? res.map((a) =>
        Article(a['id'], a['title'], a['content'])).toList() : [];
    return list;
  }

  deleteById(int id) async {
    final db = await database;
    db.delete('Favs', where: 'id = ?', whereArgs: [id]);
  }
}
