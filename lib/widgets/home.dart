import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zond/widgets/favs_list.dart';
import 'package:zond/widgets/news_list.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BreakingMad Reader'),
      ),
      body: NewsList(), //viewService.buildComponent('counter'),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),
        onPressed: () {
          print('Opening favs');
          Navigator.push(context, MaterialPageRoute(builder: (context) => FavsList()));
        },
      ),
    );
  }

}