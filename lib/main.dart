import 'package:flutter/material.dart';
// import 'pages/MineField/main.dart';
import 'pages/Matrix/main.dart';
// import 'pages/MineFieldsList/main.dart';
import './store/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Store.bind(
      context,
      MaterialApp(
        title: '脑力曲线',
        theme: ThemeData(
          // primarySwatch: Colors.,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/matrix': (context) => Matrix(),
          // '/mineFieldsList': (context) => MineFieldsList(),
          // '/mineField': (context) => MineField()
        },
        home: Matrix(),
      ),
    );
  }
}
