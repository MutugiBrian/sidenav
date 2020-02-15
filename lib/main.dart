import 'package:flutter/material.dart';
import 'package:sidenav/base/base.dart';
import 'package:sidenav/common_scaffold.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lotus Widgets',
      theme: ThemeData(
        primaryColor: mainColor
      ),
      home: CommonScaffold()
    );
  }
}