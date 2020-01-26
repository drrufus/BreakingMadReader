import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zond/components/news_list.dart';
import 'package:zond/components/news_list_2.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BreakingMad Reader'),
      ),
      body: NewsList2(),
    );
  }

}