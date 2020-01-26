import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zond/components/news_list.dart';
import 'package:zond/storage/favs/page.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BreakingMad Reader'),
      ),
      body: NewsList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),
        onPressed: () {
          print('Opening favs');
          Navigator.push(context, MaterialPageRoute(builder: (context) => favorites_listPage().buildPage(null)));
        },
      ),
    );
  }

}