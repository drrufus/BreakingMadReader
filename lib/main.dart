import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zond/widgets/home.dart';

import 'models/favs_list_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavsListModel(),
      child: MaterialApp(
        title: 'BreakingMad Reader',
        debugShowCheckedModeBanner: true,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}